﻿/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

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

#ifndef _CSYNTH_SUGGESTION_H
#define _CSYNTH_SUGGESTION_H

#include "common/cbasetypes.h"

#include "basic.h"

const std::vector<std::string> craftSkillDbNames = {
    "Wood",
    "Smith",
    "Gold",
    "Cloth",
    "Leather",
    "Bone",
    "Alchemy",
    "Cook",
};

class CSynthSuggestionListPacket : public CBasicPacket
{
public:
    CSynthSuggestionListPacket(uint16 skillID, uint16 skillLevel, uint8 skillRank, uint16 resultOffset);
};

class CSynthSuggestionRecipePacket : public CBasicPacket
{
public:
    CSynthSuggestionRecipePacket(uint16 skillID, uint16 skillLevel, uint8 skillRank, uint16 selectedRecipeOffset);
};

#endif
