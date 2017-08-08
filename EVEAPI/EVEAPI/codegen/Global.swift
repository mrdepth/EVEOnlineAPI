import Foundation
import Alamofire

public extension ESI {
	
	public class Forbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
		
		
		public var error: String = String()
		public var ssoStatus: Int? = nil
		
		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public required init(json: Any) throws {
			guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
			
			guard let error = dictionary["error"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
			self.error = error
			ssoStatus = dictionary["sso_status"] as? Int
			
			super.init()
		}
		
		override public init() {
			super.init()
		}
		
		public required init?(coder aDecoder: NSCoder) {
			error = aDecoder.decodeObject(forKey: "error") as? String ?? String()
			ssoStatus = aDecoder.containsValue(forKey: "sso_status") ? aDecoder.decodeInteger(forKey: "sso_status") : nil
			
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
			aCoder.encode(error, forKey: "error")
			if let v = ssoStatus {
				aCoder.encode(v, forKey: "sso_status")
			}
		}
		
		public var json: Any {
			var json = [String: Any]()
			json["error"] = error.json
			if let v = ssoStatus?.json {
				json["sso_status"] = v
			}
			return json
		}
		
		private lazy var _hashValue: Int = {
			var hash: Int = 0
			hashCombine(seed: &hash, value: self.error.hashValue)
			hashCombine(seed: &hash, value: self.ssoStatus?.hashValue ?? 0)
			return hash
		}()
		
		override public var hashValue: Int {
			return _hashValue
		}
		
		public static func ==(lhs: Forbidden, rhs: Forbidden) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
		
		init(_ other: Forbidden) {
			error = other.error
			ssoStatus = other.ssoStatus
		}
		
		public func copy(with zone: NSZone? = nil) -> Any {
			return Forbidden(self)
		}
		
		
		public override func isEqual(_ object: Any?) -> Bool {
			return (object as? Forbidden)?.hashValue == hashValue
		}
		
	}
	
	
	public class InternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
		
		
		public var error: String = String()
		
		public static var supportsSecureCoding: Bool {
			return true
		}
		
		public required init(json: Any) throws {
			guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
			
			guard let error = dictionary["error"] as? String else {throw ESIError.invalidFormat(type(of: self), dictionary)}
			self.error = error
			
			super.init()
		}
		
		override public init() {
			super.init()
		}
		
		public required init?(coder aDecoder: NSCoder) {
			error = aDecoder.decodeObject(forKey: "error") as? String ?? String()
			
			super.init()
		}
		
		public func encode(with aCoder: NSCoder) {
			aCoder.encode(error, forKey: "error")
		}
		
		public var json: Any {
			var json = [String: Any]()
			json["error"] = error.json
			return json
		}
		
		private lazy var _hashValue: Int = {
			var hash: Int = 0
			hashCombine(seed: &hash, value: self.error.hashValue)
			return hash
		}()
		
		override public var hashValue: Int {
			return _hashValue
		}
		
		public static func ==(lhs: InternalServerError, rhs: InternalServerError) -> Bool {
			return lhs.hashValue == rhs.hashValue
		}
		
		init(_ other: InternalServerError) {
			error = other.error
		}
		
		public func copy(with zone: NSZone? = nil) -> Any {
			return InternalServerError(self)
		}
		
		
		public override func isEqual(_ object: Any?) -> Bool {
			return (object as? InternalServerError)?.hashValue == hashValue
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
	
	
	class func loadClassess() {
		_ = Routes.GetRouteOriginDestinationNotFound.classForCoder()
		_ = Wars.Kills.classForCoder()
		_ = Universe.Name.classForCoder()
		_ = Insurance.Price.classForCoder()
		_ = Contracts.Contract.classForCoder()
		_ = Corporation.Information.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Pin.classForCoder()
		_ = Universe.ItemCategoryInformation.classForCoder()
		_ = Character.GetCharactersCharacterIDNotFound.classForCoder()
		_ = Market.GetMarketsRegionIDHistoryUnprocessableEntity.classForCoder()
		_ = Character.Medal.classForCoder()
		_ = Mail.MailBody.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDNotFound.classForCoder()
		_ = Corporation.Role.classForCoder()
		_ = Fleets.GetFleetsFleetIDMembersNotFound.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Route.classForCoder()
		_ = Universe.GetUniverseGraphicsGraphicIDNotFound.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted.classForCoder()
		_ = Contracts.Bid.classForCoder()
		_ = Character.Information.classForCoder()
		_ = Wallet.Transaction.classForCoder()
		_ = Market.ItemGroupInformation.classForCoder()
		_ = PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound.classForCoder()
		_ = Industry.Facilities.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head.classForCoder()
		_ = Killmails.Killmail.Victim.Item.classForCoder()
		_ = Skills.CharacterSkills.classForCoder()
		_ = Skills.CharacterAttributes.classForCoder()
		_ = Fleets.FleetUpdate.classForCoder()
		_ = Wars.GetWarsWarIDKillmailsUnprocessableEntity.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDWingsWingIDNotFound.classForCoder()
		_ = Universe.GetUniverseStationsStationIDNotFound.classForCoder()
		_ = Fittings.Item.classForCoder()
		_ = Sovereignty.Campaign.GetSovereigntyCampaignsParticipants.classForCoder()
		_ = Dogma.GetDogmaEffectsEffectIDNotFound.classForCoder()
		_ = Universe.StructureInformation.classForCoder()
		_ = Character.GetCharactersCharacterIDPortraitNotFound.classForCoder()
		_ = Fittings.CreateFittingResult.classForCoder()
		_ = Universe.GetUniverseTypesTypeIDNotFound.classForCoder()
		_ = Universe.GetUniverseSystemsSystemIDNotFound.classForCoder()
		_ = Universe.Race.classForCoder()
		_ = Opportunities.Group.classForCoder()
		_ = Universe.Jump.classForCoder()
		_ = Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition.classForCoder()
		_ = Killmails.Killmail.Victim.Item.Item.classForCoder()
		_ = Fleets.SquadCreated.classForCoder()
		_ = Contacts.Label.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed.classForCoder()
		_ = Alliance.GetAlliancesAllianceIDIconsNotFound.classForCoder()
		_ = Universe.StructureInformation.GetUniverseStructuresStructureIDPosition.classForCoder()
		_ = Universe.StationInformation.GetUniverseStationsStationIDPosition.classForCoder()
		_ = Corporation.Icon.classForCoder()
		_ = Character.Blueprint.classForCoder()
		_ = Universe.ConstellationInformation.classForCoder()
		_ = Dogma.GetDogmaAttributesAttributeIDNotFound.classForCoder()
		_ = Fleets.PutFleetsFleetIDNotFound.classForCoder()
		_ = Bookmarks.Folder.classForCoder()
		_ = Loyalty.Offer.classForCoder()
		_ = Universe.GetUniversePlanetsPlanetIDNotFound.classForCoder()
		_ = Calendar.Response.classForCoder()
		_ = Universe.GetUniverseRegionsRegionIDNotFound.classForCoder()
		_ = Mail.PostCharactersCharacterIDMailBadRequest.classForCoder()
		_ = Fleets.PostFleetsFleetIDMembersNotFound.classForCoder()
		_ = Universe.PostUniverseNamesNotFound.classForCoder()
		_ = Contacts.Contact.classForCoder()
		_ = Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems.classForCoder()
		_ = Character.Portrait.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.classForCoder()
		_ = Character.Affiliation.classForCoder()
		_ = Character.Characters.classForCoder()
		_ = Alliance.Icon.classForCoder()
		_ = Fleets.PostFleetsFleetIDMembersUnprocessableEntity.classForCoder()
		_ = Mail.DeleteCharactersCharacterIDMailLabelsLabelIDUnprocessableEntity.classForCoder()
		_ = Sovereignty.Campaign.classForCoder()
		_ = PlanetaryInteraction.SchematicInformation.classForCoder()
		_ = Universe.GetUniverseStargatesStargateIDNotFound.classForCoder()
		_ = Sovereignty.System.classForCoder()
		_ = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.classForCoder()
		_ = Market.History.classForCoder()
		_ = Character.Standing.classForCoder()
		_ = Dogma.Attribute.classForCoder()
		_ = Search.SearchResult.classForCoder()
		_ = Universe.SystemKills.classForCoder()
		_ = Universe.PlanetInformation.classForCoder()
		_ = Market.CharacterOrder.classForCoder()
		_ = Location.CharacterLocation.classForCoder()
		_ = Calendar.Summary.classForCoder()
		_ = Fleets.PutFleetsFleetIDMembersMemberIDNotFound.classForCoder()
		_ = Character.ChatChannel.classForCoder()
		_ = Status.GetStatusOk.classForCoder()
		_ = Fleets.Member.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound.classForCoder()
		_ = Assets.Asset.classForCoder()
		_ = Corporation.Name.classForCoder()
		_ = Opportunities.OpportunitiesTask.classForCoder()
		_ = Universe.SolarSystemInformation.classForCoder()
		_ = Universe.StargateInformation.GetUniverseStargatesStargateIDDestination.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails.classForCoder()
		_ = Universe.MoonInformation.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsNotFound.classForCoder()
		_ = Alliance.Information.classForCoder()
		_ = Skills.CharacterSkills.Skill.classForCoder()
		_ = Fleets.WingCreated.classForCoder()
		_ = Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailMailIDNotFound.classForCoder()
		_ = Character.Research.classForCoder()
		_ = Mail.Subscription.classForCoder()
		_ = Killmails.GetKillmailsKillmailIDKillmailHashUnprocessableEntity.classForCoder()
		_ = Skills.SkillQueueItem.classForCoder()
		_ = Dogma.Effect.classForCoder()
		_ = Corporation.History.classForCoder()
		_ = Calendar.Event.classForCoder()
		_ = Industry.SolarSystemCostIndices.classForCoder()
		_ = Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.classForCoder()
		_ = Market.GetMarketsRegionIDOrdersUnprocessableEntity.classForCoder()
		_ = Wallet.WalletJournalItem.classForCoder()
		_ = Alliance.GetAlliancesAllianceIDNotFound.classForCoder()
		_ = Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound.classForCoder()
		_ = Universe.TypeInformation.classForCoder()
		_ = Universe.GetUniverseMoonsMoonIDNotFound.classForCoder()
		_ = Market.Order.classForCoder()
		_ = Killmails.Recent.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads.classForCoder()
		_ = Mail.UpdateContents.classForCoder()
		_ = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksItem.classForCoder()
		_ = Corporation.VulnerabilitySchedule.classForCoder()
		_ = Market.Price.classForCoder()
		_ = Character.CorporationHistory.classForCoder()
		_ = Corporation.Structure.GetCorporationsCorporationIDStructuresServices.classForCoder()
		_ = Killmails.Killmail.Attacker.classForCoder()
		_ = Fleets.PutFleetsFleetIDWingsWingIDNotFound.classForCoder()
		_ = Mail.NewMail.classForCoder()
		_ = Universe.MoonInformation.GetUniverseMoonsMoonIDPosition.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsOk.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Link.classForCoder()
		_ = Wars.WarInformation.GetWarsWarIDDefender.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Route.Waypoint.classForCoder()
		_ = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.classForCoder()
		_ = Universe.GraphicInformation.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDIconsNotFound.classForCoder()
		_ = Wallet.WalletJournalItem.ExtraInfo.classForCoder()
		_ = Wars.WarInformation.classForCoder()
		_ = Killmails.Killmail.Victim.classForCoder()
		_ = Corporation.Structure.classForCoder()
		_ = Character.Medal.GetCharactersCharacterIDMedalsGraphics.classForCoder()
		_ = Sovereignty.Structure.classForCoder()
		_ = Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition.classForCoder()
		_ = Fleets.PostFleetsFleetIDWingsNotFound.classForCoder()
		_ = UserInterface.NewMail.classForCoder()
		_ = Universe.Faction.classForCoder()
		_ = Character.Name.classForCoder()
		_ = Universe.GetUniverseGroupsGroupIDNotFound.classForCoder()
		_ = Wars.GetWarsWarIDUnprocessableEntity.classForCoder()
		_ = Dogma.Effect.GetDogmaEffectsEffectIDModifiers.classForCoder()
		_ = Fleets.Movement.classForCoder()
		_ = Fleets.Naming.classForCoder()
		_ = Universe.Bloodline.classForCoder()
		_ = Universe.GetUniverseCategoriesCategoryIDNotFound.classForCoder()
		_ = Fittings.MutableFitting.classForCoder()
		_ = Loyalty.Point.classForCoder()
		_ = Industry.Job.classForCoder()
		_ = Clones.JumpClones.Location.classForCoder()
		_ = Universe.GetUniverseConstellationsConstellationIDNotFound.classForCoder()
		_ = Fleets.Invitation.classForCoder()
		_ = PlanetaryInteraction.Colony.classForCoder()
		_ = Killmails.Killmail.classForCoder()
		_ = Mail.MailLabelsAndUnreadCounts.Label.classForCoder()
		_ = Mail.PutCharactersCharacterIDMailMailIDBadRequest.classForCoder()
		_ = Wars.WarInformation.GetWarsWarIDAllies.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators.classForCoder()
		_ = Bookmarks.Bookmark.classForCoder()
		_ = Fleets.PutFleetsFleetIDSquadsSquadIDNotFound.classForCoder()
		_ = Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition.classForCoder()
		_ = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksTarget.GetCharactersCharacterIDBookmarksCoordinates.classForCoder()
		_ = Universe.StargateInformation.GetUniverseStargatesStargateIDPosition.classForCoder()
		_ = Fleets.Information.classForCoder()
		_ = Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets.classForCoder()
		_ = Incursions.Incursion.classForCoder()
		_ = Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity.classForCoder()
		_ = Market.Structure.classForCoder()
		_ = Universe.GetUniverseStructuresStructureIDNotFound.classForCoder()
		_ = Opportunities.CompletedTask.classForCoder()
		_ = Insurance.Price.GetInsurancePricesLevels.classForCoder()
		_ = PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound.classForCoder()
		_ = Character.PostCharactersAffiliationUnprocessableEntity.classForCoder()
		_ = Fittings.Fitting.classForCoder()
		_ = Fleets.PutFleetsFleetIDBadRequest.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked.classForCoder()
		_ = Search.CharacterSearchResult.classForCoder()
		_ = Universe.ItemGroupInformation.classForCoder()
		_ = Alliance.Name.classForCoder()
		_ = Contracts.Item.classForCoder()
		_ = Wars.WarInformation.GetWarsWarIDAggressor.classForCoder()
		_ = Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition.classForCoder()
		_ = Mail.Header.classForCoder()
		_ = Mail.Recipient.classForCoder()
		_ = Fleets.GetFleetsFleetIDNotFound.classForCoder()
		_ = Character.Fatigue.classForCoder()
		_ = Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul.classForCoder()
		_ = Mail.MailLabelsAndUnreadCounts.classForCoder()
		_ = Location.CharacterShip.classForCoder()
		_ = Universe.StationInformation.classForCoder()
		_ = Clones.JumpClones.JumpClone.classForCoder()
		_ = UserInterface.PostUiOpenwindowNewmailUnprocessableEntity.classForCoder()
		_ = Market.GetMarketsGroupsMarketGroupIDNotFound.classForCoder()
		_ = InternalServerError.classForCoder()
		_ = Corporation.Member.classForCoder()
		_ = Universe.RegionInformation.classForCoder()
		_ = Mail.Label.classForCoder()
		_ = Clones.JumpClones.classForCoder()
		_ = Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul.classForCoder()
		_ = Forbidden.classForCoder()
		_ = Universe.StargateInformation.classForCoder()
		_ = Character.CSPAChargeCost.classForCoder()
	}
}

public extension ESI.Scope {
	
	public static let esiIndustryReadCharacterJobsV1 = ESI.Scope("esi-industry.read_character_jobs.v1")
	public static let esiClonesReadClonesV1 = ESI.Scope("esi-clones.read_clones.v1")
	public static let esiCharactersReadCorporationRolesV1 = ESI.Scope("esi-characters.read_corporation_roles.v1")
	public static let esiCorporationsReadCorporationMembershipV1 = ESI.Scope("esi-corporations.read_corporation_membership.v1")
	public static let esiFittingsWriteFittingsV1 = ESI.Scope("esi-fittings.write_fittings.v1")
	public static let esiCharactersReadStandingsV1 = ESI.Scope("esi-characters.read_standings.v1")
	public static let esiUniverseReadStructuresV1 = ESI.Scope("esi-universe.read_structures.v1")
	public static let esiMarketsStructureMarketsV1 = ESI.Scope("esi-markets.structure_markets.v1")
	public static let esiCharactersReadMedalsV1 = ESI.Scope("esi-characters.read_medals.v1")
	public static let esiCharactersReadFatigueV1 = ESI.Scope("esi-characters.read_fatigue.v1")
	public static let esiMailReadMailV1 = ESI.Scope("esi-mail.read_mail.v1")
	public static let esiLocationReadOnlineV1 = ESI.Scope("esi-location.read_online.v1")
	public static let esiSkillsReadSkillqueueV1 = ESI.Scope("esi-skills.read_skillqueue.v1")
	public static let esiMailOrganizeMailV1 = ESI.Scope("esi-mail.organize_mail.v1")
	public static let esiKillmailsReadKillmailsV1 = ESI.Scope("esi-killmails.read_killmails.v1")
	public static let esiMailSendMailV1 = ESI.Scope("esi-mail.send_mail.v1")
	public static let esiCharactersReadBlueprintsV1 = ESI.Scope("esi-characters.read_blueprints.v1")
	public static let esiAssetsReadAssetsV1 = ESI.Scope("esi-assets.read_assets.v1")
	public static let esiWalletReadCharacterWalletV1 = ESI.Scope("esi-wallet.read_character_wallet.v1")
	public static let esiMarketsReadCharacterOrdersV1 = ESI.Scope("esi-markets.read_character_orders.v1")
	public static let esiCharactersReadOpportunitiesV1 = ESI.Scope("esi-characters.read_opportunities.v1")
	public static let esiCharactersReadAgentsResearchV1 = ESI.Scope("esi-characters.read_agents_research.v1")
	public static let esiFittingsReadFittingsV1 = ESI.Scope("esi-fittings.read_fittings.v1")
	public static let esiFleetsWriteFleetV1 = ESI.Scope("esi-fleets.write_fleet.v1")
	public static let esiClonesReadImplantsV1 = ESI.Scope("esi-clones.read_implants.v1")
	public static let esiSkillsReadSkillsV1 = ESI.Scope("esi-skills.read_skills.v1")
	public static let esiLocationReadShipTypeV1 = ESI.Scope("esi-location.read_ship_type.v1")
	public static let esiCharactersWriteContactsV1 = ESI.Scope("esi-characters.write_contacts.v1")
	public static let esiCalendarRespondCalendarEventsV1 = ESI.Scope("esi-calendar.respond_calendar_events.v1")
	public static let esiPlanetsManagePlanetsV1 = ESI.Scope("esi-planets.manage_planets.v1")
	public static let esiSearchSearchStructuresV1 = ESI.Scope("esi-search.search_structures.v1")
	public static let esiLocationReadLocationV1 = ESI.Scope("esi-location.read_location.v1")
	public static let esiCharactersReadContactsV1 = ESI.Scope("esi-characters.read_contacts.v1")
	public static let esiCalendarReadCalendarEventsV1 = ESI.Scope("esi-calendar.read_calendar_events.v1")
	public static let esiUiWriteWaypointV1 = ESI.Scope("esi-ui.write_waypoint.v1")
	public static let esiUiOpenWindowV1 = ESI.Scope("esi-ui.open_window.v1")
	public static let esiFleetsReadFleetV1 = ESI.Scope("esi-fleets.read_fleet.v1")
	public static let esiCharactersReadChatChannelsV1 = ESI.Scope("esi-characters.read_chat_channels.v1")
	public static let esiCorporationsWriteStructuresV1 = ESI.Scope("esi-corporations.write_structures.v1")
	public static let esiBookmarksReadCharacterBookmarksV1 = ESI.Scope("esi-bookmarks.read_character_bookmarks.v1")
	public static let esiCharactersReadLoyaltyV1 = ESI.Scope("esi-characters.read_loyalty.v1")
	public static let esiContractsReadCharacterContractsV1 = ESI.Scope("esi-contracts.read_character_contracts.v1")
	public static let esiCorporationsReadStructuresV1 = ESI.Scope("esi-corporations.read_structures.v1")
	
	public static var all: [ESI.Scope]  {
		get {
			return [
			.esiIndustryReadCharacterJobsV1,
			.esiClonesReadClonesV1,
			.esiCharactersReadCorporationRolesV1,
			.esiCorporationsReadCorporationMembershipV1,
			.esiFittingsWriteFittingsV1,
			.esiCharactersReadStandingsV1,
			.esiUniverseReadStructuresV1,
			.esiMarketsStructureMarketsV1,
			.esiCharactersReadMedalsV1,
			.esiCharactersReadFatigueV1,
			.esiMailReadMailV1,
			.esiLocationReadOnlineV1,
			.esiSkillsReadSkillqueueV1,
			.esiMailOrganizeMailV1,
			.esiKillmailsReadKillmailsV1,
			.esiMailSendMailV1,
			.esiCharactersReadBlueprintsV1,
			.esiAssetsReadAssetsV1,
			.esiWalletReadCharacterWalletV1,
			.esiMarketsReadCharacterOrdersV1,
			.esiCharactersReadOpportunitiesV1,
			.esiCharactersReadAgentsResearchV1,
			.esiFittingsReadFittingsV1,
			.esiFleetsWriteFleetV1,
			.esiClonesReadImplantsV1,
			.esiSkillsReadSkillsV1,
			.esiLocationReadShipTypeV1,
			.esiCharactersWriteContactsV1,
			.esiCalendarRespondCalendarEventsV1,
			.esiPlanetsManagePlanetsV1,
			.esiSearchSearchStructuresV1,
			.esiLocationReadLocationV1,
			.esiCharactersReadContactsV1,
			.esiCalendarReadCalendarEventsV1,
			.esiUiWriteWaypointV1,
			.esiUiOpenWindowV1,
			.esiFleetsReadFleetV1,
			.esiCharactersReadChatChannelsV1,
			.esiCorporationsWriteStructuresV1,
			.esiBookmarksReadCharacterBookmarksV1,
			.esiCharactersReadLoyaltyV1,
			.esiContractsReadCharacterContractsV1,
			.esiCorporationsReadStructuresV1
			]
		}
	}
}

