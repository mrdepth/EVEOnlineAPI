import Foundation
import Alamofire

public extension ESI {
	
	@objc(ESIForbidden) public class Forbidden: NSObject, NSSecureCoding, NSCopying, JSONCoding {
		
		
		public var error: String = String()
		public var ssoStatus: Int? = nil
		
		
		public required init(json: Any) throws {
			guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
			
			guard let error = dictionary["error"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
			self.error = error
			ssoStatus = dictionary["sso_status"] as? Int
			
			super.init()
		}
		
		override public init() {
			super.init()
		}
		
		public static var supportsSecureCoding: Bool {
			return true
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
	
	
	@objc(ESIInternalServerError) public class InternalServerError: NSObject, NSSecureCoding, NSCopying, JSONCoding {
		
		
		public var error: String = String()
		
		
		public required init(json: Any) throws {
			guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
			
			guard let error = dictionary["error"] as? String else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
			self.error = error
			
			super.init()
		}
		
		override public init() {
			super.init()
		}
		
		public static var supportsSecureCoding: Bool {
			return true
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
			guard let s = json as? String, let v = Language(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
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
			guard let s = json as? String, let v = Datasource(rawValue: s) else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
			self = v
		}
		
		public var httpQuery: String? {
			return rawValue
		}
		
	}
	
	
	class func loadClassess() {
		_ = Routes.GetRouteOriginDestinationNotFound.classForCoder()
		_ = Wars.Kills.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDRolesHistoryOk.classForCoder()
		_ = Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.GetCorporationsCorporationIDWalletsDivisionJournalExtraInfo.classForCoder()
		_ = Insurance.Price.classForCoder()
		_ = FactionWarfare.FactionWar.classForCoder()
		_ = Universe.Name.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Pin.classForCoder()
		_ = Universe.ItemCategoryInformation.classForCoder()
		_ = Contracts.Contract.classForCoder()
		_ = Market.GetMarketsRegionIDHistoryUnprocessableEntity.classForCoder()
		_ = Corporation.Information.classForCoder()
		_ = Character.GetCharactersCharacterIDNotFound.classForCoder()
		_ = Corporation.Role.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDNotFound.classForCoder()
		_ = Character.Medal.classForCoder()
		_ = Fleets.GetFleetsFleetIDMembersNotFound.classForCoder()
		_ = Mail.MailBody.classForCoder()
		_ = Industry.GetCorporationCorporationIDMiningObserversObserverIDOk.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Route.classForCoder()
		_ = Universe.GetUniverseGraphicsGraphicIDNotFound.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsMuted.classForCoder()
		_ = Contracts.Bid.classForCoder()
		_ = Character.Information.classForCoder()
		_ = Market.ItemGroupInformation.classForCoder()
		_ = FactionWarfare.Characters.GetFwLeaderboardsCharactersKills.classForCoder()
		_ = Wallet.Transaction.classForCoder()
		_ = PlanetaryInteraction.GetUniverseSchematicsSchematicIDNotFound.classForCoder()
		_ = Industry.Facilities.classForCoder()
		_ = FactionWarfare.System.classForCoder()
		_ = Status.ServerStatus.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.Head.classForCoder()
		_ = Skills.CharacterSkills.classForCoder()
		_ = Skills.CharacterAttributes.classForCoder()
		_ = Fleets.FleetUpdate.classForCoder()
		_ = Assets.PostCharactersCharacterIDAssetsNamesOk.classForCoder()
		_ = Killmails.Killmail.Victim.Item.classForCoder()
		_ = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksItem.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDMedalsIssuedOk.classForCoder()
		_ = Wars.GetWarsWarIDKillmailsUnprocessableEntity.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDWingsWingIDNotFound.classForCoder()
		_ = Universe.GetUniverseStationsStationIDNotFound.classForCoder()
		_ = Fittings.Item.classForCoder()
		_ = Sovereignty.Campaign.GetSovereigntyCampaignsParticipants.classForCoder()
		_ = Contracts.GetCorporationsCorporationIDContractsContractIDBidsOk.classForCoder()
		_ = FactionWarfare.Leaderboards.GetFwLeaderboardsYesterday.classForCoder()
		_ = Dogma.GetDogmaEffectsEffectIDNotFound.classForCoder()
		_ = FactionWarfare.FactionStats.GetFwStatsVictoryPoints.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDStandingsOk.classForCoder()
		_ = Universe.StructureInformation.classForCoder()
		_ = Character.GetCharactersCharacterIDPortraitNotFound.classForCoder()
		_ = Universe.PostUniverseIdsOk.PostUniverseIdsInventoryTypes.classForCoder()
		_ = Wallet.GetCorporationsCorporationIDWalletsDivisionTransactionsOk.classForCoder()
		_ = FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsVictoryPoints.classForCoder()
		_ = Fittings.CreateFittingResult.classForCoder()
		_ = Universe.GetUniverseTypesTypeIDNotFound.classForCoder()
		_ = Assets.PostCharactersCharacterIDAssetsLocationsOk.classForCoder()
		_ = Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPosition.classForCoder()
		_ = Assets.PostCorporationsCorporationIDAssetsNamesOk.classForCoder()
		_ = Opportunities.Group.classForCoder()
		_ = Fleets.SquadCreated.classForCoder()
		_ = Killmails.Killmail.Victim.Item.Item.classForCoder()
		_ = FactionWarfare.Leaderboards.classForCoder()
		_ = Universe.Race.classForCoder()
		_ = Contacts.Label.classForCoder()
		_ = Universe.GetUniverseSystemsSystemIDNotFound.classForCoder()
		_ = Universe.Jump.classForCoder()
		_ = FactionWarfare.GetCorporationsCorporationIDFwStatsOk.GetCorporationsCorporationIDFwStatsKills.classForCoder()
		_ = Alliance.GetAlliancesAllianceIDIconsNotFound.classForCoder()
		_ = Assets.PostCorporationsCorporationIDAssetsLocationsOk.PostCorporationsCorporationIDAssetsLocationsPosition.classForCoder()
		_ = Universe.PostUniverseIdsOk.PostUniverseIdsConstellations.classForCoder()
		_ = Universe.PostUniverseIdsOk.PostUniverseIdsFactions.classForCoder()
		_ = Fleets.PutFleetsFleetIDNotFound.classForCoder()
		_ = Killmails.GetCorporationsCorporationIDKillmailsRecentOk.classForCoder()
		_ = Universe.StationInformation.GetUniverseStationsStationIDPosition.classForCoder()
		_ = Universe.ConstellationInformation.classForCoder()
		_ = Universe.StructureInformation.GetUniverseStructuresStructureIDPosition.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsAllowed.classForCoder()
		_ = Corporation.Icon.classForCoder()
		_ = Bookmarks.Folder.classForCoder()
		_ = FactionWarfare.Corporations.classForCoder()
		_ = Character.Blueprint.classForCoder()
		_ = Dogma.GetDogmaAttributesAttributeIDNotFound.classForCoder()
		_ = Wallet.GetCorporationsCorporationIDWalletsDivisionJournalOk.classForCoder()
		_ = Loyalty.Offer.classForCoder()
		_ = Universe.GetUniversePlanetsPlanetIDNotFound.classForCoder()
		_ = Character.GetCharactersCharacterIDTitlesOk.classForCoder()
		_ = Calendar.Response.classForCoder()
		_ = Universe.GetUniverseRegionsRegionIDNotFound.classForCoder()
		_ = Mail.PostCharactersCharacterIDMailBadRequest.classForCoder()
		_ = FactionWarfare.Corporations.GetFwLeaderboardsCorporationsLastWeek.classForCoder()
		_ = Fleets.PostFleetsFleetIDMembersNotFound.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.GetCorporationsCorporationIDStarbasesStarbaseIDFuels.classForCoder()
		_ = Industry.GetCharactersCharacterIDMiningOk.classForCoder()
		_ = Contacts.Contact.classForCoder()
		_ = Universe.PostUniverseNamesNotFound.classForCoder()
		_ = Loyalty.Offer.GetLoyaltyStoresCorporationIDOffersRequiredItems.classForCoder()
		_ = FactionWarfare.FactionStats.classForCoder()
		_ = Character.Portrait.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.classForCoder()
		_ = Character.Affiliation.classForCoder()
		_ = Alliance.Icon.classForCoder()
		_ = Bookmarks.GetCorporationsCorporationIDBookmarksFoldersOk.classForCoder()
		_ = Fleets.PostFleetsFleetIDMembersUnprocessableEntity.classForCoder()
		_ = Sovereignty.Campaign.classForCoder()
		_ = PlanetaryInteraction.SchematicInformation.classForCoder()
		_ = Mail.DeleteCharactersCharacterIDMailLabelsLabelIDUnprocessableEntity.classForCoder()
		_ = Universe.GetUniverseStargatesStargateIDNotFound.classForCoder()
		_ = Sovereignty.System.classForCoder()
		_ = Industry.SolarSystemCostIndices.GetIndustrySystemsCostIndices.classForCoder()
		_ = Universe.PostUniverseIdsOk.classForCoder()
		_ = FactionWarfare.Corporations.GetFwLeaderboardsCorporationsVictoryPoints.classForCoder()
		_ = Market.History.classForCoder()
		_ = FactionWarfare.Characters.GetFwLeaderboardsCharactersYesterday.classForCoder()
		_ = Character.Standing.classForCoder()
		_ = Dogma.Attribute.classForCoder()
		_ = Search.SearchResult.classForCoder()
		_ = Market.CharacterOrder.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Pin.Contents.classForCoder()
		_ = Universe.SystemKills.classForCoder()
		_ = Universe.PlanetInformation.classForCoder()
		_ = Fleets.GetCharactersCharacterIDFleetNotFound.classForCoder()
		_ = Universe.PostUniverseIdsOk.PostUniverseIdsRegions.classForCoder()
		_ = Wallet.Balance.classForCoder()
		_ = Calendar.Summary.classForCoder()
		_ = Contacts.GetCorporationsCorporationIDContactsOk.classForCoder()
		_ = FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsKills.classForCoder()
		_ = Location.CharacterLocation.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDContainersLogsOk.classForCoder()
		_ = Fleets.PutFleetsFleetIDMembersMemberIDNotFound.classForCoder()
		_ = Character.ChatChannel.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsWallet.classForCoder()
		_ = Fleets.Member.classForCoder()
		_ = FactionWarfare.Leaderboards.GetFwLeaderboardsActiveTotal.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDSquadsSquadIDNotFound.classForCoder()
		_ = Universe.StargateInformation.GetUniverseStargatesStargateIDDestination.classForCoder()
		_ = Assets.Asset.classForCoder()
		_ = Opportunities.OpportunitiesTask.classForCoder()
		_ = Universe.SolarSystemInformation.classForCoder()
		_ = Industry.GetCorporationsCorporationIDIndustryJobsOk.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDServices.classForCoder()
		_ = Corporation.Name.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDFacilitiesOk.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Pin.FactoryDetails.classForCoder()
		_ = Universe.MoonInformation.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDShareholdersOk.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsNotFound.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDMembersTitlesOk.classForCoder()
		_ = Alliance.Information.classForCoder()
		_ = Fleets.WingCreated.classForCoder()
		_ = Skills.CharacterSkills.Skill.classForCoder()
		_ = FactionWarfare.GetCharactersCharacterIDFwStatsOk.classForCoder()
		_ = Universe.TypeInformation.GetUniverseTypesTypeIDDogmaEffects.classForCoder()
		_ = Contracts.GetCorporationsCorporationIDContractsOk.classForCoder()
		_ = Universe.PostUniverseIdsOk.PostUniverseIdsAlliances.classForCoder()
		_ = Mail.GetCharactersCharacterIDMailMailIDNotFound.classForCoder()
		_ = Character.Research.classForCoder()
		_ = FactionWarfare.Characters.GetFwLeaderboardsCharactersLastWeek.classForCoder()
		_ = Mail.Subscription.classForCoder()
		_ = Killmails.GetKillmailsKillmailIDKillmailHashUnprocessableEntity.classForCoder()
		_ = Skills.SkillQueueItem.classForCoder()
		_ = Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksCoordinates.classForCoder()
		_ = Dogma.Effect.classForCoder()
		_ = Corporation.History.classForCoder()
		_ = Calendar.Event.classForCoder()
		_ = Universe.GetUniverseStarsStarIDOk.classForCoder()
		_ = Industry.SolarSystemCostIndices.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDStarbasesStarbaseIDOk.classForCoder()
		_ = Universe.TypeInformation.GetUniverseTypesTypeIDDogmaAttributes.classForCoder()
		_ = Market.GetMarketsRegionIDOrdersUnprocessableEntity.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Pin.ExtractorDetails.classForCoder()
		_ = Wallet.WalletJournalItem.classForCoder()
		_ = Alliance.GetAlliancesAllianceIDNotFound.classForCoder()
		_ = Fleets.PostFleetsFleetIDWingsWingIDSquadsNotFound.classForCoder()
		_ = Universe.TypeInformation.classForCoder()
		_ = Market.Order.classForCoder()
		_ = Universe.GetUniverseMoonsMoonIDNotFound.classForCoder()
		_ = Killmails.Recent.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsOk.GetFleetsFleetIDWingsSquads.classForCoder()
		_ = Mail.UpdateContents.classForCoder()
		_ = Corporation.VulnerabilitySchedule.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDMedalsOk.classForCoder()
		_ = Market.Price.classForCoder()
		_ = Contacts.GetAlliancesAllianceIDContactsOk.classForCoder()
		_ = Character.CorporationHistory.classForCoder()
		_ = Corporation.Structure.GetCorporationsCorporationIDStructuresServices.classForCoder()
		_ = FactionWarfare.Leaderboards.GetFwLeaderboardsKills.classForCoder()
		_ = Killmails.Killmail.Attacker.classForCoder()
		_ = Location.GetCharactersCharacterIDOnlineOk.classForCoder()
		_ = Fleets.PutFleetsFleetIDWingsWingIDNotFound.classForCoder()
		_ = Universe.MoonInformation.GetUniverseMoonsMoonIDPosition.classForCoder()
		_ = Mail.NewMail.classForCoder()
		_ = Fleets.GetFleetsFleetIDWingsOk.classForCoder()
		_ = PlanetaryInteraction.ColonyLayout.Link.classForCoder()
		_ = Wars.WarInformation.GetWarsWarIDDefender.classForCoder()
		_ = Fleets.GetCharactersCharacterIDFleetOk.classForCoder()
		_ = FactionWarfare.Leaderboards.GetFwLeaderboardsVictoryPoints.classForCoder()
		_ = Bookmarks.GetCorporationsCorporationIDBookmarksOk.GetCorporationsCorporationIDBookmarksItem.classForCoder()
		_ = Fleets.DeleteFleetsFleetIDMembersMemberIDNotFound.classForCoder()
		_ = FactionWarfare.Characters.GetFwLeaderboardsCharactersActiveTotal.classForCoder()
		_ = Industry.GetCorporationCorporationIDMiningObserversOk.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDOutpostsOutpostIDOk.GetCorporationsCorporationIDOutpostsOutpostIDCoordinates.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDStarbasesOk.classForCoder()
		_ = FactionWarfare.Characters.classForCoder()
		_ = Universe.GraphicInformation.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDIconsNotFound.classForCoder()
		_ = Bookmarks.Bookmark.GetCharactersCharacterIDBookmarksCoordinates.classForCoder()
		_ = FactionWarfare.Characters.GetFwLeaderboardsCharactersVictoryPoints.classForCoder()
		_ = Wallet.WalletJournalItem.ExtraInfo.classForCoder()
		_ = Wars.WarInformation.classForCoder()
		_ = Killmails.Killmail.Victim.classForCoder()
		_ = Corporation.Structure.classForCoder()
		_ = Character.Medal.GetCharactersCharacterIDMedalsGraphics.classForCoder()
		_ = Assets.PostCorporationsCorporationIDAssetsLocationsOk.classForCoder()
		_ = Sovereignty.Structure.classForCoder()
		_ = Universe.ConstellationInformation.GetUniverseConstellationsConstellationIDPosition.classForCoder()
		_ = Fleets.PostFleetsFleetIDWingsNotFound.classForCoder()
		_ = UserInterface.NewMail.classForCoder()
		_ = Universe.Faction.classForCoder()
		_ = Character.Name.classForCoder()
		_ = Universe.GetUniverseGroupsGroupIDNotFound.classForCoder()
		_ = Wars.GetWarsWarIDUnprocessableEntity.classForCoder()
		_ = Universe.PostUniverseIdsOk.PostUniverseIdsCorporations.classForCoder()
		_ = Fleets.Movement.classForCoder()
		_ = Fleets.Naming.classForCoder()
		_ = Dogma.Effect.GetDogmaEffectsEffectIDModifiers.classForCoder()
		_ = Universe.Bloodline.classForCoder()
		_ = Universe.GetUniverseCategoriesCategoryIDNotFound.classForCoder()
		_ = Universe.PostUniverseIdsOk.PostUniverseIdsCharacters.classForCoder()
		_ = Market.GetCorporationsCorporationIDOrdersOk.classForCoder()
		_ = Fittings.MutableFitting.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDDivisionsOk.classForCoder()
		_ = Loyalty.Point.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDMembertrackingOk.classForCoder()
		_ = Assets.PostCharactersCharacterIDAssetsLocationsOk.PostCharactersCharacterIDAssetsLocationsPosition.classForCoder()
		_ = Clones.JumpClones.Location.classForCoder()
		_ = Industry.Job.classForCoder()
		_ = Universe.GetUniverseConstellationsConstellationIDNotFound.classForCoder()
		_ = Fleets.Invitation.classForCoder()
		_ = Calendar.GetCharactersCharacterIDCalendarEventIDAttendeesOk.classForCoder()
		_ = Killmails.Killmail.classForCoder()
		_ = PlanetaryInteraction.Colony.classForCoder()
		_ = Mail.MailLabelsAndUnreadCounts.Label.classForCoder()
		_ = Assets.GetCorporationsCorporationIDAssetsOk.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsOperators.classForCoder()
		_ = Wars.WarInformation.GetWarsWarIDAllies.classForCoder()
		_ = Mail.PutCharactersCharacterIDMailMailIDBadRequest.classForCoder()
		_ = Bookmarks.Bookmark.classForCoder()
		_ = Universe.PostUniverseIdsOk.PostUniverseIdsStations.classForCoder()
		_ = Fleets.PutFleetsFleetIDSquadsSquadIDNotFound.classForCoder()
		_ = FactionWarfare.Corporations.GetFwLeaderboardsCorporationsActiveTotal.classForCoder()
		_ = Killmails.Killmail.Victim.GetKillmailsKillmailIDKillmailHashPosition.classForCoder()
		_ = Universe.StargateInformation.GetUniverseStargatesStargateIDPosition.classForCoder()
		_ = Fleets.Information.classForCoder()
		_ = Universe.SolarSystemInformation.GetUniverseSystemsSystemIDPlanets.classForCoder()
		_ = Industry.GetCorporationCorporationIDMiningExtractionsOk.classForCoder()
		_ = FactionWarfare.GetCorporationsCorporationIDFwStatsOk.classForCoder()
		_ = Universe.PostUniverseIdsServiceUnavailable.classForCoder()
		_ = Fleets.PutFleetsFleetIDMembersMemberIDUnprocessableEntity.classForCoder()
		_ = Market.Structure.classForCoder()
		_ = FactionWarfare.FactionStats.GetFwStatsKills.classForCoder()
		_ = Universe.GetUniverseStructuresStructureIDNotFound.classForCoder()
		_ = Incursions.Incursion.classForCoder()
		_ = Opportunities.CompletedTask.classForCoder()
		_ = Insurance.Price.GetInsurancePricesLevels.classForCoder()
		_ = Character.Role.classForCoder()
		_ = PlanetaryInteraction.GetCharactersCharacterIDPlanetsPlanetIDNotFound.classForCoder()
		_ = Fittings.Fitting.classForCoder()
		_ = Fleets.PutFleetsFleetIDBadRequest.classForCoder()
		_ = Character.ChatChannel.GetCharactersCharacterIDChatChannelsBlocked.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDTitlesOk.classForCoder()
		_ = Search.CharacterSearchResult.classForCoder()
		_ = Universe.ItemGroupInformation.classForCoder()
		_ = FactionWarfare.GetCharactersCharacterIDFwStatsOk.GetCharactersCharacterIDFwStatsVictoryPoints.classForCoder()
		_ = Alliance.Name.classForCoder()
		_ = Character.GetCharactersCharacterIDNotificationsOk.classForCoder()
		_ = Contracts.Item.classForCoder()
		_ = Universe.PostUniverseIdsOk.PostUniverseIdsAgents.classForCoder()
		_ = Wars.WarInformation.GetWarsWarIDAggressor.classForCoder()
		_ = Universe.PlanetInformation.GetUniversePlanetsPlanetIDPosition.classForCoder()
		_ = Mail.Recipient.classForCoder()
		_ = Mail.Header.classForCoder()
		_ = Fleets.GetFleetsFleetIDNotFound.classForCoder()
		_ = Bookmarks.GetCorporationsCorporationIDBookmarksOk.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDBlueprintsOk.classForCoder()
		_ = Character.Fatigue.classForCoder()
		_ = Corporation.Structure.GetCorporationsCorporationIDStructuresNextVul.classForCoder()
		_ = Contracts.GetCorporationsCorporationIDContractsContractIDItemsOk.classForCoder()
		_ = Mail.MailLabelsAndUnreadCounts.classForCoder()
		_ = Location.CharacterShip.classForCoder()
		_ = UserInterface.PostUiOpenwindowNewmailUnprocessableEntity.classForCoder()
		_ = Clones.JumpClones.JumpClone.classForCoder()
		_ = Universe.StationInformation.classForCoder()
		_ = FactionWarfare.Corporations.GetFwLeaderboardsCorporationsYesterday.classForCoder()
		_ = Market.GetMarketsGroupsMarketGroupIDNotFound.classForCoder()
		_ = Universe.PostUniverseIdsOk.PostUniverseIdsSystems.classForCoder()
		_ = InternalServerError.classForCoder()
		_ = PlanetaryInteraction.GetCorporationsCorporationIDCustomsOfficesOk.classForCoder()
		_ = FactionWarfare.Leaderboards.GetFwLeaderboardsLastWeek.classForCoder()
		_ = Universe.RegionInformation.classForCoder()
		_ = Mail.Label.classForCoder()
		_ = Corporation.Structure.GetCorporationsCorporationIDStructuresCurrentVul.classForCoder()
		_ = Clones.JumpClones.classForCoder()
		_ = Forbidden.classForCoder()
		_ = Universe.StargateInformation.classForCoder()
		_ = Corporation.GetCorporationsCorporationIDDivisionsOk.GetCorporationsCorporationIDDivisionsHangar.classForCoder()
		_ = Character.GetCharactersCharacterIDStatsOk.classForCoder()
		_ = Character.PostCharactersAffiliationNotFound.classForCoder()
		_ = FactionWarfare.Corporations.GetFwLeaderboardsCorporationsKills.classForCoder()
		_ = Character.GetCharactersCharacterIDNotificationsContactsOk.classForCoder()
	}
}

public extension ESI.Scope {
	
	public static let esiCorporationsReadMedalsV1 = ESI.Scope("esi-corporations.read_medals.v1")
	public static let esiIndustryReadCharacterJobsV1 = ESI.Scope("esi-industry.read_character_jobs.v1")
	public static let esiCharactersReadCorporationRolesV1 = ESI.Scope("esi-characters.read_corporation_roles.v1")
	public static let esiCorporationsReadCorporationMembershipV1 = ESI.Scope("esi-corporations.read_corporation_membership.v1")
	public static let esiCharactersReadStandingsV1 = ESI.Scope("esi-characters.read_standings.v1")
	public static let esiUniverseReadStructuresV1 = ESI.Scope("esi-universe.read_structures.v1")
	public static let esiMarketsStructureMarketsV1 = ESI.Scope("esi-markets.structure_markets.v1")
	public static let esiCorporationsReadOutpostsV1 = ESI.Scope("esi-corporations.read_outposts.v1")
	public static let esiSkillsReadSkillqueueV1 = ESI.Scope("esi-skills.read_skillqueue.v1")
	public static let esiMailOrganizeMailV1 = ESI.Scope("esi-mail.organize_mail.v1")
	public static let esiMailSendMailV1 = ESI.Scope("esi-mail.send_mail.v1")
	public static let esiKillmailsReadKillmailsV1 = ESI.Scope("esi-killmails.read_killmails.v1")
	public static let esiFleetsWriteFleetV1 = ESI.Scope("esi-fleets.write_fleet.v1")
	public static let esiPlanetsReadCustomsOfficesV1 = ESI.Scope("esi-planets.read_customs_offices.v1")
	public static let esiCorporationsReadContainerLogsV1 = ESI.Scope("esi-corporations.read_container_logs.v1")
	public static let esiCorporationsReadFwStatsV1 = ESI.Scope("esi-corporations.read_fw_stats.v1")
	public static let esiCorporationsReadStarbasesV1 = ESI.Scope("esi-corporations.read_starbases.v1")
	public static let esiLocationReadShipTypeV1 = ESI.Scope("esi-location.read_ship_type.v1")
	public static let esiCharactersReadContactsV1 = ESI.Scope("esi-characters.read_contacts.v1")
	public static let esiSearchSearchStructuresV1 = ESI.Scope("esi-search.search_structures.v1")
	public static let esiPlanetsManagePlanetsV1 = ESI.Scope("esi-planets.manage_planets.v1")
	public static let esiCharactersReadNotificationsV1 = ESI.Scope("esi-characters.read_notifications.v1")
	public static let esiCorporationsTrackMembersV1 = ESI.Scope("esi-corporations.track_members.v1")
	public static let esiCorporationsReadDivisionsV1 = ESI.Scope("esi-corporations.read_divisions.v1")
	public static let esiKillmailsReadCorporationKillmailsV1 = ESI.Scope("esi-killmails.read_corporation_killmails.v1")
	public static let esiUiWriteWaypointV1 = ESI.Scope("esi-ui.write_waypoint.v1")
	public static let esiCorporationsReadFacilitiesV1 = ESI.Scope("esi-corporations.read_facilities.v1")
	public static let esiCharactersReadTitlesV1 = ESI.Scope("esi-characters.read_titles.v1")
	public static let esiCorporationsWriteStructuresV1 = ESI.Scope("esi-corporations.write_structures.v1")
	public static let esiCorporationsReadStandingsV1 = ESI.Scope("esi-corporations.read_standings.v1")
	public static let esiBookmarksReadCorporationBookmarksV1 = ESI.Scope("esi-bookmarks.read_corporation_bookmarks.v1")
	public static let esiCorporationsReadBlueprintsV1 = ESI.Scope("esi-corporations.read_blueprints.v1")
	public static let esiCharacterstatsReadV1 = ESI.Scope("esi-characterstats.read.v1")
	public static let esiCharactersReadLoyaltyV1 = ESI.Scope("esi-characters.read_loyalty.v1")
	public static let esiContractsReadCharacterContractsV1 = ESI.Scope("esi-contracts.read_character_contracts.v1")
	public static let esiAlliancesReadContactsV1 = ESI.Scope("esi-alliances.read_contacts.v1")
	public static let esiClonesReadClonesV1 = ESI.Scope("esi-clones.read_clones.v1")
	public static let esiWalletReadCorporationWalletsV1 = ESI.Scope("esi-wallet.read_corporation_wallets.v1")
	public static let esiMarketsReadCorporationOrdersV1 = ESI.Scope("esi-markets.read_corporation_orders.v1")
	public static let esiFittingsWriteFittingsV1 = ESI.Scope("esi-fittings.write_fittings.v1")
	public static let esiIndustryReadCorporationMiningV1 = ESI.Scope("esi-industry.read_corporation_mining.v1")
	public static let esiCharactersReadMedalsV1 = ESI.Scope("esi-characters.read_medals.v1")
	public static let esiCharactersReadFatigueV1 = ESI.Scope("esi-characters.read_fatigue.v1")
	public static let esiMailReadMailV1 = ESI.Scope("esi-mail.read_mail.v1")
	public static let esiLocationReadOnlineV1 = ESI.Scope("esi-location.read_online.v1")
	public static let esiCalendarRespondCalendarEventsV1 = ESI.Scope("esi-calendar.respond_calendar_events.v1")
	public static let esiAssetsReadAssetsV1 = ESI.Scope("esi-assets.read_assets.v1")
	public static let esiCorporationsReadTitlesV1 = ESI.Scope("esi-corporations.read_titles.v1")
	public static let esiCharactersReadBlueprintsV1 = ESI.Scope("esi-characters.read_blueprints.v1")
	public static let esiWalletReadCharacterWalletV1 = ESI.Scope("esi-wallet.read_character_wallet.v1")
	public static let esiMarketsReadCharacterOrdersV1 = ESI.Scope("esi-markets.read_character_orders.v1")
	public static let esiCharactersReadOpportunitiesV1 = ESI.Scope("esi-characters.read_opportunities.v1")
	public static let esiClonesReadImplantsV1 = ESI.Scope("esi-clones.read_implants.v1")
	public static let esiCharactersReadAgentsResearchV1 = ESI.Scope("esi-characters.read_agents_research.v1")
	public static let esiCalendarReadCalendarEventsV1 = ESI.Scope("esi-calendar.read_calendar_events.v1")
	public static let esiFittingsReadFittingsV1 = ESI.Scope("esi-fittings.read_fittings.v1")
	public static let esiAssetsReadCorporationAssetsV1 = ESI.Scope("esi-assets.read_corporation_assets.v1")
	public static let esiSkillsReadSkillsV1 = ESI.Scope("esi-skills.read_skills.v1")
	public static let esiCharactersWriteContactsV1 = ESI.Scope("esi-characters.write_contacts.v1")
	public static let esiIndustryReadCharacterMiningV1 = ESI.Scope("esi-industry.read_character_mining.v1")
	public static let esiLocationReadLocationV1 = ESI.Scope("esi-location.read_location.v1")
	public static let esiCharactersReadFwStatsV1 = ESI.Scope("esi-characters.read_fw_stats.v1")
	public static let esiCorporationsReadContactsV1 = ESI.Scope("esi-corporations.read_contacts.v1")
	public static let esiContractsReadCorporationContractsV1 = ESI.Scope("esi-contracts.read_corporation_contracts.v1")
	public static let esiUiOpenWindowV1 = ESI.Scope("esi-ui.open_window.v1")
	public static let esiFleetsReadFleetV1 = ESI.Scope("esi-fleets.read_fleet.v1")
	public static let esiCharactersReadChatChannelsV1 = ESI.Scope("esi-characters.read_chat_channels.v1")
	public static let esiBookmarksReadCharacterBookmarksV1 = ESI.Scope("esi-bookmarks.read_character_bookmarks.v1")
	public static let esiCorporationsReadStructuresV1 = ESI.Scope("esi-corporations.read_structures.v1")
	public static let esiIndustryReadCorporationJobsV1 = ESI.Scope("esi-industry.read_corporation_jobs.v1")
	
	public static var all: [ESI.Scope]  {
		get {
			return [
			.esiCorporationsReadMedalsV1,
			.esiIndustryReadCharacterJobsV1,
			.esiCharactersReadCorporationRolesV1,
			.esiCorporationsReadCorporationMembershipV1,
			.esiCharactersReadStandingsV1,
			.esiUniverseReadStructuresV1,
			.esiMarketsStructureMarketsV1,
			.esiCorporationsReadOutpostsV1,
			.esiSkillsReadSkillqueueV1,
			.esiMailOrganizeMailV1,
			.esiMailSendMailV1,
			.esiKillmailsReadKillmailsV1,
			.esiFleetsWriteFleetV1,
			.esiPlanetsReadCustomsOfficesV1,
			.esiCorporationsReadContainerLogsV1,
			.esiCorporationsReadFwStatsV1,
			.esiCorporationsReadStarbasesV1,
			.esiLocationReadShipTypeV1,
			.esiCharactersReadContactsV1,
			.esiSearchSearchStructuresV1,
			.esiPlanetsManagePlanetsV1,
			.esiCharactersReadNotificationsV1,
			.esiCorporationsTrackMembersV1,
			.esiCorporationsReadDivisionsV1,
			.esiKillmailsReadCorporationKillmailsV1,
			.esiUiWriteWaypointV1,
			.esiCorporationsReadFacilitiesV1,
			.esiCharactersReadTitlesV1,
			.esiCorporationsWriteStructuresV1,
			.esiCorporationsReadStandingsV1,
			.esiBookmarksReadCorporationBookmarksV1,
			.esiCorporationsReadBlueprintsV1,
			.esiCharacterstatsReadV1,
			.esiCharactersReadLoyaltyV1,
			.esiContractsReadCharacterContractsV1,
			.esiAlliancesReadContactsV1,
			.esiClonesReadClonesV1,
			.esiWalletReadCorporationWalletsV1,
			.esiMarketsReadCorporationOrdersV1,
			.esiFittingsWriteFittingsV1,
			.esiIndustryReadCorporationMiningV1,
			.esiCharactersReadMedalsV1,
			.esiCharactersReadFatigueV1,
			.esiMailReadMailV1,
			.esiLocationReadOnlineV1,
			.esiCalendarRespondCalendarEventsV1,
			.esiAssetsReadAssetsV1,
			.esiCorporationsReadTitlesV1,
			.esiCharactersReadBlueprintsV1,
			.esiWalletReadCharacterWalletV1,
			.esiMarketsReadCharacterOrdersV1,
			.esiCharactersReadOpportunitiesV1,
			.esiClonesReadImplantsV1,
			.esiCharactersReadAgentsResearchV1,
			.esiCalendarReadCalendarEventsV1,
			.esiFittingsReadFittingsV1,
			.esiAssetsReadCorporationAssetsV1,
			.esiSkillsReadSkillsV1,
			.esiCharactersWriteContactsV1,
			.esiIndustryReadCharacterMiningV1,
			.esiLocationReadLocationV1,
			.esiCharactersReadFwStatsV1,
			.esiCorporationsReadContactsV1,
			.esiContractsReadCorporationContractsV1,
			.esiUiOpenWindowV1,
			.esiFleetsReadFleetV1,
			.esiCharactersReadChatChannelsV1,
			.esiBookmarksReadCharacterBookmarksV1,
			.esiCorporationsReadStructuresV1,
			.esiIndustryReadCorporationJobsV1
			]
		}
	}
}

