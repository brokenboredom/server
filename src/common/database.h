﻿/*
===========================================================================

  Copyright (c) 2024 LandSandBoat Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#pragma once

#include "cbasetypes.h"
#include "mutex_guarded.h"
#include "tracy.h"

#include <memory>
#include <string>
#include <unordered_map>

#include <conncpp.hpp>

enum class PreparedStatement
{
    Search_GetSearchComment,
};

// @note Everything in database-land is 1-indexed, not 0-indexed.
// TODO: Rename this namespace from db to sql when migration is complete.
// mariadb-connector-cpp uses sql namespace for all of its classes, so it
// will be clearer if we use it too.
namespace db
{
    namespace detail
    {
        struct State
        {
            std::unique_ptr<sql::Connection> connection;

            // TODO: Just make everything lazy?
            std::unordered_map<PreparedStatement, std::pair<std::string, std::unique_ptr<sql::PreparedStatement>>> preparedStatements;
            std::unordered_map<std::string, std::unique_ptr<sql::PreparedStatement>>                               lazyPreparedStatements;
        };

        auto getState() -> mutex_guarded<db::detail::State>&;

        // Base case
        inline void binder(std::unique_ptr<sql::PreparedStatement>& stmt, int& counter)
        {
        }

        template <typename T, typename... Args>
        void binder(std::unique_ptr<sql::PreparedStatement>& stmt, int& counter, T&& first, Args&&... rest)
        {
            if constexpr (std::is_same_v<std::decay_t<T>, signed int>)
            {
                stmt->setInt(counter, first);
            }
            else if constexpr (std::is_same_v<std::decay_t<T>, unsigned int>)
            {
                stmt->setUInt(counter, first);
            }
            else if constexpr (std::is_same_v<std::decay_t<T>, signed short>)
            {
                stmt->setShort(counter, first);
            }
            else if constexpr (std::is_same_v<std::decay_t<T>, int8>)
            {
                stmt->setByte(counter, first);
            }
            else if constexpr (std::is_same_v<std::decay_t<T>, bool>)
            {
                stmt->setBoolean(counter, first);
            }
            else if constexpr (std::is_same_v<std::decay_t<T>, double>)
            {
                stmt->setDouble(counter, first);
            }
            else if constexpr (std::is_same_v<std::decay_t<T>, float>)
            {
                stmt->setFloat(counter, first);
            }
            else if constexpr (std::is_same_v<std::decay_t<T>, std::string>)
            {
                stmt->setString(counter, first.c_str());
            }
            else if constexpr (std::is_convertible_v<T, const char*>)
            {
                stmt->setString(counter, first);
            }

            ++counter;

            binder(stmt, counter, rest...);
        }
    } // namespace detail

    // @brief Execute a prepared statement with the given arguments.
    // @param preparedStmt The prepared statement to execute.
    // @param args The arguments to bind to the prepared statement.
    // @return A unique pointer to the result set of the query.
    // @note Everything in database-land is 1-indexed, not 0-indexed.
    template <typename... Args>
    std::unique_ptr<sql::ResultSet> preparedStmt(PreparedStatement preparedStmt, Args&&... args)
    {
        TracyZoneScoped;

        // clang-format off
        return detail::getState().write([&](detail::State& state) -> std::unique_ptr<sql::ResultSet>
        {
            auto& preparedStatements = state.preparedStatements;

            if (preparedStatements.find(preparedStmt) == preparedStatements.end())
            {
                ShowError("Bad prepared stmt");
                return nullptr;
            }

            auto& stmt = preparedStatements[preparedStmt].second;
            TracyZoneString(preparedStatements[preparedStmt].first);
            try
            {
                // NOTE: 1-indexed!
                auto counter = 1;
                db::detail::binder(stmt, counter, std::forward<Args>(args)...);
                return std::unique_ptr<sql::ResultSet>(stmt->executeQuery());
            }
            catch (const std::exception& e)
            {
                ShowError("Query Failed: %s", str(preparedStatements[preparedStmt].first.c_str()));
                ShowError(e.what());
                return nullptr;
            }
        });
        // clang-format on
    }

    // @brief Execute a prepared statement with the given query string and arguments.
    // @param query The query string to execute.
    // @param args The arguments to bind to the prepared statement.
    // @return A unique pointer to the result set of the query.
    // @note If the query hasn't been seen before it will generate a prepared statement for it to be used immediately and in the future.
    // @note Everything in database-land is 1-indexed, not 0-indexed.
    template <typename... Args>
    std::unique_ptr<sql::ResultSet> preparedStmt(std::string const& query, Args&&... args)
    {
        TracyZoneScoped;
        TracyZoneString(query);

        // clang-format off
        return detail::getState().write([&](detail::State& state) -> std::unique_ptr<sql::ResultSet>
        {
            auto& lazyPreparedStatements = state.lazyPreparedStatements;

            // TODO: combine the two versions of this function into one, with the string-handling version
            // just being a wrapped which does the lookup below and then calls the enum version.

            // If we don't have it, lazily make it
            if (lazyPreparedStatements.find(query) == lazyPreparedStatements.end())
            {
                try
                {
                    lazyPreparedStatements[query] = std::unique_ptr<sql::PreparedStatement>(state.connection->prepareStatement(query.c_str()));
                }
                catch (const std::exception& e)
                {
                    ShowError("Failed to lazy prepare query: %s", str(query.c_str()));
                    ShowError(e.what());
                    return nullptr;
                }
            }

            auto& stmt = lazyPreparedStatements[query];
            try
            {
                // NOTE: 1-indexed!
                auto counter = 1;
                db::detail::binder(stmt, counter, std::forward<Args>(args)...);
                return std::unique_ptr<sql::ResultSet>(stmt->executeQuery());
            }
            catch (const std::exception& e)
            {
                ShowError("Query Failed: %s", str(query.c_str()));
                ShowError(e.what());
                return nullptr;
            }
        });
        // clang-format on
    }

    // @brief Encode a struct to a blob string.
    // @param source The struct to encode.
    // @return A string containing the encoded struct.
    template <typename T>
    std::string encodeToBlob(T& source)
    {
        TracyZoneScoped;

        std::string blobString;
        blobString.resize(sizeof(T));
        std::memcpy(&blobString[0], &source, sizeof(T));
        return blobString;
    }

    // @brief Extract a struct from a blob string.
    // @param rset The result set to extract the blob from.
    // @param blobKey The key of the blob in the result set.
    // @param destination The struct to extract the blob into.
    template <typename T>
    void extractFromBlob(std::unique_ptr<sql::ResultSet>& rset, std::string const& blobKey, T& destination)
    {
        TracyZoneScoped;

        std::unique_ptr<std::istream> inStr(rset->getBlob(blobKey.c_str()));
        if (!inStr)
        {
            std::memset(&destination, 0x00, sizeof(T));
            return;
        }

        char buff[sizeof(T)];
        while (!inStr->eof())
        {
            inStr->read(buff, sizeof(buff));
        }

        std::memcpy(&destination, buff, sizeof(T));
    }

    // @brief Execute a query with the given query string.
    // @param query The query string to execute.
    // @return A unique pointer to the result set of the query.
    // @note Everything in database-land is 1-indexed, not 0-indexed.
    auto query(std::string_view query) -> std::unique_ptr<sql::ResultSet>;
} // namespace db
