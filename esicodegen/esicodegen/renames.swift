//
//  renames.swift
//  ESI
//
//  Created by Artem Shimanski on 11.04.17.
//  Copyright © 2017 Artem Shimanski. All rights reserved.
//

import Foundation

let typeNames: [String: String] = [
	//MARK: Alliance
	"GetAlliancesAllianceIDOk"	: "Information",
	"GetAlliancesNamesOk"	: "Name",
	"GetAlliancesAllianceIDIconsOk"	: "Icon",
	
	//MARK: Assets
	"GetCharactersCharacterIDAssetsOk"	: "Asset",
	"GetCharactersCharacterIDAssetsLocationFlag"	: "Flag",
	"GetCorporationsCorporationIDAssetsOk"	: "CorpAsset",
	"GetCorporationsCorporationIDAssetsLocationFlag"	: "Flag",

	//MARK: Bookmarks
	"GetCharactersCharacterIDBookmarksFoldersOk"	: "Folder",
	"GetCharactersCharacterIDBookmarksOk"	: "Bookmark",

	//MARK: Calendar
	"PutCharactersCharacterIDCalendarEventIDResponse"	: "Response",
	"GetCharactersCharacterIDCalendarEventResponse"	: "Response",
	"GetCharactersCharacterIDCalendarEventIDOk"	: "Event",
	"GetCharactersCharacterIDCalendarOk"	: "Summary",
	
	//MARK: Character
	"GetCharactersCharacterIDMedalsOk"	: "Medal",
	"GetCharactersCharacterIDStandingsOk"	: "Standing",
	"PostCharactersCharacterIDCspaCreated"	: "CSPAChargeCost",
	"PostCharactersCharacterIDCspaCharacters": "Characters",
	"GetCharactersNamesOk"	: "Name",
	"GetCharactersCharacterIDAgentsResearchOk"	: "Research",
	"PostCharactersAffiliationOk"	: "Affiliation",
	"GetCharactersCharacterIDChatChannelsOk"	: "ChatChannel",
	"GetCharactersCharacterIDPortraitOk"	: "Portrait",
	"GetCharactersCharacterIDCorporationhistoryOk"	: "CorporationHistory",
	"GetCharactersCharacterIDOk"	: "Information",
	"GetCharactersCharacterIDBlueprintsOk"  : "Blueprint",
	"GetCharactersCharacterIDRolesOk"	: "Role",
	"GetCharactersCharacterIDFatigueOk"	: "Fatigue",

	//MARK: Clones
	"GetCharactersCharacterIDClonesOk"	: "JumpClones",
	"GetCharactersCharacterIDClonesLocationType"	: "LocationType",
	"GetCharactersCharacterIDClonesJumpClones"	: "JumpClone",
	"GetCharactersCharacterIDClonesHomeLocation"	: "Location",
	
	//MARK: Contacts
	"GetCharactersCharacterIDContactsLabelsOk"	: "Label",
	"GetCharactersCharacterIDContactsOk"	: "Contact",
	
	//MARK: Contracts
	
	"GetCharactersCharacterIDContractsOk"	: "Contract",
	"GetCharactersCharacterIDContractsContractIDBidsOk"	: "Bid",
	"GetCharactersCharacterIDContractsContractIDItemsOk"	: "Item",
	"GetCharactersCharacterIDContractsStatus"	: "Status",
	"GetCharactersCharacterIDContractsType"	: "ContractType",
	"GetCharactersCharacterIDContractsAvailability"	: "Availability",

	//MARK: Corporation
	"GetCorporationsNamesOk"	: "Name",
	"GetCorporationsCorporationIDOk"	: "Information",
	"GetCorporationsCorporationIDStructuresOk"	: "Structure",
	"PutCorporationsCorporationIDStructuresStructureIDNewSchedule"	: "VulnerabilitySchedule",
	"GetCorporationsCorporationIDAlliancehistoryOk"	: "History",
	"GetCorporationsCorporationIDIconsOk"	: "Icon",
	"GetCorporationsCorporationIDMembersOk"	: "Member",
	"GetCorporationsCorporationIDRolesOk"	: "Role",
	"GetCorporationsCorporationIDDivisionsOk"	: "Divisions",
	"GetCorporationsCorporationIDDivisionsWallet"	: "Wallet",
	"GetCorporationsCorporationIDDivisionsHangar"	: "Hangar",

	//MARK: Dogma
	"GetDogmaEffectsEffectIDOk"	: "Effect",
	"GetDogmaAttributesAttributeIDOk"	: "Attribute",
	
	//MARK: FactionWarfare
	"GetFwSystemsOk"	: "System",
	"GetFwLeaderboardsCharactersOk"	: "Characters",
	"GetFwLeaderboardsCorporationsOk"	: "Corporations",
	"GetFwWarsOk"	: "FactionWar",
	"GetFwStatsOk"	: "FactionStats",
	"GetFwLeaderboardsOk"	: "Leaderboards",

	//MARK: Fittings
	"PostCharactersCharacterIDFittingsFitting"	: "MutableFitting",
	"PostCharactersCharacterIDFittingsCreated"	: "CreateFittingResult",
	"GetCharactersCharacterIDFittingsOk"	: "Fitting",
	"PostCharactersCharacterIDFittingsItems"	: "Item",
	"GetCharactersCharacterIDFittingsItems"	: "Item",

	//MARK: Fleets
	"PutFleetsFleetIDNewSettings"	: "FleetUpdate",
	"GetFleetsFleetIDOk"	: "Information",
	"PostFleetsFleetIDWingsWingIDSquadsCreated"	: "SquadCreated",
	"PutFleetsFleetIDMembersMemberIDMovement"	: "Movement",
	"PutFleetsFleetIDSquadsSquadIDNaming"	: "Naming",
	"PutFleetsFleetIDWingsWingIDNaming"	: "Naming",
	"PostFleetsFleetIDWingsCreated"	: "WingCreated",
	"getFleetWings"	: "Wing",
	"PostFleetsFleetIDMembersInvitation"	: "Invitation",
	"GetFleetsFleetIDMembersOk"	: "Member",
	"PutFleetsFleetIDWingsWingIDName"	: "Name",
	"PutFleetsFleetIDSquadsSquadIDName"	: "Name",
	
	//MARK: Incursions
	"GetIncursionsOk"	: "Incursion",
	"GetIncursionsState"	: "State",

	//MARK: Industry
	"GetIndustryFacilitiesOk"	: "Facilities",
	"GetIndustrySystemsOk"	: "SolarSystemCostIndices",
	"GetCharactersCharacterIDIndustryJobsOk"    : "Job",
	"GetCharactersCharacterIDIndustryJobsStatus"	: "JobStatus",
	"GetCorporationsCorporationIDIndustryJobsOk"	: "CorpJob",
	"GetCorporationsCorporationIDIndustryJobsStatus"	: "JobStatus",

	//MARK: Insurance
	"GetInsurancePricesOk"	: "Price",

	//MARK: Killmails
	"GetKillmailsKillmailIDKillmailHashOk"	: "Killmail",
	"GetCharactersCharacterIDKillmailsRecentOk"	: "Recent",
	"GetKillmailsKillmailIDKillmailHashVictim"	: "Victim",
	"GetKillmailsKillmailIDKillmailHashAttackers"	: "Attacker",
	"GetKillmailsKillmailIDKillmailHashItems"	: "Item",

	//MARK: Location
	"GetCharactersCharacterIDLocationOk"	: "CharacterLocation",
	"GetCharactersCharacterIDShipOk"	: "CharacterShip",

	//MARK: Loyalty
	"GetLoyaltyStoresCorporationIDOffersOk"	: "Offer",
	"GetCharactersCharacterIDLoyaltyPointsOk"	: "Point",

	//MARK: Mail
	"PostCharactersCharacterIDMailLabelsLabel"	: "Label",
	"GetCharactersCharacterIDMailLabelsOk"	: "MailLabelsAndUnreadCounts",
	"PutCharactersCharacterIDMailMailIDContents"	: "UpdateContents",
	"GetCharactersCharacterIDMailMailIDOk"	: "MailBody",
	"PostCharactersCharacterIDMailMail"	: "NewMail",
	"GetCharactersCharacterIDMailOk"	: "Header",
	"GetCharactersCharacterIDMailListsOk"	: "Subscription",
	"PostCharactersCharacterIDMailRecipients"	: "Recipient",
	"PostCharactersCharacterIDMailRecipientType"	: "RecipientType",
	"GetCharactersCharacterIDMailRecipients"	: "Recipient",
	"GetCharactersCharacterIDMailRecipientType"	: "RecipientType",
	"GetCharactersCharacterIDMailMailIDRecipients"	: "Recipient",
	"GetCharactersCharacterIDMailMailIDRecipientType"	: "RecipientType",
	"GetCharactersCharacterIDMailLabelsLabels"	: "Label",

	//MARK: Market
	"GetMarketsPricesOk"	: "Price",
	"GetMarketsRegionIDHistoryOk"	: "History",
	"GetMarketsStructuresStructureIDOk"	: "Structure",
	"GetMarketsRegionIDOrdersOk"	: "Order",
	"GetMarketsGroupsMarketGroupIDOk"	: "ItemGroupInformation",
	"GetCharactersCharacterIDOrdersOk"  : "CharacterOrder",
	"GetCorporationsCorporationIDOrdersOk"	: "CorpOrder",

	//MARK: Opportunities
	"GetOpportunitiesGroupsGroupIDOk"	: "Group",
	"GetOpportunitiesTasksTaskIDOk"	: "OpportunitiesTask",
	"GetCharactersCharacterIDOpportunitiesOk"	: "CompletedTask",

	//MARK: PlanetaryInteraction
	"GetCharactersCharacterIDPlanetsOk"	: "Colony",
	"GetUniverseSchematicsSchematicIDOk"	: "SchematicInformation",
	"GetCharactersCharacterIDPlanetsPlanetIDOk"	: "ColonyLayout",
	"GetCharactersCharacterIDPlanetsPlanetIDHeads"	: "Head",
	"GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails"	: "ExtractorDetails",
	"GetCharactersCharacterIDPlanetsPlanetIDFactoryDetails"	: "FactoryDetails",
	"GetCharactersCharacterIDPlanetsPlanetIDPins"	: "Pin",
	"GetCharactersCharacterIDPlanetsPlanetIDLinks"	: "Link",
	"GetCharactersCharacterIDPlanetsPlanetIDRoutes"	: "Route",
	"GetCharactersCharacterIDPlanetsPlanetIDWaypoints"	: "Waypoint",
	"GetCharactersCharacterIDPlanetsPlanetType"	: "PlanetType",
	"GetCharactersCharacterIDPlanetsPlanetIDContents"	: "Contents",
	

	//MARK: Search
	"GetCharactersCharacterIDSearchOk"	: "CharacterSearchResult",
	"GetSearchOk"	: "SearchResult",

	//MARK: Skills
	"GetCharactersCharacterIDSkillsOk"	: "CharacterSkills",
	"GetCharactersCharacterIDSkillqueueOk"	: "SkillQueueItem",
	"GetCharactersCharacterIDSkillsSkills"	: "Skill",
	"GetCharactersCharacterIDAttributesOk"	: "CharacterAttributes",

	//MARK: Sovereignty
	"GetSovereigntyMapOk"	: "System",
	"GetSovereigntyCampaignsOk"	: "Campaign",
	"GetSovereigntyStructuresOk"	: "Structure",
	
	//MARK: Status
	"GetStatusOk"	: "ServerStatus",

	//MARK: Universe
	"GetUniverseCategoriesCategoryIDOk"	: "ItemCategoryInformation",
	"GetUniverseRacesOk"	: "Race",
	"GetUniversePlanetsPlanetIDOk"	: "PlanetInformation",
	"PostUniverseNamesOk"	: "Name",
	"GetUniverseTypesTypeIDOk"	: "TypeInformation",
	"GetUniverseSystemJumpsOk"	: "Jump",
	"GetUniverseMoonsMoonIDOk"	: "MoonInformation",
	"GetUniverseConstellationsConstellationIDOk"	: "ConstellationInformation",
	"GetUniverseFactionsOk"	: "Faction",
	"GetUniverseRegionsRegionIDOk"	: "RegionInformation",
	"GetUniverseStationsStationIDOk"	: "StationInformation",
	"GetUniverseGroupsGroupIDOk"	: "ItemGroupInformation",
	"GetUniverseSystemsSystemIDOk"	: "SolarSystemInformation",
	"GetUniverseStructuresStructureIDOk"	: "StructureInformation",
	"GetUniverseGraphicsGraphicIDOk"	: "GraphicInformation",
	"GetUniverseSystemKillsOk"	: "SystemKills",
	"GetUniverseStargatesStargateIDOk"	: "StargateInformation",
	"GetUniverseBloodlinesOk"	: "Bloodline",
	"PostUniverseNamesCategory"	: "Category",

	//MARK: UserInterface
	"PostUiOpenwindowNewmailNewMail"	: "NewMail",

	//MARK: Wallet
	"GetCorporationsCorporationIDWalletsOk"	: "Balance",
	"GetCharactersCharacterIDWalletTransactionsOk"	: "Transaction",
	"GetCharactersCharacterIDWalletsJournalOk"	: "WalletsJournalItem",
	"GetCharactersCharacterIDWalletJournalOk"	: "WalletJournalItem",
	"GetCharactersCharacterIDWalletsJournalSecondPartyType"	: "PartyType",
	"GetCharactersCharacterIDWalletsJournalFirstPartyType"	: "PartyType",
	"GetCharactersCharacterIDWalletJournalRefType"	: "RefType",
	"GetCorporationsCorporationIDWalletsDivisionJournalRefType"	: "RefType",
	"GetCharactersCharacterIDWalletJournalFirstPartyType"	: "PartyType",
	"GetCharactersCharacterIDWalletJournalSecondPartyType"	: "PartyType",
	"GetCharactersCharacterIDWalletJournalExtraInfo"	: "ExtraInfo",
	"GetCorporationsCorporationIDWalletsDivisionJournalOk" : "CorpWalletsJournalItem",
	"GetCorporationsCorporationIDWalletsDivisionTransactionsOk"	: "CorpTransaction",
	

	//MARK: Wars
	"GetWarsWarIDOk"	: "WarInformation",
	"GetWarsWarIDKillmailsOk"	: "Kills",

	
]

let operationNames: [String: String] = [
	"get_characters_character_id_search": "characterSearch",
	"get_search": "search"
]

let conflicts: [String: String] = [
	"Categories1" : "SearchCategories"
]
