import Foundation
import Alamofire

public extension ESI {
	
	public enum Datasource: String, JSONCoding, HTTPQueryable {
		case singularity = "singularity"
		case tranquility = "tranquility"
		
		public init() {
			self = .tranquility
		}
		
		public var json: Any {
			return self.rawValue
		}
		
		public init(json: Any) throws {
			guard let s = json as? String, let v = Datasource(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
			self = v
		}
		
		public var httpQuery: String? {
			return rawValue
		}
		
	}
	
	
	public enum Language: String, JSONCoding, HTTPQueryable {
		case de = "de"
		case enUS = "en-us"
		case fr = "fr"
		case ja = "ja"
		case ru = "ru"
		case zh = "zh"
		
		public init() {
			self = .enUS
		}
		
		public var json: Any {
			return self.rawValue
		}
		
		public init(json: Any) throws {
			guard let s = json as? String, let v = Language(rawValue: s) else {throw ESIError.invalidFormat(type(of: self), json)}
			self = v
		}
		
		public var httpQuery: String? {
			return rawValue
		}
		
	}
	
	
	public struct Scope {
		
		public static let esiClonesReadClonesV1 = Scope("esi-clones.read_clones.v1")
		public static let esiCorporationsReadCorporationMembershipV1 = Scope("esi-corporations.read_corporation_membership.v1")
		public static let esiFittingsWriteFittingsV1 = Scope("esi-fittings.write_fittings.v1")
		public static let esiCharactersReadStandingsV1 = Scope("esi-characters.read_standings.v1")
		public static let esiUniverseReadStructuresV1 = Scope("esi-universe.read_structures.v1")
		public static let esiMarketsStructureMarketsV1 = Scope("esi-markets.structure_markets.v1")
		public static let esiCharactersReadMedalsV1 = Scope("esi-characters.read_medals.v1")
		public static let esiMailReadMailV1 = Scope("esi-mail.read_mail.v1")
		public static let esiSkillsReadSkillqueueV1 = Scope("esi-skills.read_skillqueue.v1")
		public static let esiAssetsReadAssetsV1 = Scope("esi-assets.read_assets.v1")
		public static let esiCalendarRespondCalendarEventsV1 = Scope("esi-calendar.respond_calendar_events.v1")
		public static let esiMailOrganizeMailV1 = Scope("esi-mail.organize_mail.v1")
		public static let esiKillmailsReadKillmailsV1 = Scope("esi-killmails.read_killmails.v1")
		public static let esiMailSendMailV1 = Scope("esi-mail.send_mail.v1")
		public static let esiWalletReadCharacterWalletV1 = Scope("esi-wallet.read_character_wallet.v1")
		public static let esiCharactersReadOpportunitiesV1 = Scope("esi-characters.read_opportunities.v1")
		public static let esiFleetsWriteFleetV1 = Scope("esi-fleets.write_fleet.v1")
		public static let esiCharactersReadAgentsResearchV1 = Scope("esi-characters.read_agents_research.v1")
		public static let esiFittingsReadFittingsV1 = Scope("esi-fittings.read_fittings.v1")
		public static let esiCalendarReadCalendarEventsV1 = Scope("esi-calendar.read_calendar_events.v1")
		public static let esiSkillsReadSkillsV1 = Scope("esi-skills.read_skills.v1")
		public static let esiLocationReadShipTypeV1 = Scope("esi-location.read_ship_type.v1")
		public static let esiCharactersWriteContactsV1 = Scope("esi-characters.write_contacts.v1")
		public static let esiCharactersReadContactsV1 = Scope("esi-characters.read_contacts.v1")
		public static let esiPlanetsManagePlanetsV1 = Scope("esi-planets.manage_planets.v1")
		public static let esiSearchSearchStructuresV1 = Scope("esi-search.search_structures.v1")
		public static let esiLocationReadLocationV1 = Scope("esi-location.read_location.v1")
		public static let esiUiWriteWaypointV1 = Scope("esi-ui.write_waypoint.v1")
		public static let esiUiOpenWindowV1 = Scope("esi-ui.open_window.v1")
		public static let esiFleetsReadFleetV1 = Scope("esi-fleets.read_fleet.v1")
		public static let esiCharactersReadChatChannelsV1 = Scope("esi-characters.read_chat_channels.v1")
		public static let esiCorporationsWriteStructuresV1 = Scope("esi-corporations.write_structures.v1")
		public static let esiBookmarksReadCharacterBookmarksV1 = Scope("esi-bookmarks.read_character_bookmarks.v1")
		public static let esiCharactersReadLoyaltyV1 = Scope("esi-characters.read_loyalty.v1")
		public static let esiCorporationsReadStructuresV1 = Scope("esi-corporations.read_structures.v1")
		
		public let rawValue: String
		
		public init(_ value: String) {
			rawValue = value
		}
		
		public static var all: [Scope]  {
			get {
				return [
				.esiClonesReadClonesV1,
				.esiCorporationsReadCorporationMembershipV1,
				.esiFittingsWriteFittingsV1,
				.esiCharactersReadStandingsV1,
				.esiUniverseReadStructuresV1,
				.esiMarketsStructureMarketsV1,
				.esiCharactersReadMedalsV1,
				.esiMailReadMailV1,
				.esiSkillsReadSkillqueueV1,
				.esiAssetsReadAssetsV1,
				.esiCalendarRespondCalendarEventsV1,
				.esiMailOrganizeMailV1,
				.esiKillmailsReadKillmailsV1,
				.esiMailSendMailV1,
				.esiWalletReadCharacterWalletV1,
				.esiCharactersReadOpportunitiesV1,
				.esiFleetsWriteFleetV1,
				.esiCharactersReadAgentsResearchV1,
				.esiFittingsReadFittingsV1,
				.esiCalendarReadCalendarEventsV1,
				.esiSkillsReadSkillsV1,
				.esiLocationReadShipTypeV1,
				.esiCharactersWriteContactsV1,
				.esiCharactersReadContactsV1,
				.esiPlanetsManagePlanetsV1,
				.esiSearchSearchStructuresV1,
				.esiLocationReadLocationV1,
				.esiUiWriteWaypointV1,
				.esiUiOpenWindowV1,
				.esiFleetsReadFleetV1,
				.esiCharactersReadChatChannelsV1,
				.esiCorporationsWriteStructuresV1,
				.esiBookmarksReadCharacterBookmarksV1,
				.esiCharactersReadLoyaltyV1,
				.esiCorporationsReadStructuresV1
				]
			}
		}
	}
	
	class func loadClassess() {
		_ = Routes.GetRouteOriginDestinationNotFound.classForCoder()
		_ = Wars.Kills.classForCoder()
		_ = Universe.Name.classForCoder()
		_ = Insurance.Price.classForCoder()
		_ = Corporation.Information.classForCoder()
		_ = Character.Medal.classForCoder()
		_ = Character.GetCharactersCharacterIDNotFound.classForCoder()
		_ = Market.GetMarketsRegionIDHistoryUnprocessableEntity.classForCoder()
		_ = Fittings.PostFitting.PostCharactersCharacterIDFittingsItems.classForCoder()
		_ = Universe.GetUniverseGraphicsGraphicIDNotFound.classForCoder()
		_ = Character.GetCharactersNamesInternalServerError.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted.classForCoder()
		_ = Character.Information.classForCoder()
		_ = Industry.Facilities.classForCoder()
		_ = Corporation.History.GetCorporationsCorporationIDAlliancehistoryAlliance.classForCoder()
		_ = Skills.CharacterSkills.classForCoder()
		_ = Fleets.FleetUpdate.classForCoder()
		_ = Wars.GetWarsWarIDKillmailsUnprocessableEntity.classForCoder()
		_ = Sovereignty.Campaign.GetSovereigntyCampaignsParticipants.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes.GetCharactersCharacterIDPlanetsPlanetIDWaypoints.classForCoder()
		_ = Universe.GetUniverseCategoriesCategoryIDInternalServerError.classForCoder()
		_ = Character.GetCharactersCharacterIDCorporationhistoryInternalServerError.classForCoder()
		_ = Fleets.PostFleetsFleetIDWingsInternalServerError.classForCoder()
		_ = Character.GetCharactersCharacterIDPortraitNotFound.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.classForCoder()
		_ = Universe.GetUniverseSystemJumpsInternalServerError.classForCoder()
		_ = Character.PostCharactersCharacterIDCspaForbidden.classForCoder()
		_ = Universe.GetUniverseTypesTypeIDNotFound.classForCoder()
		_ = Universe.Jump.classForCoder()
		_ = Universe.GetUniverseSystemsSystemIDNotFound.classForCoder()
		_ = PlanetaryInteraction.GetCharactersCharacterIDPlanetsForbidden.classForCoder()
		_ = Market.GetMarketsPricesInternalServerError.classForCoder()
		_ = Fleets.PutFleetsFleetIDMembersMemberIDInternalServerError.classForCoder()
		_ = Opportunities.GetCharactersCharacterIDOpportunitiesInternalServerError.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed.classForCoder()
		_ = Sovereignty.GetSovereigntyCampaignsInternalServerError.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDRolesForbidden.classForCoder()
		_ = Universe.GetUniverseSystemsInternalServerError.classForCoder()
		_ = Universe.StationInformation.GetUniverseStationsStationIDPosition.classForCoder()
		_ = Corporation.Icon.classForCoder()
		_ = Mail.Header.Recipient.classForCoder()
		_ = Universe.ConstellationInformation.classForCoder()
		_ = Universe.GetUniverseGroupsGroupIDInternalServerError.classForCoder()
		_ = Universe.GetUniverseCategoriesInternalServerError.classForCoder()
		_ = Loyalty.Offer.classForCoder()
		_ = Universe.GetUniversePlanetsPlanetIDNotFound.classForCoder()
		_ = Skills.GetCharactersCharacterIDSkillsForbidden.classForCoder()
		_ = Opportunities.GetOpportunitiesTasksTaskIDInternalServerError.classForCoder()
		_ = Killmails.Killmail.GetKillmailsKillmailIDKillmailHashAttackers.classForCoder()
		_ = Mail.PostCharactersCharacterIDMailBadRequest.classForCoder()
		_ = UserInterface.PostUiAutopilotWaypointForbidden.classForCoder()
		_ = Character.GetCharactersCharacterIDPortraitInternalServerError.classForCoder()
		_ = Fleets.PostFleetsFleetIDMembersNotFound.classForCoder()
		_ = Mail.DeleteCharactersCharacterIDMailLabelsLabelIDForbidden.classForCoder()
		_ = Assets.GetCharactersCharacterIDAssetsInternalServerError.classForCoder()
		_ = Contacts.PostCharactersCharacterIDContactsForbidden.classForCoder()
		_ = Dogma.GetDogmaAttributesAttributeIDInternalServerError.classForCoder()
		_ = Universe.PostUniverseNamesNotFound.classForCoder()
		_ = Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDWingsWingIDForbidden.classForCoder()
		_ = Clones.JumpClones.GetCharactersCharacterIDClonesJumpClones.classForCoder()
		_ = Character.Portrait.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.classForCoder()
		_ = UserInterface.PostUiOpenwindowInformationInternalServerError.classForCoder()
		_ = Fleets.PostFleetsFleetIDMembersInternalServerError.classForCoder()
		_ = Alliance.Icon.classForCoder()
		_ = Fleets.PutFleetsFleetIDMembersMemberIDForbidden.classForCoder()
		_ = Sovereignty.System.classForCoder()
		_ = Contacts.PutCharactersCharacterIDContactsInternalServerError.classForCoder()
		_ = Fittings.GetCharactersCharacterIDFittingsForbidden.classForCoder()
		_ = Character.Standing.classForCoder()
		_ = Universe.SystemKills.classForCoder()
		_ = Fittings.GetCharactersCharacterIDFittingsInternalServerError.classForCoder()
		_ = Opportunities.GetOpportunitiesGroupsGroupIDInternalServerError.classForCoder()
		_ = Calendar.Summary.classForCoder()
		_ = Wallet.Balance.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDMembersMemberIDForbidden.classForCoder()
		_ = Fleets.PutFleetsFleetIDMembersMemberIDNotFound.classForCoder()
		_ = Mail.PutCharactersCharacterIDMailMailIDInternalServerError.classForCoder()
		_ = Mail.DeleteCharactersCharacterIDMailLabelsLabelIDInternalServerError.classForCoder()
		_ = Fleets.Member.classForCoder()
		_ = Calendar.GetCharactersCharacterIDCalendarEventIDForbidden.classForCoder()
		_ = Fittings.DeleteCharactersCharacterIDFittingsFittingIDForbidden.classForCoder()
		_ = Character.GetCharactersCharacterIDAgentsResearchInternalServerError.classForCoder()
		_ = Universe.SolarSystemInformation.classForCoder()
		_ = Contacts.GetCharactersCharacterIDContactsInternalServerError.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailInternalServerError.classForCoder()
		_ = Calendar.GetCharactersCharacterIDCalendarForbidden.classForCoder()
		_ = Contacts.PostCharactersCharacterIDContactsInternalServerError.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsNotFound.classForCoder()
		_ = Fleets.WingCreated.classForCoder()
		_ = Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDStructuresForbidden.classForCoder()
		_ = Mail.Subscription.classForCoder()
		_ = Killmails.GetKillmailsKillmailIDKillmailHashUnprocessableEntity.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDStructuresInternalServerError.classForCoder()
		_ = Calendar.Event.classForCoder()
		_ = Industry.SolarSystemCostIndices.classForCoder()
		_ = Fittings.PostFitting.classForCoder()
		_ = Fittings.DeleteCharactersCharacterIDFittingsFittingIDInternalServerError.classForCoder()
		_ = Killmails.Killmail.GetKillmailsKillmailIDKillmailHashVictim.GetKillmailsKillmailIDKillmailHashPosition.classForCoder()
		_ = Alliance.GetAlliancesAllianceIDNotFound.classForCoder()
		_ = Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound.classForCoder()
		_ = Fittings.PostCharactersCharacterIDFittingsForbidden.classForCoder()
		_ = Universe.TypeInformation.classForCoder()
		_ = Fleets.PostFleetsFleetIDWingsWingIDSquadsInternalServerError.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads.classForCoder()
		_ = Fleets.GetFleetsFleetIDForbidden.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDIconsInternalServerError.classForCoder()
		_ = Character.CorporationHistory.classForCoder()
		_ = Alliance.GetAlliancesAllianceIDIconsInternalServerError.classForCoder()
		_ = Fleets.PutFleetsFleetIDWingsWingIDNotFound.classForCoder()
		_ = PlanetaryInteraction.GetCharactersCharacterIDPlanetsInternalServerError.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsOk.classForCoder()
		_ = Location.GetCharactersCharacterIDLocationForbidden.classForCoder()
		_ = Wars.WarInformation.GetWarsWarIDDefender.classForCoder()
		_ = Mail.PostCharactersCharacterIDMailLabelsForbidden.classForCoder()
		_ = Universe.GetUniverseStructuresInternalServerError.classForCoder()
		_ = Universe.GetUniverseStructuresStructureIDForbidden.classForCoder()
		_ = Dogma.GetDogmaEffectsEffectIDInternalServerError.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound.classForCoder()
		_ = Universe.GetUniverseGraphicsGraphicIDInternalServerError.classForCoder()
		_ = Universe.GetUniverseRacesInternalServerError.classForCoder()
		_ = Location.GetCharactersCharacterIDShipForbidden.classForCoder()
		_ = Wars.WarInformation.classForCoder()
		_ = Character.GetCharactersCharacterIDStandingsInternalServerError.classForCoder()
		_ = Character.Medal.GetCharactersCharacterIDMedalsGraphics.classForCoder()
		_ = Sovereignty.Structure.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsForbidden.classForCoder()
		_ = UserInterface.NewMail.classForCoder()
		_ = UserInterface.PostUiOpenwindowNewmailForbidden.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDSquadsSquadIDForbidden.classForCoder()
		_ = Dogma.Effect.GetDogmaEffectsEffectIDModifiers.classForCoder()
		_ = Fleets.Movement.classForCoder()
		_ = Fleets.Naming.classForCoder()
		_ = Mail.DeleteCharactersCharacterIDMailMailIDForbidden.classForCoder()
		_ = Universe.GetUniverseFactionsInternalServerError.classForCoder()
		_ = Universe.GetUniversePlanetsPlanetIDInternalServerError.classForCoder()
		_ = Character.GetCharactersCharacterIDInternalServerError.classForCoder()
		_ = Fleets.PutFleetsFleetIDForbidden.classForCoder()
		_ = Universe.Bloodline.classForCoder()
		_ = Universe.GetUniverseCategoriesCategoryIDNotFound.classForCoder()
		_ = Killmails.GetCharactersCharacterIDKillmailsRecentInternalServerError.classForCoder()
		_ = Incursions.GetIncursionsInternalServerError.classForCoder()
		_ = Fleets.PutFleetsFleetIDWingsWingIDInternalServerError.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDMembersMemberIDInternalServerError.classForCoder()
		_ = Loyalty.Point.classForCoder()
		_ = Wars.GetWarsInternalServerError.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailForbidden.classForCoder()
		_ = Killmails.GetCharactersCharacterIDKillmailsRecentForbidden.classForCoder()
		_ = Universe.GetUniverseConstellationsConstellationIDNotFound.classForCoder()
		_ = Fleets.Invitation.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsInternalServerError.classForCoder()
		_ = Killmails.Killmail.classForCoder()
		_ = Mail.PutCharactersCharacterIDMailMailIDBadRequest.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailListsInternalServerError.classForCoder()
		_ = Bookmarks.GetCharactersCharacterIDBookmarksInternalServerError.classForCoder()
		_ = PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDForbidden.classForCoder()
		_ = Bookmarks.Bookmark.classForCoder()
		_ = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates.classForCoder()
		_ = Assets.GetCharactersCharacterIDAssetsForbidden.classForCoder()
		_ = Universe.StargateInformation.GetUniverseStargatesStargateIDPosition.classForCoder()
		_ = Universe.GetUniverseGroupsInternalServerError.classForCoder()
		_ = Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets.classForCoder()
		_ = Fleets.Information.classForCoder()
		_ = Loyalty.GetLoyaltyStoresCorporationIDOffersInternalServerError.classForCoder()
		_ = Incursions.Incursion.classForCoder()
		_ = Market.Structure.classForCoder()
		_ = Mail.PostCharactersCharacterIDMailForbidden.classForCoder()
		_ = Universe.GetUniverseStructuresStructureIDNotFound.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailListsForbidden.classForCoder()
		_ = Opportunities.CompletedTask.classForCoder()
		_ = Insurance.Price.GetInsurancePricesLevels.classForCoder()
		_ = Fleets.GetFleetsFleetIDMembersForbidden.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDInternalServerError.classForCoder()
		_ = Character.PostCharactersAffiliationUnprocessableEntity.classForCoder()
		_ = UserInterface.PostUiOpenwindowMarketdetailsInternalServerError.classForCoder()
		_ = Fittings.Fitting.classForCoder()
		_ = Location.GetCharactersCharacterIDShipInternalServerError.classForCoder()
		_ = Fleets.PutFleetsFleetIDBadRequest.classForCoder()
		_ = Universe.GetUniverseRegionsRegionIDInternalServerError.classForCoder()
		_ = Calendar.PutCharactersCharacterIDCalendarEventIDForbidden.classForCoder()
		_ = Alliance.Name.classForCoder()
		_ = Wars.WarInformation.GetWarsWarIDAggressor.classForCoder()
		_ = Fleets.PutFleetsFleetIDSquadsSquadIDForbidden.classForCoder()
		_ = Mail.MailLabelsAndUnreadCounts.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDRoutes.classForCoder()
		_ = Fleets.GetFleetsFleetIDMembersInternalServerError.classForCoder()
		_ = Fleets.GetFleetsFleetIDInternalServerError.classForCoder()
		_ = UserInterface.PostUiOpenwindowContractForbidden.classForCoder()
		_ = Location.CharacterShip.classForCoder()
		_ = Character.GetCharactersCharacterIDChatChannelsForbidden.classForCoder()
		_ = Character.GetCharactersCharacterIDAgentsResearchForbidden.classForCoder()
		_ = Market.GetMarketsGroupsMarketGroupIDNotFound.classForCoder()
		_ = Character.GetCharactersCharacterIDMedalsInternalServerError.classForCoder()
		_ = Universe.GetUniverseSystemsSystemIDInternalServerError.classForCoder()
		_ = Clones.JumpClones.classForCoder()
		_ = Killmails.GetKillmailsKillmailIDKillmailHashInternalServerError.classForCoder()
		_ = Character.GetCharactersCharacterIDMedalsForbidden.classForCoder()
		_ = Fittings.PostFittingResult.classForCoder()
		_ = Contacts.PutCharactersCharacterIDContactsForbidden.classForCoder()
		_ = Character.CSPAChargeCost.classForCoder()
		_ = Contacts.DeleteCharactersCharacterIDContactsInternalServerError.classForCoder()
		_ = Mail.MailBody.classForCoder()
		_ = Contacts.GetCharactersCharacterIDContactsLabelsInternalServerError.classForCoder()
		_ = Universe.ItemCategoryInformation.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDNotFound.classForCoder()
		_ = Corporation.Role.classForCoder()
		_ = Dogma.GetDogmaAttributesInternalServerError.classForCoder()
		_ = Fleets.GetFleetsFleetIDMembersNotFound.classForCoder()
		_ = PlanetaryInteraction.GetUniverseSchematicsSchematicIDInternalServerError.classForCoder()
		_ = Industry.GetIndustryFacilitiesInternalServerError.classForCoder()
		_ = Market.ItemGroupInformation.classForCoder()
		_ = Insurance.GetInsurancePricesInternalServerError.classForCoder()
		_ = PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound.classForCoder()
		_ = Universe.GetUniverseBloodlinesInternalServerError.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDWingsWingIDNotFound.classForCoder()
		_ = UserInterface.PostUiOpenwindowMarketdetailsForbidden.classForCoder()
		_ = Universe.GetUniverseStationsStationIDNotFound.classForCoder()
		_ = UserInterface.PostUiOpenwindowContractInternalServerError.classForCoder()
		_ = Dogma.GetDogmaEffectsEffectIDNotFound.classForCoder()
		_ = Universe.StructureInformation.classForCoder()
		_ = Corporation.PutCorporationsCorporationIDStructuresStructureIDForbidden.classForCoder()
		_ = Calendar.PutCharactersCharacterIDCalendarEventIDInternalServerError.classForCoder()
		_ = Universe.GetUniverseStargatesStargateIDInternalServerError.classForCoder()
		_ = Fleets.PostFleetsFleetIDWingsWingIDSquadsForbidden.classForCoder()
		_ = Fleets.PostFleetsFleetIDWingsForbidden.classForCoder()
		_ = Clones.GetCharactersCharacterIDClonesForbidden.classForCoder()
		_ = Bookmarks.GetCharactersCharacterIDBookmarksForbidden.classForCoder()
		_ = Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition.classForCoder()
		_ = Universe.Race.classForCoder()
		_ = Opportunities.Group.classForCoder()
		_ = Corporation.PutCorporationsCorporationIDStructuresStructureIDInternalServerError.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDMembersInternalServerError.classForCoder()
		_ = Fleets.SquadCreated.classForCoder()
		_ = Mail.MailLabelsAndUnreadCounts.GetCharactersCharacterIDMailLabelsLabels.classForCoder()
		_ = Universe.GetUniverseStationsStationIDInternalServerError.classForCoder()
		_ = Contacts.Label.classForCoder()
		_ = Wallet.GetCharactersCharacterIDWalletsInternalServerError.classForCoder()
		_ = Alliance.GetAlliancesAllianceIDIconsNotFound.classForCoder()
		_ = Universe.StructureInformation.GetUniverseStructuresStructureIDPosition.classForCoder()
		_ = Fleets.PutFleetsFleetIDNotFound.classForCoder()
		_ = Dogma.GetDogmaAttributesAttributeIDNotFound.classForCoder()
		_ = Mail.DeleteCharactersCharacterIDMailMailIDInternalServerError.classForCoder()
		_ = Industry.GetIndustrySystemsInternalServerError.classForCoder()
		_ = Bookmarks.Folder.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails.classForCoder()
		_ = Search.GetSearchInternalServerError.classForCoder()
		_ = Calendar.Response.classForCoder()
		_ = Universe.GetUniverseRegionsRegionIDNotFound.classForCoder()
		_ = Mail.MailBody.GetCharactersCharacterIDMailMailIDRecipients.classForCoder()
		_ = Contacts.Contact.classForCoder()
		_ = Contacts.GetCharactersCharacterIDContactsForbidden.classForCoder()
		_ = Fleets.PutFleetsFleetIDInternalServerError.classForCoder()
		_ = PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDInternalServerError.classForCoder()
		_ = Character.Affiliation.classForCoder()
		_ = Wallet.GetCharactersCharacterIDWalletsForbidden.classForCoder()
		_ = Character.Characters.classForCoder()
		_ = Fleets.PostFleetsFleetIDMembersUnprocessableEntity.classForCoder()
		_ = Mail.DeleteCharactersCharacterIDMailLabelsLabelIDUnprocessableEntity.classForCoder()
		_ = Sovereignty.Campaign.classForCoder()
		_ = PlanetaryInteraction.SchematicInformation.classForCoder()
		_ = Universe.GetUniverseStargatesStargateIDNotFound.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailLabelsInternalServerError.classForCoder()
		_ = Market.GetMarketsRegionIDHistoryInternalServerError.classForCoder()
		_ = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.classForCoder()
		_ = Corporation.GetCorporationsNpccorpsInternalServerError.classForCoder()
		_ = Market.History.classForCoder()
		_ = Opportunities.GetOpportunitiesTasksInternalServerError.classForCoder()
		_ = Mail.PostCharactersCharacterIDMailLabelsInternalServerError.classForCoder()
		_ = Dogma.Attribute.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDFactoryDetails.classForCoder()
		_ = Sovereignty.GetSovereigntyStructuresInternalServerError.classForCoder()
		_ = Search.SearchResult.classForCoder()
		_ = Universe.PlanetInformation.classForCoder()
		_ = Location.CharacterLocation.classForCoder()
		_ = Alliance.GetAlliancesAllianceIDInternalServerError.classForCoder()
		_ = Universe.GetUniverseRegionsInternalServerError.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDLinks.classForCoder()
		_ = Character.ChatChannel.classForCoder()
		_ = Killmails.Killmail.GetKillmailsKillmailIDKillmailHashVictim.GetKillmailsKillmailIDKillmailHashItems.classForCoder()
		_ = Opportunities.GetOpportunitiesGroupsInternalServerError.classForCoder()
		_ = Universe.PostUniverseNamesInternalServerError.classForCoder()
		_ = Assets.Asset.classForCoder()
		_ = Market.GetMarketsGroupsMarketGroupIDInternalServerError.classForCoder()
		_ = Opportunities.OpportunitiesTask.classForCoder()
		_ = Corporation.Name.classForCoder()
		_ = Universe.StargateInformation.GetUniverseStargatesStargateIDDestination.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound.classForCoder()
		_ = Fittings.PostCharactersCharacterIDFittingsInternalServerError.classForCoder()
		_ = Character.PostCharactersAffiliationInternalServerError.classForCoder()
		_ = Universe.MoonInformation.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailLabelsForbidden.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDRolesInternalServerError.classForCoder()
		_ = Skills.CharacterSkills.Skill.classForCoder()
		_ = Alliance.Information.classForCoder()
		_ = Fleets.PutFleetsFleetIDWingsWingIDForbidden.classForCoder()
		_ = Skills.GetCharactersCharacterIDSkillqueueInternalServerError.classForCoder()
		_ = Fleets.PutFleetsFleetIDSquadsSquadIDInternalServerError.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDAlliancehistoryInternalServerError.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailMailIDNotFound.classForCoder()
		_ = Character.Research.classForCoder()
		_ = Mail.NewMail.Recipient.classForCoder()
		_ = Skills.SkillQueueItem.classForCoder()
		_ = Dogma.Effect.classForCoder()
		_ = Search.GetCharactersCharacterIDSearchForbidden.classForCoder()
		_ = Corporation.History.classForCoder()
		_ = Contacts.DeleteCharactersCharacterIDContactsForbidden.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDMembersForbidden.classForCoder()
		_ = Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes.classForCoder()
		_ = Skills.GetCharactersCharacterIDSkillqueueForbidden.classForCoder()
		_ = Market.GetMarketsRegionIDOrdersUnprocessableEntity.classForCoder()
		_ = Universe.GetUniverseMoonsMoonIDNotFound.classForCoder()
		_ = Market.GetMarketsRegionIDOrdersInternalServerError.classForCoder()
		_ = Market.Order.classForCoder()
		_ = Killmails.Recent.classForCoder()
		_ = Mail.UpdateContents.classForCoder()
		_ = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem.classForCoder()
		_ = Corporation.VulnerabilitySchedule.classForCoder()
		_ = Market.Price.classForCoder()
		_ = Corporation.GetCorporationsNamesInternalServerError.classForCoder()
		_ = Corporation.Structure.GetCorporationsCorporationIDStructuresServices.classForCoder()
		_ = Wars.GetWarsWarIDKillmailsInternalServerError.classForCoder()
		_ = Mail.NewMail.classForCoder()
		_ = Universe.MoonInformation.GetUniverseMoonsMoonIDPosition.classForCoder()
		_ = Bookmarks.GetCharactersCharacterIDBookmarksFoldersInternalServerError.classForCoder()
		_ = Market.GetMarketsGroupsInternalServerError.classForCoder()
		_ = Universe.GetUniverseConstellationsConstellationIDInternalServerError.classForCoder()
		_ = Bookmarks.GetCharactersCharacterIDBookmarksFoldersForbidden.classForCoder()
		_ = Location.GetCharactersCharacterIDLocationInternalServerError.classForCoder()
		_ = Loyalty.GetCharactersCharacterIDLoyaltyPointsInternalServerError.classForCoder()
		_ = Alliance.GetAlliancesAllianceIDCorporationsInternalServerError.classForCoder()
		_ = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.classForCoder()
		_ = Universe.GraphicInformation.classForCoder()
		_ = Universe.GetUniverseTypesInternalServerError.classForCoder()
		_ = Universe.GetUniverseMoonsMoonIDInternalServerError.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDIconsNotFound.classForCoder()
		_ = Calendar.GetCharactersCharacterIDCalendarInternalServerError.classForCoder()
		_ = Killmails.Killmail.GetKillmailsKillmailIDKillmailHashVictim.classForCoder()
		_ = Opportunities.GetCharactersCharacterIDOpportunitiesForbidden.classForCoder()
		_ = Fleets.PostFleetsFleetIDMembersForbidden.classForCoder()
		_ = Corporation.Structure.classForCoder()
		_ = Market.GetMarketsStructuresStructureIDForbidden.classForCoder()
		_ = Loyalty.GetCharactersCharacterIDLoyaltyPointsForbidden.classForCoder()
		_ = Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition.classForCoder()
		_ = Fleets.PostFleetsFleetIDWingsNotFound.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailMailIDForbidden.classForCoder()
		_ = Skills.GetCharactersCharacterIDSkillsInternalServerError.classForCoder()
		_ = Wars.GetWarsWarIDInternalServerError.classForCoder()
		_ = Universe.Faction.classForCoder()
		_ = Mail.PostCharactersCharacterIDMailInternalServerError.classForCoder()
		_ = Character.Name.classForCoder()
		_ = Clones.GetCharactersCharacterIDClonesInternalServerError.classForCoder()
		_ = Universe.GetUniverseGroupsGroupIDNotFound.classForCoder()
		_ = Wars.GetWarsWarIDUnprocessableEntity.classForCoder()
		_ = Dogma.GetDogmaEffectsInternalServerError.classForCoder()
		_ = Calendar.GetCharactersCharacterIDCalendarEventIDInternalServerError.classForCoder()
		_ = Routes.GetRouteOriginDestinationInternalServerError.classForCoder()
		_ = Universe.GetUniverseTypesTypeIDInternalServerError.classForCoder()
		_ = UserInterface.PostUiOpenwindowNewmailInternalServerError.classForCoder()
		_ = Universe.GetUniverseConstellationsInternalServerError.classForCoder()
		_ = Character.PostCharactersCharacterIDCspaInternalServerError.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailMailIDInternalServerError.classForCoder()
		_ = Mail.PutCharactersCharacterIDMailMailIDForbidden.classForCoder()
		_ = Clones.JumpClones.GetCharactersCharacterIDClonesHomeLocation.classForCoder()
		_ = PlanetaryInteraction.Colony.classForCoder()
		_ = Alliance.GetAlliancesNamesInternalServerError.classForCoder()
		_ = Wars.WarInformation.GetWarsWarIDAllies.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators.classForCoder()
		_ = Contacts.GetCharactersCharacterIDContactsLabelsForbidden.classForCoder()
		_ = Fleets.PutFleetsFleetIDSquadsSquadIDNotFound.classForCoder()
		_ = UserInterface.PostUiOpenwindowInformationForbidden.classForCoder()
		_ = Market.GetMarketsStructuresStructureIDInternalServerError.classForCoder()
		_ = Alliance.GetAlliancesInternalServerError.classForCoder()
		_ = Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.GetCharactersCharacterIDPlanetsPlanetIDPins.GetCharactersCharacterIDPlanetsPlanetIDExtractorDetails.GetCharactersCharacterIDPlanetsPlanetIDHeads.classForCoder()
		_ = PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound.classForCoder()
		_ = Universe.GetUniverseSystemKillsInternalServerError.classForCoder()
		_ = Universe.GetUniverseGraphicsInternalServerError.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked.classForCoder()
		_ = Search.GetCharactersCharacterIDSearchInternalServerError.classForCoder()
		_ = Search.CharacterSearchResult.classForCoder()
		_ = Universe.ItemGroupInformation.classForCoder()
		_ = Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition.classForCoder()
		_ = Mail.Header.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDSquadsSquadIDInternalServerError.classForCoder()
		_ = Fittings.Fitting.GetCharactersCharacterIDFittingsItems.classForCoder()
		_ = Fleets.GetFleetsFleetIDNotFound.classForCoder()
		_ = Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul.classForCoder()
		_ = Character.GetCharactersCharacterIDChatChannelsInternalServerError.classForCoder()
		_ = Universe.StationInformation.classForCoder()
		_ = UserInterface.PostUiOpenwindowNewmailUnprocessableEntity.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDWingsWingIDInternalServerError.classForCoder()
		_ = Corporation.Member.classForCoder()
		_ = Universe.RegionInformation.classForCoder()
		_ = Mail.Label.classForCoder()
		_ = Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul.classForCoder()
		_ = Universe.GetUniverseStructuresStructureIDInternalServerError.classForCoder()
		_ = Character.GetCharactersCharacterIDStandingsForbidden.classForCoder()
		_ = Killmails.Killmail.GetKillmailsKillmailIDKillmailHashVictim.GetKillmailsKillmailIDKillmailHashItems.GetKillmailsKillmailIDKillmailHashItems.classForCoder()
		_ = UserInterface.PostUiAutopilotWaypointInternalServerError.classForCoder()
		_ = Universe.StargateInformation.classForCoder()
		_ = Sovereignty.GetSovereigntyMapInternalServerError.classForCoder()
	}
}