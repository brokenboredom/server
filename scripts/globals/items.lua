-----------------------------------
-- Items
-- Item table by ID (used by quests)
-----------------------------------
xi = xi or {}

xi.items =
{
    IMPERIAL_STANDARD               = 129,
    TABLEWARE_SET                   = 132,
    TEA_SET                         = 133,
    COPY_OF_ANCIENT_BLOOD           = 206,
    PRISHE_STATUE                   = 277,
    NANAA_MIHGO_STATUE              = 286,
    CANTEEN_OF_DRACHENFALL_WATER    = 492,
    BRASS_CANTEEN                   = 493,
    SHEEPSKIN                       = 505,
    MAGICMART_FLYER                 = 532,
    STARFALL_TEAR                   = 546,
    TOMB_GUARDS_WATERSKIN           = 547,
    LOCK_OF_HIWONS_HAIR             = 552,
    DIVINATION_SPHERE               = 556,
    AHRIMAN_LENS                    = 557,
    TARUT_CARD_THE_FOOL             = 558,
    TARUT_CARD_DEATH                = 559,
    PINCH_OF_ZERUHN_SOOT            = 560,
    TARUT_CARD_THE_KING             = 561,
    TARUT_CARD_THE_HERMIT           = 562,
    SKIN_OF_WELL_WATER              = 567,
    CLAY_TABLET                     = 570,
    LUMP_OF_SELBINA_CLAY            = 571,
    SIRENS_TEAR                     = 576,
    EAGLE_BUTTON                    = 578,
    GILT_GLASSES                    = 579,
    SUPPLIES_ORDER                  = 592,
    PARCEL_FOR_THE_MAGIC_SHOP       = 593,
    CHUNK_OF_MINE_GRAVEL            = 597,
    SHARP_STONE                     = 598,
    DOSE_OF_OINTMENT                = 600,
    OINTMENT_CASE                   = 601,
    BLESSED_WATERSKIN               = 602,
    SKIN_OF_CHEVAL_RIVER_WATER      = 603,
    PICKAXE                         = 605,
    FADED_CRYSTAL                   = 613,
    CHUNK_OF_TIN_ORE                = 641,
    CHUNK_OF_DARKSTEEL_ORE          = 645,
    BRASS_SHEET                     = 661,
    MYTHRIL_SHEET                   = 663,
    PETRIFIED_LOG                   = 703,
    ROSEWOOD_LUMBER                 = 718,
    CHUNK_OF_GOLD_ORE               = 737,
    CHUNK_OF_PLATINUM_ORE           = 738,
    GOLD_BEASTCOIN                  = 748,
    MYTHRIL_BEASTCOIN               = 749,
    GOLD_THREAD                     = 823,
    VELVET_CLOTH                    = 828,
    LIZARD_SKIN                     = 852,
    TIGER_HIDE                      = 861,
    HANDFUL_OF_PUGIL_SCALES         = 868,
    SQUARE_OF_KARAKUL_LEATHER       = 879,
    BONE_CHIP                       = 880,
    BEEHIVE_CHIP                    = 912,
    SHEET_OF_PARCHMENT              = 917,
    LIZARD_TAIL                     = 926,
    CHUNK_OF_ROCK_SALT              = 936,
    JAR_OF_BLACK_INK                = 929,
    SICKLE                          = 1020,
    HATCHET                         = 1021,
    PIECE_OF_ANCIENT_PAPYRUS        = 1088,
    CLUMP_OF_EXORAY_MOLD            = 1089,
    CHUNK_OF_BOMB_COAL              = 1090,
    REGAL_DIE                       = 1092,
    KINDREDS_SEAL                   = 1127,
    NORG_SHELL                      = 1135,
    UNLIT_LANTERN                   = 1138,
    RANCOR_FLAME                    = 1139,
    FLAME_OF_CRIMSON_RANCOR         = 1140,
    FLAME_OF_BLUE_RANCOR            = 1141,
    STAR_SPINEL                     = 1149,
    LUMP_OF_ORIENTAL_STEEL          = 1151,
    LUMP_OF_BOMB_STEEL              = 1152,
    SACRED_BRANCH                   = 1153,
    WYVERN_EGG                      = 1159,
    BANISHING_CHARM                 = 1166,
    OFFERING_TO_UGGALEPIH           = 1183,
    UGGALEPIH_WHISTLE               = 1184,
    ANTICAN_TAG                     = 1190,
    SAHAGIN_KEY                     = 1197,
    SACRED_SPRING                   = 1198,
    TONBERRY_RATTLE                 = 1266,
    LUNGO_NANGO_JADESHELL           = 1450,
    RIMILALA_STRIPESHELL            = 1451,
    MONTIONT_SILVERPIECE            = 1453,
    RANPERRE_GOLDPIECE              = 1454,
    ONE_HUNDRED_BYNE_BILL           = 1456,
    TEN_THOUSAND_BYNE_BILL          = 1457,
    MYSTIC_FRAGMENT                 = 1571,
    ORNATE_FRAGMENT                 = 1572,
    HOLY_FRAGMENT                   = 1573,
    INTRICATE_FRAGMENT              = 1574,
    RUNAEIC_FRAGMENT                = 1575,
    SERAPHIC_FRAGMENT               = 1576,
    TENEBROUS_FRAGMENT              = 1577,
    STELLAR_FRAGMENT                = 1578,
    DEMONIAC_FRAGMENT               = 1579,
    DIVINE_FRAGMENT                 = 1580,
    HEAVENLY_FRAGMENT               = 1581,
    CELESTIAL_FRAGMENT              = 1582,
    SNARLED_FRAGMENT                = 1583,
    MYSTERIAL_FRAGMENT              = 1584,
    ETHEREAL_FRAGMENT               = 1585,
    SHARD_OF_NECROPSYCHE            = 1589,
    SEALION_CREST_KEY               = 1658,
    CORAL_CREST_KEY                 = 1659,
    CATHEDRAL_TAPESTRY              = 1662,
    INGOT_OF_ROYAL_TREASURY_GOLD    = 1682,
    PIECE_OF_ATTOHWA_GINSENG        = 1683,
    SOILED_LETTER                   = 1686,
    HIPPOGRYPH_TAILFEATHER          = 1690,
    EGRET_FISHING_ROD               = 1726,
    FREE_CHOCOPASS                  = 1789,
    SUPERNAL_FRAGMENT               = 1822,
    YAGUDO_HEADDRESS_CUTTING        = 1867,
    SQUARE_OF_LM_BUFFALO_LEATHER    = 2007,
    SQUARE_OF_WOLF_FELT             = 2010,
    IMP_WING                        = 2163,
    WAMOURA_COCOON                  = 2173,
    IMPERIAL_BRONZE_PIECE           = 2184,
    IMPERIAL_SILVER_PIECE           = 2185,
    IMPERIAL_MYTHRIL_PIECE          = 2186,
    IMPERIAL_GOLD_PIECE             = 2187,
    LIGHTNING_BAND                  = 2217,
    LAMIAN_FANG_KEY                 = 2219,
    SQUARE_OF_KARAKUL_CLOTH         = 2288,
    SQUARE_OF_WAMOURA_CLOTH         = 2289,
    CHUNK_OF_IMPERIAL_CERMET        = 2290,
    BLACK_PUPPET_TURBAN             = 2501,
    WHITE_PUPPET_TURBAN             = 2502,
    HEAVY_QUADAV_CHESTPLATE         = 2504,
    HEAVY_QUADAV_BACKPLATE          = 2505,
    LADYBUG_WING                    = 2506,
    ORCISH_PLATE_ARMOR              = 2757,
    QUADAV_BACKSCALE                = 2758,
    YAGUDO_CAULK                    = 2759,
    SEASONING_STONE                 = 3541,
    FOSSILIZED_BONE                 = 3542,
    FOSSILIZED_FANG                 = 3543,
    VELKK_NECKLACE                  = 3928,
    VELKK_MASK                      = 3929,
    TWITHERYM_WING                  = 3930,
    UMBRIL_OOZE                     = 3935,
    FIRE_CRYSTAL                    = 4096,
    EARTH_CRYSTAL                   = 4099,
    WATER_CRYSTAL                   = 4101,
    DARK_CRYSTAL                    = 4103,
    FLASK_OF_SLEEPING_POTION        = 4161,
    SCROLL_OF_INSTANT_WARP          = 4181,
    CRAWLER_EGG                     = 4357,
    SLICE_OF_HARE_MEAT              = 4358,
    DHALMEL_MEAT                    = 4359,
    CLUMP_OF_BATAGREENS             = 4367,
    POT_OF_HONEY                    = 4370,
    SLICE_OF_GRILLED_HARE           = 4371,
    STRIP_OF_MEAT_JERKY             = 4376,
    LAND_CRAB_MEAT                  = 4400,
    BAKED_POPOTO                    = 4436,
    COBALT_JELLYFISH                = 4443,
    SCREAM_FUNGUS                   = 4447,
    PUFFBALL                        = 4448,
    CRESCENT_FISH                   = 4473,
    THREE_EYED_FISH                 = 4478,
    BIRD_EGG                        = 4570,
    SCROLL_OF_CURE_II               = 4610,
    SCROLL_OF_CURE_V                = 4613,
    SCROLL_OF_REGEN                 = 4716,
    SCROLL_OF_FIRE                  = 4752,
    SCROLL_OF_STONE_IV              = 4770,
    SCROLL_OF_ABSORB_INT            = 4878,
    SCROLL_OF_HOJO_ICHI             = 4952,
    ISTAVRIT                        = 5136,
    PITCHER_OF_HOMEMADE_HERBAL_TEA  = 5221,
    BOWL_OF_HOMEMADE_STEW           = 5222,
    CONE_OF_HOMEMADE_GELATO         = 5223,
    HOMEMADE_RICE_BALL              = 5224,
    CHUNK_OF_HOMEMADE_CHEESE        = 5225,
    HOMEMADE_STEAK                  = 5226,
    PLATE_OF_HOMEMADE_SALAD         = 5227,
    LOAF_OF_HOMEMADE_BREAD          = 5228,
    PLATE_OF_HOMEMADE_RISOTTO       = 5229,
    MISTMELT                        = 5265,
    ISTAKOZ                         = 5453,
    MERCANBALIGI                    = 5454,
    AHTAPOT                         = 5455,
    ISTIRIDYE                       = 5456,
    CORSAIR_DIE                     = 5493,
    POT_OF_WHITE_HONEY              = 5562,
    CUP_OF_CHAI                     = 5570,
    IRMIK_HELVASI                   = 5572,
    BOWL_OF_SUTLAC                  = 5577,
    CUP_OF_IMPERIAL_COFFEE          = 5592,
    BOWL_OF_NASHMAU_STEW            = 5595,
    HOMEMADE_SALISBURY_STEAK        = 5705,
    DISH_OF_HOMEMADE_CARBONARA      = 5706,
    HOMEMADE_OMELETTE               = 5707,
    OLDE_RARAB_TAIL                 = 5911,
    PLATE_OF_INDI_POISON            = 6074,
    HARLEQUIN_HEAD                  = 8193,
    HARLEQUIN_FRAME                 = 8224,
    COPPER_AMAN_VOUCHER             = 8711,
    CLUMP_OF_BEE_POLLEN             = 9082,
    MANDRAGORA_DEWDROP              = 9083,
    CIPHER_OF_LIONS_ALTER_EGO_II    = 10159,
    CIPHER_OF_ZEIDS_ALTER_EGO_II    = 10160,
    BENEDIGHT_COAT                  = 11309,
    NEXUS_CAPE                      = 11538,
    BLUE_RIBBON                     = 12521,
    LEATHER_VEST                    = 12568,
    BRONZE_HARNESS                  = 12576,
    KENPOGI                         = 12584,
    ROBE                            = 12600,
    TUNIC                           = 12608,
    LEATHER_GLOVES                  = 12696,
    LIZARD_GLOVES                   = 12697,
    BRONZE_SUBLIGAR                 = 12832,
    LEATHER_GORGET                  = 13081,
    CHAIN_CHOKER                    = 13083,
    TIGER_STOLE                     = 13119,
    BEAST_COLLAR                    = 13121,
    PROMISE_BADGE                   = 13135,
    STAR_NECKLACE                   = 13136,
    WILLPOWER_TORQUE                = 13174,
    WING_PENDANT                    = 13183,
    BRASS_RING                      = 13465,
    PURPLE_RIBBON                   = 13569,
    BRIDAL_CORSAGE                  = 13933,
    WEDDING_BOOTS                   = 14126,
    WEDDING_HOSE                    = 14251,
    WEDDING_DRESS                   = 14386,
    DUCAL_GUARDS_RING               = 14657,
    CUNNING_EARRING                 = 14760,
    TRAINEE_GLOVES                  = 15008,
    ANCILE                          = 15069,
    AEGIS                           = 15070,
    YAGUDO_HEADGEAR                 = 15202,
    TSOO_HAJAS_HEADGEAR             = 15216,
    CORSAIRS_BOTTES                 = 15685,
    OLDUUM_RING                     = 15769,
    BALRAHNS_RING                   = 15807,
    ULTHALAMS_RING                  = 15808,
    JALZAHNS_RING                   = 15809,
    MATRIMONY_RING                  = 15847,
    MATRIMONY_BAND                  = 15848,
    RAISING_EARRING                 = 16003,
    CHANOIXS_GORGET                 = 16270,
    BENEDIGHT_HOSE                  = 16364,
    PATAS                           = 16419,
    MINSTRELS_DAGGER                = 16487,
    MYTHRIL_PICK                    = 16651,
    LIGHT_AXE                       = 16667,
    MYTHRIL_PICK_HQ                 = 16670,
    AXE_OF_TRIALS                   = 16735,
    SCYTHE_OF_TRIALS                = 16793,
    SPEAR_OF_TRIALS                 = 16892,
    SWORD_OF_TRIALS                 = 16952,
    HEAVY_CROSSBOW                  = 17220,
    ICE_ARROW                       = 17323,
    WILLOW_FISHING_ROD              = 17391,
    CLUB_OF_TRIALS                  = 17456,
    KNUCKLES_OF_TRIALS              = 17507,
    POLE_OF_TRIALS                  = 17527,
    DAGGER_OF_TRIALS                = 17616,
    BUCCANEERS_KNIFE                = 17622,
    BARTHOLOMEWS_KNIFE              = 17623,
    SAPARA_OF_TRIALS                = 17654,
    KODACHI_OF_TRIALS               = 17773,
    MUMEITO                         = 17809,
    TACHI_OF_TRIALS                 = 17815,
    TURBO_ANIMATOR                  = 17858,
    ANIMATOR                        = 17859,
    PICK_OF_TRIALS                  = 17933,
    BOW_OF_TRIALS                   = 18144,
    GUN_OF_TRIALS                   = 18146,
    BIBIKI_SEASHELL                 = 18257,
    CAESTUS                         = 18263,
    SPHARAI                         = 18264,
    BATARDEAU                       = 18269,
    MANDAU                          = 18270,
    CALIBURN                        = 18275,
    EXCALIBUR                       = 18276,
    VALHALLA                        = 18281,
    RAGNAROK                        = 18282,
    OGRE_KILLER                     = 18287,
    GUTTLER                         = 18288,
    ABADDON_KILLER                  = 18293,
    BRAVURA                         = 18294,
    GAE_ASSAIL                      = 18299,
    GUNGNIR                         = 18300,
    BEC_DE_FAUCON                   = 18305,
    APOCALYPSE                      = 18306,
    YOSHIMITSU                      = 18311,
    KIKOKU                          = 18312,
    TOTSUKANOTSURUGI                = 18317,
    AMANOMURAKUMO                   = 18318,
    GULLINTANI                      = 18323,
    MJOLLNIR                        = 18324,
    THYRUS                          = 18329,
    CLAUSTRUM                       = 18330,
    FERDINAND                       = 18335,
    ANNIHILATOR                     = 18336,
    MILLENNIUM_HORN                 = 18341,
    GJALLARHORN                     = 18342,
    FUTATOKOROTO                    = 18347,
    YOICHINOYUMI                    = 18348,
    TRUMP_GUN                       = 18702,
    TRAINEE_HAMMER                  = 18855,
    SOWILO_CLAYMORE                 = 20781,
    CHRONO_BULLET                   = 21296,
    CHRONO_ARROW                    = 21297,
    ARTEMIS_ARROW                   = 21298,
    YOICHIS_ARROW                   = 21299,
    QUELLING_BOLT                   = 21311,
    DEVASTATING_BULLET              = 21325,
    LIVING_BULLET                   = 21326,
    ERADICATING_BULLET              = 21327,
    MATRE_BELL                      = 21460,
}
