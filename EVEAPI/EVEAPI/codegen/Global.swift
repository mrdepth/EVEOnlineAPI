import Foundation
import Alamofire
import Futures

public extension ESI {
	
	enum AcceptLanguage: String, Codable, HTTPQueryable {
		case de = "de"
		case enUS = "en-us"
		case fr = "fr"
		case ja = "ja"
		case ru = "ru"
		case zh = "zh"
		
		public var httpQuery: String? {
			return rawValue
		}
		
	}
	
	
	enum Datasource: String, Codable, HTTPQueryable {
		case singularity = "singularity"
		case tranquility = "tranquility"
		
		public var httpQuery: String? {
			return rawValue
		}
		
	}
	
	
	struct GatewayTimeout: Codable, Hashable {
		
		
		public var error: String
		public var timeout: Int?
		
		public init(error: String, timeout: Int?) {
			self.error = error
			self.timeout = timeout
		}
		
		enum CodingKeys: String, CodingKey, DateFormatted {
			case error
			case timeout
			
			var dateFormatter: DateFormatter? {
				switch self {
					
					default: return nil
				}
			}
		}
	}
	
	
	struct BadRequest: Codable, Hashable {
		
		
		public var error: String
		
		public init(error: String) {
			self.error = error
		}
		
		enum CodingKeys: String, CodingKey, DateFormatted {
			case error
			
			var dateFormatter: DateFormatter? {
				switch self {
					
					default: return nil
				}
			}
		}
	}
	
	
	struct ErrorLimited: Codable, Hashable {
		
		
		public var error: String
		
		public init(error: String) {
			self.error = error
		}
		
		enum CodingKeys: String, CodingKey, DateFormatted {
			case error
			
			var dateFormatter: DateFormatter? {
				switch self {
					
					default: return nil
				}
			}
		}
	}
	
	
	struct ServiceUnavailable: Codable, Hashable {
		
		
		public var error: String
		
		public init(error: String) {
			self.error = error
		}
		
		enum CodingKeys: String, CodingKey, DateFormatted {
			case error
			
			var dateFormatter: DateFormatter? {
				switch self {
					
					default: return nil
				}
			}
		}
	}
	
	
	enum Language: String, Codable, HTTPQueryable {
		case de = "de"
		case enUS = "en-us"
		case fr = "fr"
		case ja = "ja"
		case ru = "ru"
		case zh = "zh"
		
		public var httpQuery: String? {
			return rawValue
		}
		
	}
	
	
	struct Unauthorized: Codable, Hashable {
		
		
		public var error: String
		
		public init(error: String) {
			self.error = error
		}
		
		enum CodingKeys: String, CodingKey, DateFormatted {
			case error
			
			var dateFormatter: DateFormatter? {
				switch self {
					
					default: return nil
				}
			}
		}
	}
	
	
	struct Forbidden: Codable, Hashable {
		
		
		public var error: String
		public var ssoStatus: Int?
		
		public init(error: String, ssoStatus: Int?) {
			self.error = error
			self.ssoStatus = ssoStatus
		}
		
		enum CodingKeys: String, CodingKey, DateFormatted {
			case error
			case ssoStatus = "sso_status"
			
			var dateFormatter: DateFormatter? {
				switch self {
					
					default: return nil
				}
			}
		}
	}
	
	
	struct InternalServerError: Codable, Hashable {
		
		
		public var error: String
		
		public init(error: String) {
			self.error = error
		}
		
		enum CodingKeys: String, CodingKey, DateFormatted {
			case error
			
			var dateFormatter: DateFormatter? {
				switch self {
					
					default: return nil
				}
			}
		}
	}
	
	
	
}

public extension ESI.Scope {
	
	static let esiAlliancesReadContactsV1 = ESI.Scope("esi-alliances.read_contacts.v1")
	static let esiAssetsReadAssetsV1 = ESI.Scope("esi-assets.read_assets.v1")
	static let esiAssetsReadCorporationAssetsV1 = ESI.Scope("esi-assets.read_corporation_assets.v1")
	static let esiBookmarksReadCharacterBookmarksV1 = ESI.Scope("esi-bookmarks.read_character_bookmarks.v1")
	static let esiBookmarksReadCorporationBookmarksV1 = ESI.Scope("esi-bookmarks.read_corporation_bookmarks.v1")
	static let esiCalendarReadCalendarEventsV1 = ESI.Scope("esi-calendar.read_calendar_events.v1")
	static let esiCalendarRespondCalendarEventsV1 = ESI.Scope("esi-calendar.respond_calendar_events.v1")
	static let esiCharactersReadAgentsResearchV1 = ESI.Scope("esi-characters.read_agents_research.v1")
	static let esiCharactersReadBlueprintsV1 = ESI.Scope("esi-characters.read_blueprints.v1")
	static let esiCharactersReadContactsV1 = ESI.Scope("esi-characters.read_contacts.v1")
	static let esiCharactersReadCorporationRolesV1 = ESI.Scope("esi-characters.read_corporation_roles.v1")
	static let esiCharactersReadFatigueV1 = ESI.Scope("esi-characters.read_fatigue.v1")
	static let esiCharactersReadFwStatsV1 = ESI.Scope("esi-characters.read_fw_stats.v1")
	static let esiCharactersReadLoyaltyV1 = ESI.Scope("esi-characters.read_loyalty.v1")
	static let esiCharactersReadMedalsV1 = ESI.Scope("esi-characters.read_medals.v1")
	static let esiCharactersReadNotificationsV1 = ESI.Scope("esi-characters.read_notifications.v1")
	static let esiCharactersReadOpportunitiesV1 = ESI.Scope("esi-characters.read_opportunities.v1")
	static let esiCharactersReadStandingsV1 = ESI.Scope("esi-characters.read_standings.v1")
	static let esiCharactersReadTitlesV1 = ESI.Scope("esi-characters.read_titles.v1")
	static let esiCharactersWriteContactsV1 = ESI.Scope("esi-characters.write_contacts.v1")
	static let esiCharacterstatsReadV1 = ESI.Scope("esi-characterstats.read.v1")
	static let esiClonesReadClonesV1 = ESI.Scope("esi-clones.read_clones.v1")
	static let esiClonesReadImplantsV1 = ESI.Scope("esi-clones.read_implants.v1")
	static let esiContractsReadCharacterContractsV1 = ESI.Scope("esi-contracts.read_character_contracts.v1")
	static let esiContractsReadCorporationContractsV1 = ESI.Scope("esi-contracts.read_corporation_contracts.v1")
	static let esiCorporationsReadBlueprintsV1 = ESI.Scope("esi-corporations.read_blueprints.v1")
	static let esiCorporationsReadContactsV1 = ESI.Scope("esi-corporations.read_contacts.v1")
	static let esiCorporationsReadContainerLogsV1 = ESI.Scope("esi-corporations.read_container_logs.v1")
	static let esiCorporationsReadCorporationMembershipV1 = ESI.Scope("esi-corporations.read_corporation_membership.v1")
	static let esiCorporationsReadDivisionsV1 = ESI.Scope("esi-corporations.read_divisions.v1")
	static let esiCorporationsReadFacilitiesV1 = ESI.Scope("esi-corporations.read_facilities.v1")
	static let esiCorporationsReadFwStatsV1 = ESI.Scope("esi-corporations.read_fw_stats.v1")
	static let esiCorporationsReadMedalsV1 = ESI.Scope("esi-corporations.read_medals.v1")
	static let esiCorporationsReadStandingsV1 = ESI.Scope("esi-corporations.read_standings.v1")
	static let esiCorporationsReadStarbasesV1 = ESI.Scope("esi-corporations.read_starbases.v1")
	static let esiCorporationsReadStructuresV1 = ESI.Scope("esi-corporations.read_structures.v1")
	static let esiCorporationsReadTitlesV1 = ESI.Scope("esi-corporations.read_titles.v1")
	static let esiCorporationsTrackMembersV1 = ESI.Scope("esi-corporations.track_members.v1")
	static let esiFittingsReadFittingsV1 = ESI.Scope("esi-fittings.read_fittings.v1")
	static let esiFittingsWriteFittingsV1 = ESI.Scope("esi-fittings.write_fittings.v1")
	static let esiFleetsReadFleetV1 = ESI.Scope("esi-fleets.read_fleet.v1")
	static let esiFleetsWriteFleetV1 = ESI.Scope("esi-fleets.write_fleet.v1")
	static let esiIndustryReadCharacterJobsV1 = ESI.Scope("esi-industry.read_character_jobs.v1")
	static let esiIndustryReadCharacterMiningV1 = ESI.Scope("esi-industry.read_character_mining.v1")
	static let esiIndustryReadCorporationJobsV1 = ESI.Scope("esi-industry.read_corporation_jobs.v1")
	static let esiIndustryReadCorporationMiningV1 = ESI.Scope("esi-industry.read_corporation_mining.v1")
	static let esiKillmailsReadCorporationKillmailsV1 = ESI.Scope("esi-killmails.read_corporation_killmails.v1")
	static let esiKillmailsReadKillmailsV1 = ESI.Scope("esi-killmails.read_killmails.v1")
	static let esiLocationReadLocationV1 = ESI.Scope("esi-location.read_location.v1")
	static let esiLocationReadOnlineV1 = ESI.Scope("esi-location.read_online.v1")
	static let esiLocationReadShipTypeV1 = ESI.Scope("esi-location.read_ship_type.v1")
	static let esiMailOrganizeMailV1 = ESI.Scope("esi-mail.organize_mail.v1")
	static let esiMailReadMailV1 = ESI.Scope("esi-mail.read_mail.v1")
	static let esiMailSendMailV1 = ESI.Scope("esi-mail.send_mail.v1")
	static let esiMarketsReadCharacterOrdersV1 = ESI.Scope("esi-markets.read_character_orders.v1")
	static let esiMarketsReadCorporationOrdersV1 = ESI.Scope("esi-markets.read_corporation_orders.v1")
	static let esiMarketsStructureMarketsV1 = ESI.Scope("esi-markets.structure_markets.v1")
	static let esiPlanetsManagePlanetsV1 = ESI.Scope("esi-planets.manage_planets.v1")
	static let esiPlanetsReadCustomsOfficesV1 = ESI.Scope("esi-planets.read_customs_offices.v1")
	static let esiSearchSearchStructuresV1 = ESI.Scope("esi-search.search_structures.v1")
	static let esiSkillsReadSkillqueueV1 = ESI.Scope("esi-skills.read_skillqueue.v1")
	static let esiSkillsReadSkillsV1 = ESI.Scope("esi-skills.read_skills.v1")
	static let esiUiOpenWindowV1 = ESI.Scope("esi-ui.open_window.v1")
	static let esiUiWriteWaypointV1 = ESI.Scope("esi-ui.write_waypoint.v1")
	static let esiUniverseReadStructuresV1 = ESI.Scope("esi-universe.read_structures.v1")
	static let esiWalletReadCharacterWalletV1 = ESI.Scope("esi-wallet.read_character_wallet.v1")
	static let esiWalletReadCorporationWalletsV1 = ESI.Scope("esi-wallet.read_corporation_wallets.v1")
	
	static var all: [ESI.Scope]  {
		get {
			return [
			.esiAlliancesReadContactsV1,
			.esiAssetsReadAssetsV1,
			.esiAssetsReadCorporationAssetsV1,
			.esiBookmarksReadCharacterBookmarksV1,
			.esiBookmarksReadCorporationBookmarksV1,
			.esiCalendarReadCalendarEventsV1,
			.esiCalendarRespondCalendarEventsV1,
			.esiCharactersReadAgentsResearchV1,
			.esiCharactersReadBlueprintsV1,
			.esiCharactersReadContactsV1,
			.esiCharactersReadCorporationRolesV1,
			.esiCharactersReadFatigueV1,
			.esiCharactersReadFwStatsV1,
			.esiCharactersReadLoyaltyV1,
			.esiCharactersReadMedalsV1,
			.esiCharactersReadNotificationsV1,
			.esiCharactersReadOpportunitiesV1,
			.esiCharactersReadStandingsV1,
			.esiCharactersReadTitlesV1,
			.esiCharactersWriteContactsV1,
			.esiCharacterstatsReadV1,
			.esiClonesReadClonesV1,
			.esiClonesReadImplantsV1,
			.esiContractsReadCharacterContractsV1,
			.esiContractsReadCorporationContractsV1,
			.esiCorporationsReadBlueprintsV1,
			.esiCorporationsReadContactsV1,
			.esiCorporationsReadContainerLogsV1,
			.esiCorporationsReadCorporationMembershipV1,
			.esiCorporationsReadDivisionsV1,
			.esiCorporationsReadFacilitiesV1,
			.esiCorporationsReadFwStatsV1,
			.esiCorporationsReadMedalsV1,
			.esiCorporationsReadStandingsV1,
			.esiCorporationsReadStarbasesV1,
			.esiCorporationsReadStructuresV1,
			.esiCorporationsReadTitlesV1,
			.esiCorporationsTrackMembersV1,
			.esiFittingsReadFittingsV1,
			.esiFittingsWriteFittingsV1,
			.esiFleetsReadFleetV1,
			.esiFleetsWriteFleetV1,
			.esiIndustryReadCharacterJobsV1,
			.esiIndustryReadCharacterMiningV1,
			.esiIndustryReadCorporationJobsV1,
			.esiIndustryReadCorporationMiningV1,
			.esiKillmailsReadCorporationKillmailsV1,
			.esiKillmailsReadKillmailsV1,
			.esiLocationReadLocationV1,
			.esiLocationReadOnlineV1,
			.esiLocationReadShipTypeV1,
			.esiMailOrganizeMailV1,
			.esiMailReadMailV1,
			.esiMailSendMailV1,
			.esiMarketsReadCharacterOrdersV1,
			.esiMarketsReadCorporationOrdersV1,
			.esiMarketsStructureMarketsV1,
			.esiPlanetsManagePlanetsV1,
			.esiPlanetsReadCustomsOfficesV1,
			.esiSearchSearchStructuresV1,
			.esiSkillsReadSkillqueueV1,
			.esiSkillsReadSkillsV1,
			.esiUiOpenWindowV1,
			.esiUiWriteWaypointV1,
			.esiUniverseReadStructuresV1,
			.esiWalletReadCharacterWalletV1,
			.esiWalletReadCorporationWalletsV1
			]
		}
	}
}

