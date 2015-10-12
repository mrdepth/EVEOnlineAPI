/*
 *  EVEGlobals.h
 *  EVEOnlineAPI
 *
 *  Created by Artem Shimanski on 5/31/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

//#define EVEOnlineAPIHost @"https://api.eve-online.com"
#define EVEOnlineAPIHost @"https://api.eveonline.com"
#define EVEOnlineErrorDomain @"EVEOnlineAPI"

typedef NS_ENUM(int32_t, EVEErrorCodes) {
	EVEErrorCodeInvalidImageSize = 1000,
	EVEErrorCodeInvalidAPIKeyType,
};

#define EVEErrorCodeInvalidImageSizeText @"Invalid image size"
#define EVEErrorCodeInvalidAPIKeyTypeText @"Invalid api key type"

typedef NS_ENUM(int32_t, EVEApiKeyType) {
	EVEApiKeyTypeNone,
	EVEApiKeyTypeLimited,
	EVEApiKeyTypeFull
};

typedef NS_ENUM(int32_t, EVEInventoryFlag) {
	EVEInventoryFlagNone = 0,
	EVEInventoryFlagWallet = 1,
	EVEInventoryFlagFactory = 2,
	EVEInventoryFlagHangar = 4,
	EVEInventoryFlagCargo = 5,
	EVEInventoryFlagBriefcase = 6,
	EVEInventoryFlagSkill = 7,
	EVEInventoryFlagReward = 8,
	EVEInventoryFlagConnected = 9,
	EVEInventoryFlagDisconnected = 10,
	EVEInventoryFlagLoSlot0 = 11,
	EVEInventoryFlagLoSlot1 = 12,
	EVEInventoryFlagLoSlot2 = 13,
	EVEInventoryFlagLoSlot3 = 14,
	EVEInventoryFlagLoSlot4 = 15,
	EVEInventoryFlagLoSlot5 = 16,
	EVEInventoryFlagLoSlot6 = 17,
	EVEInventoryFlagLoSlot7 = 18,
	EVEInventoryFlagMedSlot0 = 19,
	EVEInventoryFlagMedSlot1 = 20,
	EVEInventoryFlagMedSlot2 = 21,
	EVEInventoryFlagMedSlot3 = 22,
	EVEInventoryFlagMedSlot4 = 23,
	EVEInventoryFlagMedSlot5 = 24,
	EVEInventoryFlagMedSlot6 = 25,
	EVEInventoryFlagMedSlot7 = 26,
	EVEInventoryFlagHiSlot0 = 27,
	EVEInventoryFlagHiSlot1 = 28,
	EVEInventoryFlagHiSlot2 = 29,
	EVEInventoryFlagHiSlot3 = 30,
	EVEInventoryFlagHiSlot4 = 31,
	EVEInventoryFlagHiSlot5 = 32,
	EVEInventoryFlagHiSlot6 = 33,
	EVEInventoryFlagHiSlot7 = 34,
	EVEInventoryFlagFixedSlot = 35,
	EVEInventoryFlagCapsule = 56,
	EVEInventoryFlagPilot = 57,
	EVEInventoryFlagPassenger = 58,
	EVEInventoryFlagBoardingGate =59,
	EVEInventoryFlagCrew = 60,
	EVEInventoryFlagSkillInTraining = 61,
	EVEInventoryFlagCorpMarket = 62,
	EVEInventoryFlagLocked = 63,
	EVEInventoryFlagUnlocked = 64,
	EVEInventoryFlagOfficeSlot1 = 70,
	EVEInventoryFlagOfficeSlot2 = 71,
	EVEInventoryFlagOfficeSlot3 = 72,
	EVEInventoryFlagOfficeSlot4 = 73,
	EVEInventoryFlagOfficeSlot5 = 74,
	EVEInventoryFlagOfficeSlot6 = 75,
	EVEInventoryFlagOfficeSlot7 = 76,
	EVEInventoryFlagOfficeSlot8 = 77,
	EVEInventoryFlagOfficeSlot9 = 78,
	EVEInventoryFlagOfficeSlot10 = 79,
	EVEInventoryFlagOfficeSlot11 = 80,
	EVEInventoryFlagOfficeSlot12 = 81,
	EVEInventoryFlagOfficeSlot13 = 82,
	EVEInventoryFlagOfficeSlot14 = 83,
	EVEInventoryFlagOfficeSlot15 = 84,
	EVEInventoryFlagOfficeSlot16 = 85,
	EVEInventoryFlagBonus = 86,
	EVEInventoryFlagDroneBay = 87,
	EVEInventoryFlagBooster = 88,
	EVEInventoryFlagImplant = 89,
	EVEInventoryFlagShipHangar = 90,
	EVEInventoryFlagShipOffline = 91,
	EVEInventoryFlagRigSlot0 = 92,
	EVEInventoryFlagRigSlot1 = 93,
	EVEInventoryFlagRigSlot2 = 94,
	EVEInventoryFlagRigSlot3 = 95,
	EVEInventoryFlagRigSlot4 = 96,
	EVEInventoryFlagRigSlot5 = 97,
	EVEInventoryFlagRigSlot6 = 98,
	EVEInventoryFlagRigSlot7 = 99,
	EVEInventoryFlagFactoryOperation = 100,
	EVEInventoryFlagCorpSAG2 = 116,
	EVEInventoryFlagCorpSAG3 = 117,
	EVEInventoryFlagCorpSAG4 = 118,
	EVEInventoryFlagCorpSAG5 = 119,
	EVEInventoryFlagCorpSAG6 = 120,
	EVEInventoryFlagCorpSAG7 = 121,
	EVEInventoryFlagSecondaryStorage = 122,
	EVEInventoryFlagCaptainsQuarters = 123,
	EVEInventoryFlagWisPromenade = 124,
	EVEInventoryFlagSubSystem0 = 125,
	EVEInventoryFlagSubSystem1 = 126,
	EVEInventoryFlagSubSystem2 = 127,
	EVEInventoryFlagSubSystem3 = 128,
	EVEInventoryFlagSubSystem4 = 129,
	EVEInventoryFlagSubSystem5 = 130,
	EVEInventoryFlagSubSystem6 = 131,
	EVEInventoryFlagSubSystem7 = 132,
	EVEInventoryFlagSpecializedFuelBay = 133,
	EVEInventoryFlagSpecializedOreHold = 134,
	EVEInventoryFlagSpecializedGasHold = 135,
	EVEInventoryFlagSpecializedMineralHold = 136,
	EVEInventoryFlagSpecializedSalvageHold = 137,
	EVEInventoryFlagSpecializedShipHold = 138,
	EVEInventoryFlagSpecializedSmallShipHold = 139,
	EVEInventoryFlagSpecializedMediumShipHold = 140,
	EVEInventoryFlagSpecializedLargeShipHold = 141,
	EVEInventoryFlagSpecializedIndustrialShipHold = 142,
	EVEInventoryFlagSpecializedAmmoHold = 143,
	EVEInventoryFlagStructureActive = 144,
	EVEInventoryFlagStructureInactive = 145,
	EVEInventoryFlagJunkyardReprocessed = 146,
	EVEInventoryFlagJunkyardTrashed = 147
};

typedef NS_ENUM(int32_t, EVECharacterAttribute) {
	EVECharacterAttributeIntelligence,
	EVECharacterAttributeMemory,
	EVECharacterAttributeCharisma,
	EVECharacterAttributePerception,
	EVECharacterAttributeWillpower
};

typedef NS_ENUM(int32_t, EVEOrderState) {
	EVEOrderStateOpen = 0,
	EVEOrderStateClosed = 1,
	EVEOrderStateExpired = 2,
	EVEOrderStateCancelled = 3,
	EVEOrderStatePending = 4,
	EVEOrderStateCharacterDeleted = 5
};

typedef NS_ENUM(int32_t, EVEPOSState) {
	EVEPOSStateUnanchored = 0,
	EVEPOSStateAnchoredOffline = 1,
	EVEPOSStateOnlining = 2,
	EVEPOSStateReinforced = 3,
	EVEPOSStateOnline = 4
};

typedef NS_ENUM(int32_t, EVEContractType) {
	EVEContractTypeUnknown = -1,
	EVEContractTypeItemExchange = 0,
	EVEContractTypeAuction,
	EVEContractTypeLoan,
	EVEContractTypeCourier
};

typedef NS_ENUM(int32_t, EVEContractStatus) {
	EVEContractStatusUnknown = -1,
	EVEContractStatusCompleted = 0,
	EVEContractStatusCompletedByIssuer,
	EVEContractStatusCompletedByContractor,
	EVEContractStatusOutstanding,
	EVEContractStatusInProgress,
	EVEContractStatusCancelled,
	EVEContractStatusReversed,
	EVEContractStatusRejected,
	EVEContractStatusFailed,
	EVEContractStatusDeleted
};

typedef NS_ENUM(int32_t, EVEContractavAilability) {
	EVEContractavAilabilityPublic = 0,
	EVEContractavAilabilityPrivate
};

typedef NS_ENUM(int32_t, EVECallType) {
	EVECallTypeCharacter = 0,
	EVECallTypeCorporation,
};

typedef NS_ENUM(int32_t, EVEAPIKeyType) {
	EVEAPIKeyTypeAccount = 0,
	EVEAPIKeyTypeCharacter,
	EVEAPIKeyTypeCorporation
};

typedef NS_ENUM(int32_t, EVEIndustryJobStatus) {
	EVEIndustryJobStatusActive = 1,
	EVEIndustryJobStatusPaused = 2,
	EVEIndustryJobStatusReady = 3,
	EVEIndustryJobStatusDelivered = 101,
	EVEIndustryJobStatusCancelled = 102,
	EVEIndustryJobStatusReverted = 103
};

