import Foundation
import Alamofire

public extension ESI {
	
	public enum Datasource: String, JSONCoding {
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
		
	}
	
	
	public enum Language: String, JSONCoding {
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
	
	
}