import Foundation
import Alamofire


public extension EVE {
	public var char: Char {
		return Char(sessionManager: self)
	}
	
	class Char {
		weak var sessionManager: EVE?
		
		init(sessionManager: EVE) {
			self.sessionManager = sessionManager
		}
		
		public func accountBalance(completionBlock:((Result<EVE.Char.AccountBalance>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/AccountBalance.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.AccountBalance>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func assetList(flat: Bool? = nil, completionBlock:((Result<EVE.Char.AssetList>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			if let v = flat {
				parameters["flat"] = v
			}
			
			let url = session!.baseURL + "Char/AssetList.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.AssetList>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func blueprints(completionBlock:((Result<EVE.Char.Blueprints>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/Blueprints.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Blueprints>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func bookmarks(completionBlock:((Result<EVE.Char.Bookmarks>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/Bookmarks.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Bookmarks>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func calendarEventAttendees(eventIDs: [Int64], completionBlock:((Result<EVE.Char.CalendarEventAttendees>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			parameters["eventIDs"] = eventIDs
			
			let url = session!.baseURL + "Char/CalendarEventAttendees.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.CalendarEventAttendees>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func characterSheet(completionBlock:((Result<EVE.Char.CharacterSheet>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/CharacterSheet.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.CharacterSheet>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func chatChannels(completionBlock:((Result<EVE.Char.ChatChannels>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/ChatChannels.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.ChatChannels>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func clones(completionBlock:((Result<EVE.Char.Clones>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/Clones.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Clones>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func contactList(completionBlock:((Result<EVE.Char.ContactList>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/ContactList.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.ContactList>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func contactNotifications(completionBlock:((Result<EVE.Char.ContactNotifications>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/ContactNotifications.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.ContactNotifications>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func contractBids(completionBlock:((Result<EVE.Char.ContractBids>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/ContractBids.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.ContractBids>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func contractItems(contractID: Int64, completionBlock:((Result<EVE.Char.ContractItems>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			parameters["contractID"] = contractID
			
			let url = session!.baseURL + "Char/ContractItems.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.ContractItems>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func contracts(completionBlock:((Result<EVE.Char.Contracts>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/Contracts.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Contracts>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func facWarStats(completionBlock:((Result<EVE.Char.FacWarStats>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/FacWarStats.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.FacWarStats>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func industryJobs(completionBlock:((Result<EVE.Char.IndustryJobs>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/IndustryJobs.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.IndustryJobs>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func killMails(fromID: Int64? = nil, rowCount: Int, completionBlock:((Result<EVE.Char.KillMails>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			if let v = fromID {
				parameters["fromID"] = v
			}
			parameters["rowCount"] = rowCount
			
			let url = session!.baseURL + "Char/KillMails.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.KillMails>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func locations(ids: [Int64], completionBlock:((Result<EVE.Char.Locations>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			parameters["ids"] = ids
			
			let url = session!.baseURL + "Char/Locations.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Locations>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func mailBodies(ids: [Int64], completionBlock:((Result<EVE.Char.MailBodies>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			parameters["ids"] = ids
			
			let url = session!.baseURL + "Char/MailBodies.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.MailBodies>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func mailMessages(completionBlock:((Result<EVE.Char.Messages>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/MailMessages.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Messages>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func mailingLists(completionBlock:((Result<EVE.Char.MailingLists>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/MailingLists.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.MailingLists>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func marketOrders(completionBlock:((Result<EVE.Char.MarketOrders>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/MarketOrders.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.MarketOrders>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func medals(completionBlock:((Result<EVE.Char.Medals>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/Medals.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Medals>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func notificationTexts(ids: [Int64], completionBlock:((Result<EVE.Char.NotificationTexts>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			parameters["ids"] = ids
			
			let url = session!.baseURL + "Char/NotificationTexts.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.NotificationTexts>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func notifications(completionBlock:((Result<EVE.Char.Notifications>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/Notifications.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Notifications>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func planetaryColonies(completionBlock:((Result<EVE.Char.PlanetaryColonies>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/PlanetaryColonies.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.PlanetaryColonies>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func planetaryLinks(planetID: Int, completionBlock:((Result<EVE.Char.PlanetaryLinks>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			parameters["planetID"] = planetID
			
			let url = session!.baseURL + "Char/PlanetaryLinks.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.PlanetaryLinks>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func planetaryPins(planetID: Int, completionBlock:((Result<EVE.Char.PlanetaryPins>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			parameters["planetID"] = planetID
			
			let url = session!.baseURL + "Char/PlanetaryPins.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.PlanetaryPins>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func planetaryRoutes(planetID: Int, completionBlock:((Result<EVE.Char.PlanetaryRoutes>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			parameters["planetID"] = planetID
			
			let url = session!.baseURL + "Char/PlanetaryRoutes.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.PlanetaryRoutes>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func research(completionBlock:((Result<EVE.Char.Research>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/Research.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Research>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func skillQueue(completionBlock:((Result<EVE.Char.SkillQueue>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/SkillQueue.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.SkillQueue>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func skills(completionBlock:((Result<EVE.Char.Skills>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/Skills.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Skills>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func standings(completionBlock:((Result<EVE.Char.Standings>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/Standings.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.Standings>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func upcomingCalendarEvents(completionBlock:((Result<EVE.Char.UpcomingCalendarEvents>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			let parameters = Parameters()
			
			let url = session!.baseURL + "Char/UpcomingCalendarEvents.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.UpcomingCalendarEvents>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func walletJournal(fromID: Int64? = nil, rowCount: Int? = nil, completionBlock:((Result<EVE.Char.WalletJournal>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			if let v = fromID {
				parameters["fromID"] = v
			}
			if let v = rowCount {
				parameters["rowCount"] = v
			}
			
			let url = session!.baseURL + "Char/WalletJournal.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.WalletJournal>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		public func walletTransactions(fromID: Int64? = nil, rowCount: Int? = nil, completionBlock:((Result<EVE.Char.WalletTransactions>) -> Void)?) {
			var session = sessionManager
			guard session != nil else {return}
			
			
			
			var parameters = Parameters()
			if let v = fromID {
				parameters["fromID"] = v
			}
			if let v = rowCount {
				parameters["rowCount"] = v
			}
			
			let url = session!.baseURL + "Char/WalletTransactions.xml.aspx"
			
			let progress = Progress(totalUnitCount: 100)
			
			session!.request(url, method: .get, parameters:parameters).downloadProgress { p in
				progress.completedUnitCount = Int64(p.fractionCompleted * 100)
			}.validateEVE().responseEVE { (response: DataResponse<EVE.Char.WalletTransactions>) in
				completionBlock?(response.result)
				session = nil
			}
		}
		
		
		public class AccountBalance: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Account: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var accountID: Int = Int()
				public var accountKey: Int = Int()
				public var balance: Double = Double()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let accountID = dictionary["accountID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accountID = accountID
					guard let accountKey = dictionary["accountKey"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accountKey = accountKey
					guard let balance = dictionary["balance"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.balance = balance
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["accountID"] = accountID.json
					json["accountKey"] = accountKey.json
					json["balance"] = balance.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.accountID.hashValue)
					hashCombine(seed: &hash, value: self.accountKey.hashValue)
					hashCombine(seed: &hash, value: self.balance.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.AccountBalance.Account, rhs: EVE.Char.AccountBalance.Account) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.AccountBalance.Account) {
					accountID = other.accountID
					accountKey = other.accountKey
					balance = other.balance
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.AccountBalance.Account(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.AccountBalance.Account)?.hashValue == hashValue
				}
				
			}
			
			public var accounts: [EVE.Char.AccountBalance.Account] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let accounts = try dictionary.rowset(name: "accounts")?.map ({try EVE.Char.AccountBalance.Account(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.accounts = accounts
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["accounts"] = accounts.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.accounts.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.AccountBalance, rhs: EVE.Char.AccountBalance) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.AccountBalance) {
				accounts = other.accounts.flatMap { EVE.Char.AccountBalance.Account($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.AccountBalance(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.AccountBalance)?.hashValue == hashValue
			}
			
		}
		
		
		public class AssetList: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Asset: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var contents: [EVE.Char.AssetList.Asset]? = nil
				public var flag: Int = Int()
				public var itemID: Int64 = Int64()
				public var locationID: Int64? = nil
				public var quantity: Int64 = Int64()
				public var rawQuantity: Int? = nil
				public var singleton: Bool = Bool()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					contents = try dictionary.rowset(name: "contents")?.map {try EVE.Char.AssetList.Asset(json: $0)}
					guard let flag = dictionary["flag"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.flag = flag
					guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.itemID = itemID
					locationID = dictionary["locationID"] as? Int64
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantity = quantity
					rawQuantity = dictionary["rawQuantity"] as? Int
					guard let singleton = dictionary["singleton"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.singleton = singleton
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					if let v = contents?.json {
						json["contents"] = v
					}
					json["flag"] = flag.json
					json["itemID"] = itemID.json
					if let v = locationID?.json {
						json["locationID"] = v
					}
					json["quantity"] = quantity.json
					if let v = rawQuantity?.json {
						json["rawQuantity"] = v
					}
					json["singleton"] = singleton.json
					json["typeID"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.contents?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.flag.hashValue)
					hashCombine(seed: &hash, value: self.itemID.hashValue)
					hashCombine(seed: &hash, value: self.locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.rawQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.singleton.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.AssetList.Asset, rhs: EVE.Char.AssetList.Asset) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.AssetList.Asset) {
					contents = other.contents?.flatMap { EVE.Char.AssetList.Asset($0) }
					flag = other.flag
					itemID = other.itemID
					locationID = other.locationID
					quantity = other.quantity
					rawQuantity = other.rawQuantity
					singleton = other.singleton
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.AssetList.Asset(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.AssetList.Asset)?.hashValue == hashValue
				}
				
			}
			
			public var assets: [EVE.Char.AssetList.Asset] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let assets = try dictionary.rowset(name: "assets")?.map ({try EVE.Char.AssetList.Asset(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.assets = assets
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["assets"] = assets.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.assets.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.AssetList, rhs: EVE.Char.AssetList) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.AssetList) {
				assets = other.assets.flatMap { EVE.Char.AssetList.Asset($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.AssetList(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.AssetList)?.hashValue == hashValue
			}
			
		}
		
		
		public class Blueprints: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Blueprint: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var flag: Int = Int()
				public var itemID: Int64 = Int64()
				public var locationID: Int64 = Int64()
				public var materialEfficiency: Int = Int()
				public var quantity: Int64 = Int64()
				public var runs: Int = Int()
				public var timeEfficiency: Int = Int()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let flag = dictionary["flag"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.flag = flag
					guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.itemID = itemID
					guard let locationID = dictionary["locationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.locationID = locationID
					guard let materialEfficiency = dictionary["materialEfficiency"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.materialEfficiency = materialEfficiency
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantity = quantity
					guard let runs = dictionary["runs"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.runs = runs
					guard let timeEfficiency = dictionary["timeEfficiency"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.timeEfficiency = timeEfficiency
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["flag"] = flag.json
					json["itemID"] = itemID.json
					json["locationID"] = locationID.json
					json["materialEfficiency"] = materialEfficiency.json
					json["quantity"] = quantity.json
					json["runs"] = runs.json
					json["timeEfficiency"] = timeEfficiency.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.flag.hashValue)
					hashCombine(seed: &hash, value: self.itemID.hashValue)
					hashCombine(seed: &hash, value: self.locationID.hashValue)
					hashCombine(seed: &hash, value: self.materialEfficiency.hashValue)
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.runs.hashValue)
					hashCombine(seed: &hash, value: self.timeEfficiency.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.typeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Blueprints.Blueprint, rhs: EVE.Char.Blueprints.Blueprint) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Blueprints.Blueprint) {
					flag = other.flag
					itemID = other.itemID
					locationID = other.locationID
					materialEfficiency = other.materialEfficiency
					quantity = other.quantity
					runs = other.runs
					timeEfficiency = other.timeEfficiency
					typeID = other.typeID
					typeName = other.typeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Blueprints.Blueprint(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Blueprints.Blueprint)?.hashValue == hashValue
				}
				
			}
			
			public var blueprints: [EVE.Char.Blueprints.Blueprint] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let blueprints = try dictionary.rowset(name: "blueprints")?.map ({try EVE.Char.Blueprints.Blueprint(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.blueprints = blueprints
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["blueprints"] = blueprints.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.blueprints.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Blueprints, rhs: EVE.Char.Blueprints) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Blueprints) {
				blueprints = other.blueprints.flatMap { EVE.Char.Blueprints.Blueprint($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Blueprints(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Blueprints)?.hashValue == hashValue
			}
			
		}
		
		
		public class Bookmarks: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Folder: NSObject, Codable, NSCopying, JSONCoding {
				
				public class Bookmark: NSObject, Codable, NSCopying, JSONCoding {
					
					
					public var bookmarkID: Int = Int()
					public var created: Date = Date()
					public var creatorID: Int64 = Int64()
					public var itemID: Int64 = Int64()
					public var locationID: Int64 = Int64()
					public var memo: String = String()
					public var note: String = String()
					public var typeID: Int = Int()
					public var x: Double = Double()
					public var y: Double = Double()
					public var z: Double = Double()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						guard let bookmarkID = dictionary["bookmarkID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.bookmarkID = bookmarkID
						guard let created = DateFormatter.eveDateFormatter.date(from: dictionary["created"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
						self.created = created
						guard let creatorID = dictionary["creatorID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.creatorID = creatorID
						guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.itemID = itemID
						guard let locationID = dictionary["locationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.locationID = locationID
						guard let memo = dictionary["memo"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.memo = memo
						guard let note = dictionary["note"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.note = note
						guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.typeID = typeID
						guard let x = dictionary["x"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.x = x
						guard let y = dictionary["y"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.y = y
						guard let z = dictionary["z"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.z = z
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					/*
					public required init?(coder aDecoder: NSCoder) {
						{decodings}
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						{encodings}
					}
					*/
					public var json: Any {
						var json = [String: Any]()
						json["bookmarkID"] = bookmarkID.json
						json["created"] = created.json
						json["creatorID"] = creatorID.json
						json["itemID"] = itemID.json
						json["locationID"] = locationID.json
						json["memo"] = memo.json
						json["note"] = note.json
						json["typeID"] = typeID.json
						json["x"] = x.json
						json["y"] = y.json
						json["z"] = z.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.bookmarkID.hashValue)
						hashCombine(seed: &hash, value: self.created.hashValue)
						hashCombine(seed: &hash, value: self.creatorID.hashValue)
						hashCombine(seed: &hash, value: self.itemID.hashValue)
						hashCombine(seed: &hash, value: self.locationID.hashValue)
						hashCombine(seed: &hash, value: self.memo.hashValue)
						hashCombine(seed: &hash, value: self.note.hashValue)
						hashCombine(seed: &hash, value: self.typeID.hashValue)
						hashCombine(seed: &hash, value: self.x.hashValue)
						hashCombine(seed: &hash, value: self.y.hashValue)
						hashCombine(seed: &hash, value: self.z.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: EVE.Char.Bookmarks.Folder.Bookmark, rhs: EVE.Char.Bookmarks.Folder.Bookmark) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: EVE.Char.Bookmarks.Folder.Bookmark) {
						bookmarkID = other.bookmarkID
						created = other.created
						creatorID = other.creatorID
						itemID = other.itemID
						locationID = other.locationID
						memo = other.memo
						note = other.note
						typeID = other.typeID
						x = other.x
						y = other.y
						z = other.z
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return EVE.Char.Bookmarks.Folder.Bookmark(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? EVE.Char.Bookmarks.Folder.Bookmark)?.hashValue == hashValue
					}
					
				}
				
				public var bookmarks: [EVE.Char.Bookmarks.Folder.Bookmark] = []
				public var folderID: Int = Int()
				public var folderName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let bookmarks = try dictionary.rowset(name: "bookmarks")?.map ({try EVE.Char.Bookmarks.Folder.Bookmark(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.bookmarks = bookmarks
					guard let folderID = dictionary["folderID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.folderID = folderID
					guard let folderName = dictionary["folderName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.folderName = folderName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["bookmarks"] = bookmarks.json
					json["folderID"] = folderID.json
					json["folderName"] = folderName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.bookmarks.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.folderID.hashValue)
					hashCombine(seed: &hash, value: self.folderName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Bookmarks.Folder, rhs: EVE.Char.Bookmarks.Folder) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Bookmarks.Folder) {
					bookmarks = other.bookmarks.flatMap { EVE.Char.Bookmarks.Folder.Bookmark($0) }
					folderID = other.folderID
					folderName = other.folderName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Bookmarks.Folder(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Bookmarks.Folder)?.hashValue == hashValue
				}
				
			}
			
			public var folders: [EVE.Char.Bookmarks.Folder] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let folders = try dictionary.rowset(name: "folders")?.map ({try EVE.Char.Bookmarks.Folder(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.folders = folders
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["folders"] = folders.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.folders.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Bookmarks, rhs: EVE.Char.Bookmarks) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Bookmarks) {
				folders = other.folders.flatMap { EVE.Char.Bookmarks.Folder($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Bookmarks(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Bookmarks)?.hashValue == hashValue
			}
			
		}
		
		
		public class CalendarEventAttendees: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Attendee: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum Response: String, JSONCoding, Codable {
					case accepted = "Accepted"
					case declined = "Declined"
					case tentative = "Tentative"
					case undecided = "Undecided"
					
					public init() {
						self = .accepted
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = Response(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var characterID: Int64 = Int64()
				public var characterName: String = String()
				public var response: EVE.Char.CalendarEventAttendees.Attendee.Response = EVE.Char.CalendarEventAttendees.Attendee.Response()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.characterID = characterID
					guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.characterName = characterName
					guard let response = EVE.Char.CalendarEventAttendees.Attendee.Response(rawValue: dictionary["response"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.response = response
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["characterID"] = characterID.json
					json["characterName"] = characterName.json
					json["response"] = response.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.characterID.hashValue)
					hashCombine(seed: &hash, value: self.characterName.hashValue)
					hashCombine(seed: &hash, value: self.response.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.CalendarEventAttendees.Attendee, rhs: EVE.Char.CalendarEventAttendees.Attendee) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.CalendarEventAttendees.Attendee) {
					characterID = other.characterID
					characterName = other.characterName
					response = other.response
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.CalendarEventAttendees.Attendee(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.CalendarEventAttendees.Attendee)?.hashValue == hashValue
				}
				
			}
			
			public var eventAttendees: [EVE.Char.CalendarEventAttendees.Attendee] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let eventAttendees = try dictionary.rowset(name: "eventAttendees")?.map ({try EVE.Char.CalendarEventAttendees.Attendee(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.eventAttendees = eventAttendees
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["eventAttendees"] = eventAttendees.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.eventAttendees.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.CalendarEventAttendees, rhs: EVE.Char.CalendarEventAttendees) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.CalendarEventAttendees) {
				eventAttendees = other.eventAttendees.flatMap { EVE.Char.CalendarEventAttendees.Attendee($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.CalendarEventAttendees(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.CalendarEventAttendees)?.hashValue == hashValue
			}
			
		}
		
		
		public class CharacterSheet: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Attributes: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var charisma: Int = Int()
				public var intelligence: Int = Int()
				public var memory: Int = Int()
				public var perception: Int = Int()
				public var willpower: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let charisma = dictionary["charisma"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.charisma = charisma
					guard let intelligence = dictionary["intelligence"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.intelligence = intelligence
					guard let memory = dictionary["memory"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.memory = memory
					guard let perception = dictionary["perception"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.perception = perception
					guard let willpower = dictionary["willpower"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.willpower = willpower
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["charisma"] = charisma.json
					json["intelligence"] = intelligence.json
					json["memory"] = memory.json
					json["perception"] = perception.json
					json["willpower"] = willpower.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.charisma.hashValue)
					hashCombine(seed: &hash, value: self.intelligence.hashValue)
					hashCombine(seed: &hash, value: self.memory.hashValue)
					hashCombine(seed: &hash, value: self.perception.hashValue)
					hashCombine(seed: &hash, value: self.willpower.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.CharacterSheet.Attributes, rhs: EVE.Char.CharacterSheet.Attributes) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.CharacterSheet.Attributes) {
					charisma = other.charisma
					intelligence = other.intelligence
					memory = other.memory
					perception = other.perception
					willpower = other.willpower
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.CharacterSheet.Attributes(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.CharacterSheet.Attributes)?.hashValue == hashValue
				}
				
			}
			
			public class Certificate: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var certificateID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let certificateID = dictionary["certificateID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.certificateID = certificateID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["certificateID"] = certificateID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.certificateID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.CharacterSheet.Certificate, rhs: EVE.Char.CharacterSheet.Certificate) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.CharacterSheet.Certificate) {
					certificateID = other.certificateID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.CharacterSheet.Certificate(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.CharacterSheet.Certificate)?.hashValue == hashValue
				}
				
			}
			
			public enum Gender: String, JSONCoding, Codable {
				case female = "Female"
				case male = "Male"
				
				public init() {
					self = .female
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Gender(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
			}
			
			public class Implant: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.typeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.CharacterSheet.Implant, rhs: EVE.Char.CharacterSheet.Implant) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.CharacterSheet.Implant) {
					typeID = other.typeID
					typeName = other.typeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.CharacterSheet.Implant(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.CharacterSheet.Implant)?.hashValue == hashValue
				}
				
			}
			
			public class JumpClone: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var cloneName: String = String()
				public var jumpCloneID: Int64 = Int64()
				public var locationID: Int64 = Int64()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let cloneName = dictionary["cloneName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.cloneName = cloneName
					guard let jumpCloneID = dictionary["jumpCloneID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.jumpCloneID = jumpCloneID
					guard let locationID = dictionary["locationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.locationID = locationID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["cloneName"] = cloneName.json
					json["jumpCloneID"] = jumpCloneID.json
					json["locationID"] = locationID.json
					json["typeID"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.cloneName.hashValue)
					hashCombine(seed: &hash, value: self.jumpCloneID.hashValue)
					hashCombine(seed: &hash, value: self.locationID.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.CharacterSheet.JumpClone, rhs: EVE.Char.CharacterSheet.JumpClone) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.CharacterSheet.JumpClone) {
					cloneName = other.cloneName
					jumpCloneID = other.jumpCloneID
					locationID = other.locationID
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.CharacterSheet.JumpClone(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.CharacterSheet.JumpClone)?.hashValue == hashValue
				}
				
			}
			
			public class JumpCloneImplant: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var jumpCloneID: Int64 = Int64()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let jumpCloneID = dictionary["jumpCloneID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.jumpCloneID = jumpCloneID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["jumpCloneID"] = jumpCloneID.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.jumpCloneID.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.typeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.CharacterSheet.JumpCloneImplant, rhs: EVE.Char.CharacterSheet.JumpCloneImplant) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.CharacterSheet.JumpCloneImplant) {
					jumpCloneID = other.jumpCloneID
					typeID = other.typeID
					typeName = other.typeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.CharacterSheet.JumpCloneImplant(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.CharacterSheet.JumpCloneImplant)?.hashValue == hashValue
				}
				
			}
			
			public class Role: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var roleID: Int = Int()
				public var roleName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let roleID = dictionary["roleID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.roleID = roleID
					guard let roleName = dictionary["roleName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.roleName = roleName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["roleID"] = roleID.json
					json["roleName"] = roleName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.roleID.hashValue)
					hashCombine(seed: &hash, value: self.roleName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.CharacterSheet.Role, rhs: EVE.Char.CharacterSheet.Role) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.CharacterSheet.Role) {
					roleID = other.roleID
					roleName = other.roleName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.CharacterSheet.Role(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.CharacterSheet.Role)?.hashValue == hashValue
				}
				
			}
			
			public class Skill: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var level: Int = Int()
				public var published: Bool = Bool()
				public var skillpoints: Int = Int()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let level = dictionary["level"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.level = level
					guard let published = dictionary["published"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.published = published
					guard let skillpoints = dictionary["skillpoints"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.skillpoints = skillpoints
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["level"] = level.json
					json["published"] = published.json
					json["skillpoints"] = skillpoints.json
					json["typeID"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.level.hashValue)
					hashCombine(seed: &hash, value: self.published.hashValue)
					hashCombine(seed: &hash, value: self.skillpoints.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.CharacterSheet.Skill, rhs: EVE.Char.CharacterSheet.Skill) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.CharacterSheet.Skill) {
					level = other.level
					published = other.published
					skillpoints = other.skillpoints
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.CharacterSheet.Skill(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.CharacterSheet.Skill)?.hashValue == hashValue
				}
				
			}
			
			public var allianceID: Int64 = Int64()
			public var allianceName: String? = nil
			public var ancestry: String = String()
			public var ancestryID: Int = Int()
			public var attributes: EVE.Char.CharacterSheet.Attributes = EVE.Char.CharacterSheet.Attributes()
			public var balance: Double = Double()
			public var bloodLine: String = String()
			public var bloodLineID: Int = Int()
			public var certificates: [EVE.Char.CharacterSheet.Certificate] = []
			public var characterID: Int64 = Int64()
			public var characterName: String = String()
			public var cloneJumpDate: Date? = nil
			public var cloneName: String = String()
			public var cloneSkillPoints: Int64 = Int64()
			public var cloneTypeID: Int = Int()
			public var corporationID: Int64 = Int64()
			public var corporationName: String = String()
			public var corporationRoles: [EVE.Char.CharacterSheet.Role] = []
			public var corporationRolesAtBase: [EVE.Char.CharacterSheet.Role] = []
			public var corporationRolesAtHQ: [EVE.Char.CharacterSheet.Role] = []
			public var corporationRolesAtOther: [EVE.Char.CharacterSheet.Role] = []
			public var corporationTitles: [EVE.Char.CharacterSheet.Role] = []
			public var dateOfBirth: Date = Date()
			public var factionID: Int? = nil
			public var factionName: String? = nil
			public var freeRespecs: Int = Int()
			public var freeSkillPoints: Int64 = Int64()
			public var gender: EVE.Char.CharacterSheet.Gender = EVE.Char.CharacterSheet.Gender()
			public var homeStationID: Int = Int()
			public var implants: [EVE.Char.CharacterSheet.Implant] = []
			public var jumpActivation: Date? = nil
			public var jumpCloneImplants: [EVE.Char.CharacterSheet.JumpCloneImplant] = []
			public var jumpClones: [EVE.Char.CharacterSheet.JumpClone] = []
			public var jumpFatigue: Date? = nil
			public var jumpLastUpdate: Date? = nil
			public var lastRespecDate: Date? = nil
			public var lastTimedRespec: Date? = nil
			public var race: String = String()
			public var remoteStationDate: Date? = nil
			public var skills: [EVE.Char.CharacterSheet.Skill] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let allianceID = dictionary["allianceID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.allianceID = allianceID
				allianceName = dictionary["allianceName"] as? String
				guard let ancestry = dictionary["ancestry"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ancestry = ancestry
				guard let ancestryID = dictionary["ancestryID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ancestryID = ancestryID
				attributes = try EVE.Char.CharacterSheet.Attributes(json: dictionary["attributes"] as? [String: Any] ?? [:])
				guard let balance = dictionary["balance"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.balance = balance
				guard let bloodLine = dictionary["bloodLine"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.bloodLine = bloodLine
				guard let bloodLineID = dictionary["bloodLineID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.bloodLineID = bloodLineID
				guard let certificates = try dictionary.rowset(name: "certificates")?.map ({try EVE.Char.CharacterSheet.Certificate(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.certificates = certificates
				guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterID = characterID
				guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.characterName = characterName
				cloneJumpDate = DateFormatter.eveDateFormatter.date(from: dictionary["cloneJumpDate"] as? String ?? "")
				guard let cloneName = dictionary["cloneName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.cloneName = cloneName
				guard let cloneSkillPoints = dictionary["cloneSkillPoints"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.cloneSkillPoints = cloneSkillPoints
				guard let cloneTypeID = dictionary["cloneTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.cloneTypeID = cloneTypeID
				guard let corporationID = dictionary["corporationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationID = corporationID
				guard let corporationName = dictionary["corporationName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationName = corporationName
				guard let corporationRoles = try dictionary.rowset(name: "corporationRoles")?.map ({try EVE.Char.CharacterSheet.Role(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationRoles = corporationRoles
				guard let corporationRolesAtBase = try dictionary.rowset(name: "corporationRolesAtBase")?.map ({try EVE.Char.CharacterSheet.Role(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationRolesAtBase = corporationRolesAtBase
				guard let corporationRolesAtHQ = try dictionary.rowset(name: "corporationRolesAtHQ")?.map ({try EVE.Char.CharacterSheet.Role(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationRolesAtHQ = corporationRolesAtHQ
				guard let corporationRolesAtOther = try dictionary.rowset(name: "corporationRolesAtOther")?.map ({try EVE.Char.CharacterSheet.Role(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationRolesAtOther = corporationRolesAtOther
				guard let corporationTitles = try dictionary.rowset(name: "corporationTitles")?.map ({try EVE.Char.CharacterSheet.Role(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporationTitles = corporationTitles
				guard let dateOfBirth = DateFormatter.eveDateFormatter.date(from: dictionary["DoB"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.dateOfBirth = dateOfBirth
				factionID = dictionary["factionID"] as? Int
				factionName = dictionary["factionName"] as? String
				guard let freeRespecs = dictionary["freeRespecs"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.freeRespecs = freeRespecs
				guard let freeSkillPoints = dictionary["freeSkillPoints"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.freeSkillPoints = freeSkillPoints
				guard let gender = EVE.Char.CharacterSheet.Gender(rawValue: dictionary["gender"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.gender = gender
				guard let homeStationID = dictionary["homeStationID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.homeStationID = homeStationID
				guard let implants = try dictionary.rowset(name: "implants")?.map ({try EVE.Char.CharacterSheet.Implant(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.implants = implants
				jumpActivation = DateFormatter.eveDateFormatter.date(from: dictionary["jumpActivation"] as? String ?? "")
				guard let jumpCloneImplants = try dictionary.rowset(name: "jumpCloneImplants")?.map ({try EVE.Char.CharacterSheet.JumpCloneImplant(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.jumpCloneImplants = jumpCloneImplants
				guard let jumpClones = try dictionary.rowset(name: "jumpClones")?.map ({try EVE.Char.CharacterSheet.JumpClone(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.jumpClones = jumpClones
				jumpFatigue = DateFormatter.eveDateFormatter.date(from: dictionary["jumpFatigue"] as? String ?? "")
				jumpLastUpdate = DateFormatter.eveDateFormatter.date(from: dictionary["jumpLastUpdate"] as? String ?? "")
				lastRespecDate = DateFormatter.eveDateFormatter.date(from: dictionary["lastRespecDate"] as? String ?? "")
				lastTimedRespec = DateFormatter.eveDateFormatter.date(from: dictionary["lastTimedRespec"] as? String ?? "")
				guard let race = dictionary["race"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.race = race
				remoteStationDate = DateFormatter.eveDateFormatter.date(from: dictionary["remoteStationDate"] as? String ?? "")
				guard let skills = try dictionary.rowset(name: "skills")?.map ({try EVE.Char.CharacterSheet.Skill(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.skills = skills
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["allianceID"] = allianceID.json
				if let v = allianceName?.json {
					json["allianceName"] = v
				}
				json["ancestry"] = ancestry.json
				json["ancestryID"] = ancestryID.json
				json["attributes"] = attributes.json
				json["balance"] = balance.json
				json["bloodLine"] = bloodLine.json
				json["bloodLineID"] = bloodLineID.json
				json["certificates"] = certificates.json
				json["characterID"] = characterID.json
				json["characterName"] = characterName.json
				if let v = cloneJumpDate?.json {
					json["cloneJumpDate"] = v
				}
				json["cloneName"] = cloneName.json
				json["cloneSkillPoints"] = cloneSkillPoints.json
				json["cloneTypeID"] = cloneTypeID.json
				json["corporationID"] = corporationID.json
				json["corporationName"] = corporationName.json
				json["corporationRoles"] = corporationRoles.json
				json["corporationRolesAtBase"] = corporationRolesAtBase.json
				json["corporationRolesAtHQ"] = corporationRolesAtHQ.json
				json["corporationRolesAtOther"] = corporationRolesAtOther.json
				json["corporationTitles"] = corporationTitles.json
				json["dateOfBirth"] = dateOfBirth.json
				if let v = factionID?.json {
					json["factionID"] = v
				}
				if let v = factionName?.json {
					json["factionName"] = v
				}
				json["freeRespecs"] = freeRespecs.json
				json["freeSkillPoints"] = freeSkillPoints.json
				json["gender"] = gender.json
				json["homeStationID"] = homeStationID.json
				json["implants"] = implants.json
				if let v = jumpActivation?.json {
					json["jumpActivation"] = v
				}
				json["jumpCloneImplants"] = jumpCloneImplants.json
				json["jumpClones"] = jumpClones.json
				if let v = jumpFatigue?.json {
					json["jumpFatigue"] = v
				}
				if let v = jumpLastUpdate?.json {
					json["jumpLastUpdate"] = v
				}
				if let v = lastRespecDate?.json {
					json["lastRespecDate"] = v
				}
				if let v = lastTimedRespec?.json {
					json["lastTimedRespec"] = v
				}
				json["race"] = race.json
				if let v = remoteStationDate?.json {
					json["remoteStationDate"] = v
				}
				json["skills"] = skills.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.allianceID.hashValue)
				hashCombine(seed: &hash, value: self.allianceName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.ancestry.hashValue)
				hashCombine(seed: &hash, value: self.ancestryID.hashValue)
				hashCombine(seed: &hash, value: self.attributes.hashValue)
				hashCombine(seed: &hash, value: self.balance.hashValue)
				hashCombine(seed: &hash, value: self.bloodLine.hashValue)
				hashCombine(seed: &hash, value: self.bloodLineID.hashValue)
				self.certificates.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.characterID.hashValue)
				hashCombine(seed: &hash, value: self.characterName.hashValue)
				hashCombine(seed: &hash, value: self.cloneJumpDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.cloneName.hashValue)
				hashCombine(seed: &hash, value: self.cloneSkillPoints.hashValue)
				hashCombine(seed: &hash, value: self.cloneTypeID.hashValue)
				hashCombine(seed: &hash, value: self.corporationID.hashValue)
				hashCombine(seed: &hash, value: self.corporationName.hashValue)
				self.corporationRoles.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporationRolesAtBase.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporationRolesAtHQ.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporationRolesAtOther.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporationTitles.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.dateOfBirth.hashValue)
				hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.factionName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.freeRespecs.hashValue)
				hashCombine(seed: &hash, value: self.freeSkillPoints.hashValue)
				hashCombine(seed: &hash, value: self.gender.hashValue)
				hashCombine(seed: &hash, value: self.homeStationID.hashValue)
				self.implants.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.jumpActivation?.hashValue ?? 0)
				self.jumpCloneImplants.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.jumpClones.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.jumpFatigue?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.jumpLastUpdate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.lastRespecDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.lastTimedRespec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.race.hashValue)
				hashCombine(seed: &hash, value: self.remoteStationDate?.hashValue ?? 0)
				self.skills.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.CharacterSheet, rhs: EVE.Char.CharacterSheet) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.CharacterSheet) {
				allianceID = other.allianceID
				allianceName = other.allianceName
				ancestry = other.ancestry
				ancestryID = other.ancestryID
				attributes = EVE.Char.CharacterSheet.Attributes(other.attributes)
				balance = other.balance
				bloodLine = other.bloodLine
				bloodLineID = other.bloodLineID
				certificates = other.certificates.flatMap { EVE.Char.CharacterSheet.Certificate($0) }
				characterID = other.characterID
				characterName = other.characterName
				cloneJumpDate = other.cloneJumpDate
				cloneName = other.cloneName
				cloneSkillPoints = other.cloneSkillPoints
				cloneTypeID = other.cloneTypeID
				corporationID = other.corporationID
				corporationName = other.corporationName
				corporationRoles = other.corporationRoles.flatMap { EVE.Char.CharacterSheet.Role($0) }
				corporationRolesAtBase = other.corporationRolesAtBase.flatMap { EVE.Char.CharacterSheet.Role($0) }
				corporationRolesAtHQ = other.corporationRolesAtHQ.flatMap { EVE.Char.CharacterSheet.Role($0) }
				corporationRolesAtOther = other.corporationRolesAtOther.flatMap { EVE.Char.CharacterSheet.Role($0) }
				corporationTitles = other.corporationTitles.flatMap { EVE.Char.CharacterSheet.Role($0) }
				dateOfBirth = other.dateOfBirth
				factionID = other.factionID
				factionName = other.factionName
				freeRespecs = other.freeRespecs
				freeSkillPoints = other.freeSkillPoints
				gender = other.gender
				homeStationID = other.homeStationID
				implants = other.implants.flatMap { EVE.Char.CharacterSheet.Implant($0) }
				jumpActivation = other.jumpActivation
				jumpCloneImplants = other.jumpCloneImplants.flatMap { EVE.Char.CharacterSheet.JumpCloneImplant($0) }
				jumpClones = other.jumpClones.flatMap { EVE.Char.CharacterSheet.JumpClone($0) }
				jumpFatigue = other.jumpFatigue
				jumpLastUpdate = other.jumpLastUpdate
				lastRespecDate = other.lastRespecDate
				lastTimedRespec = other.lastTimedRespec
				race = other.race
				remoteStationDate = other.remoteStationDate
				skills = other.skills.flatMap { EVE.Char.CharacterSheet.Skill($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.CharacterSheet(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.CharacterSheet)?.hashValue == hashValue
			}
			
		}
		
		
		public class ChatChannels: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Channel: NSObject, Codable, NSCopying, JSONCoding {
				
				public class Accessor: NSObject, Codable, NSCopying, JSONCoding {
					
					
					public var accessorID: Int64 = Int64()
					public var accessorName: String = String()
					public var reason: String? = nil
					public var untilWhen: Date? = nil
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						guard let accessorID = dictionary["accessorID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.accessorID = accessorID
						guard let accessorName = dictionary["accessorName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.accessorName = accessorName
						reason = dictionary["reason"] as? String
						untilWhen = DateFormatter.eveDateFormatter.date(from: dictionary["untilWhen"] as? String ?? "")
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					/*
					public required init?(coder aDecoder: NSCoder) {
						{decodings}
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						{encodings}
					}
					*/
					public var json: Any {
						var json = [String: Any]()
						json["accessorID"] = accessorID.json
						json["accessorName"] = accessorName.json
						if let v = reason?.json {
							json["reason"] = v
						}
						if let v = untilWhen?.json {
							json["untilWhen"] = v
						}
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.accessorID.hashValue)
						hashCombine(seed: &hash, value: self.accessorName.hashValue)
						hashCombine(seed: &hash, value: self.reason?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.untilWhen?.hashValue ?? 0)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: EVE.Char.ChatChannels.Channel.Accessor, rhs: EVE.Char.ChatChannels.Channel.Accessor) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: EVE.Char.ChatChannels.Channel.Accessor) {
						accessorID = other.accessorID
						accessorName = other.accessorName
						reason = other.reason
						untilWhen = other.untilWhen
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return EVE.Char.ChatChannels.Channel.Accessor(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? EVE.Char.ChatChannels.Channel.Accessor)?.hashValue == hashValue
					}
					
				}
				
				public var allowed: [EVE.Char.ChatChannels.Channel.Accessor]? = nil
				public var blocked: [EVE.Char.ChatChannels.Channel.Accessor]? = nil
				public var channelID: Int = Int()
				public var comparisonKey: String = String()
				public var displayName: String = String()
				public var hasPassword: Bool = Bool()
				public var motd: String = String()
				public var muted: [EVE.Char.ChatChannels.Channel.Accessor]? = nil
				public var operators: [EVE.Char.ChatChannels.Channel.Accessor]? = nil
				public var ownerID: Int64 = Int64()
				public var ownerName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					allowed = try dictionary.rowset(name: "allowed")?.map {try EVE.Char.ChatChannels.Channel.Accessor(json: $0)}
					blocked = try dictionary.rowset(name: "blocked")?.map {try EVE.Char.ChatChannels.Channel.Accessor(json: $0)}
					guard let channelID = dictionary["channelID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.channelID = channelID
					guard let comparisonKey = dictionary["comparisonKey"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.comparisonKey = comparisonKey
					guard let displayName = dictionary["displayName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.displayName = displayName
					guard let hasPassword = dictionary["hasPassword"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.hasPassword = hasPassword
					guard let motd = dictionary["motd"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.motd = motd
					muted = try dictionary.rowset(name: "muted")?.map {try EVE.Char.ChatChannels.Channel.Accessor(json: $0)}
					operators = try dictionary.rowset(name: "operators")?.map {try EVE.Char.ChatChannels.Channel.Accessor(json: $0)}
					guard let ownerID = dictionary["ownerID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.ownerID = ownerID
					guard let ownerName = dictionary["ownerName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.ownerName = ownerName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					if let v = allowed?.json {
						json["allowed"] = v
					}
					if let v = blocked?.json {
						json["blocked"] = v
					}
					json["channelID"] = channelID.json
					json["comparisonKey"] = comparisonKey.json
					json["displayName"] = displayName.json
					json["hasPassword"] = hasPassword.json
					json["motd"] = motd.json
					if let v = muted?.json {
						json["muted"] = v
					}
					if let v = operators?.json {
						json["operators"] = v
					}
					json["ownerID"] = ownerID.json
					json["ownerName"] = ownerName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.allowed?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.blocked?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.channelID.hashValue)
					hashCombine(seed: &hash, value: self.comparisonKey.hashValue)
					hashCombine(seed: &hash, value: self.displayName.hashValue)
					hashCombine(seed: &hash, value: self.hasPassword.hashValue)
					hashCombine(seed: &hash, value: self.motd.hashValue)
					self.muted?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.operators?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.ownerID.hashValue)
					hashCombine(seed: &hash, value: self.ownerName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.ChatChannels.Channel, rhs: EVE.Char.ChatChannels.Channel) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.ChatChannels.Channel) {
					allowed = other.allowed?.flatMap { EVE.Char.ChatChannels.Channel.Accessor($0) }
					blocked = other.blocked?.flatMap { EVE.Char.ChatChannels.Channel.Accessor($0) }
					channelID = other.channelID
					comparisonKey = other.comparisonKey
					displayName = other.displayName
					hasPassword = other.hasPassword
					motd = other.motd
					muted = other.muted?.flatMap { EVE.Char.ChatChannels.Channel.Accessor($0) }
					operators = other.operators?.flatMap { EVE.Char.ChatChannels.Channel.Accessor($0) }
					ownerID = other.ownerID
					ownerName = other.ownerName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.ChatChannels.Channel(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.ChatChannels.Channel)?.hashValue == hashValue
				}
				
			}
			
			public var channels: [EVE.Char.ChatChannels.Channel] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let channels = try dictionary.rowset(name: "channels")?.map ({try EVE.Char.ChatChannels.Channel(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.channels = channels
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["channels"] = channels.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.channels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.ChatChannels, rhs: EVE.Char.ChatChannels) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.ChatChannels) {
				channels = other.channels.flatMap { EVE.Char.ChatChannels.Channel($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.ChatChannels(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.ChatChannels)?.hashValue == hashValue
			}
			
		}
		
		
		public class Clones: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Attributes: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var charisma: Int = Int()
				public var intelligence: Int = Int()
				public var memory: Int = Int()
				public var perception: Int = Int()
				public var willpower: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let charisma = dictionary["charisma"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.charisma = charisma
					guard let intelligence = dictionary["intelligence"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.intelligence = intelligence
					guard let memory = dictionary["memory"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.memory = memory
					guard let perception = dictionary["perception"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.perception = perception
					guard let willpower = dictionary["willpower"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.willpower = willpower
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["charisma"] = charisma.json
					json["intelligence"] = intelligence.json
					json["memory"] = memory.json
					json["perception"] = perception.json
					json["willpower"] = willpower.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.charisma.hashValue)
					hashCombine(seed: &hash, value: self.intelligence.hashValue)
					hashCombine(seed: &hash, value: self.memory.hashValue)
					hashCombine(seed: &hash, value: self.perception.hashValue)
					hashCombine(seed: &hash, value: self.willpower.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Clones.Attributes, rhs: EVE.Char.Clones.Attributes) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Clones.Attributes) {
					charisma = other.charisma
					intelligence = other.intelligence
					memory = other.memory
					perception = other.perception
					willpower = other.willpower
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Clones.Attributes(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Clones.Attributes)?.hashValue == hashValue
				}
				
			}
			
			public enum Gender: String, JSONCoding, Codable {
				case female = "Female"
				case male = "Male"
				
				public init() {
					self = .female
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Gender(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
					self = v
				}
				
			}
			
			public class Implant: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.typeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Clones.Implant, rhs: EVE.Char.Clones.Implant) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Clones.Implant) {
					typeID = other.typeID
					typeName = other.typeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Clones.Implant(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Clones.Implant)?.hashValue == hashValue
				}
				
			}
			
			public class JumpClone: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var cloneName: String = String()
				public var jumpCloneID: Int64 = Int64()
				public var locationID: Int64 = Int64()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let cloneName = dictionary["cloneName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.cloneName = cloneName
					guard let jumpCloneID = dictionary["jumpCloneID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.jumpCloneID = jumpCloneID
					guard let locationID = dictionary["locationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.locationID = locationID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["cloneName"] = cloneName.json
					json["jumpCloneID"] = jumpCloneID.json
					json["locationID"] = locationID.json
					json["typeID"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.cloneName.hashValue)
					hashCombine(seed: &hash, value: self.jumpCloneID.hashValue)
					hashCombine(seed: &hash, value: self.locationID.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Clones.JumpClone, rhs: EVE.Char.Clones.JumpClone) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Clones.JumpClone) {
					cloneName = other.cloneName
					jumpCloneID = other.jumpCloneID
					locationID = other.locationID
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Clones.JumpClone(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Clones.JumpClone)?.hashValue == hashValue
				}
				
			}
			
			public class JumpCloneImplant: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var jumpCloneID: Int64 = Int64()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let jumpCloneID = dictionary["jumpCloneID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.jumpCloneID = jumpCloneID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["jumpCloneID"] = jumpCloneID.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.jumpCloneID.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.typeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Clones.JumpCloneImplant, rhs: EVE.Char.Clones.JumpCloneImplant) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Clones.JumpCloneImplant) {
					jumpCloneID = other.jumpCloneID
					typeID = other.typeID
					typeName = other.typeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Clones.JumpCloneImplant(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Clones.JumpCloneImplant)?.hashValue == hashValue
				}
				
			}
			
			public var ancestry: String = String()
			public var ancestryID: Int = Int()
			public var attributes: EVE.Char.Clones.Attributes = EVE.Char.Clones.Attributes()
			public var bloodLine: String = String()
			public var bloodLineID: Int = Int()
			public var cloneJumpDate: Date? = nil
			public var dateOfBirth: Date = Date()
			public var freeRespecs: Int = Int()
			public var gender: EVE.Char.Clones.Gender = EVE.Char.Clones.Gender()
			public var implants: [EVE.Char.Clones.Implant]? = nil
			public var jumpActivation: Date? = nil
			public var jumpCloneImplants: [EVE.Char.Clones.JumpCloneImplant]? = nil
			public var jumpClones: [EVE.Char.Clones.JumpClone]? = nil
			public var jumpFatigue: Date? = nil
			public var jumpLastUpdate: Date? = nil
			public var lastRespecDate: Date? = nil
			public var lastTimedRespec: Date? = nil
			public var race: String = String()
			public var remoteStationDate: Date? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let ancestry = dictionary["ancestry"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ancestry = ancestry
				guard let ancestryID = dictionary["ancestryID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.ancestryID = ancestryID
				attributes = try EVE.Char.Clones.Attributes(json: dictionary["attributes"] as? [String: Any] ?? [:])
				guard let bloodLine = dictionary["bloodLine"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.bloodLine = bloodLine
				guard let bloodLineID = dictionary["bloodLineID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.bloodLineID = bloodLineID
				cloneJumpDate = DateFormatter.eveDateFormatter.date(from: dictionary["cloneJumpDate"] as? String ?? "")
				guard let dateOfBirth = DateFormatter.eveDateFormatter.date(from: dictionary["DoB"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.dateOfBirth = dateOfBirth
				guard let freeRespecs = dictionary["freeRespecs"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.freeRespecs = freeRespecs
				guard let gender = EVE.Char.Clones.Gender(rawValue: dictionary["gender"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.gender = gender
				implants = try dictionary.rowset(name: "implants")?.map {try EVE.Char.Clones.Implant(json: $0)}
				jumpActivation = DateFormatter.eveDateFormatter.date(from: dictionary["jumpActivation"] as? String ?? "")
				jumpCloneImplants = try dictionary.rowset(name: "jumpCloneImplants")?.map {try EVE.Char.Clones.JumpCloneImplant(json: $0)}
				jumpClones = try dictionary.rowset(name: "jumpClones")?.map {try EVE.Char.Clones.JumpClone(json: $0)}
				jumpFatigue = DateFormatter.eveDateFormatter.date(from: dictionary["jumpFatigue"] as? String ?? "")
				jumpLastUpdate = DateFormatter.eveDateFormatter.date(from: dictionary["jumpLastUpdate"] as? String ?? "")
				lastRespecDate = DateFormatter.eveDateFormatter.date(from: dictionary["lastRespecDate"] as? String ?? "")
				lastTimedRespec = DateFormatter.eveDateFormatter.date(from: dictionary["lastTimedRespec"] as? String ?? "")
				guard let race = dictionary["race"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.race = race
				remoteStationDate = DateFormatter.eveDateFormatter.date(from: dictionary["remoteStationDate"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["ancestry"] = ancestry.json
				json["ancestryID"] = ancestryID.json
				json["attributes"] = attributes.json
				json["bloodLine"] = bloodLine.json
				json["bloodLineID"] = bloodLineID.json
				if let v = cloneJumpDate?.json {
					json["cloneJumpDate"] = v
				}
				json["dateOfBirth"] = dateOfBirth.json
				json["freeRespecs"] = freeRespecs.json
				json["gender"] = gender.json
				if let v = implants?.json {
					json["implants"] = v
				}
				if let v = jumpActivation?.json {
					json["jumpActivation"] = v
				}
				if let v = jumpCloneImplants?.json {
					json["jumpCloneImplants"] = v
				}
				if let v = jumpClones?.json {
					json["jumpClones"] = v
				}
				if let v = jumpFatigue?.json {
					json["jumpFatigue"] = v
				}
				if let v = jumpLastUpdate?.json {
					json["jumpLastUpdate"] = v
				}
				if let v = lastRespecDate?.json {
					json["lastRespecDate"] = v
				}
				if let v = lastTimedRespec?.json {
					json["lastTimedRespec"] = v
				}
				json["race"] = race.json
				if let v = remoteStationDate?.json {
					json["remoteStationDate"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.ancestry.hashValue)
				hashCombine(seed: &hash, value: self.ancestryID.hashValue)
				hashCombine(seed: &hash, value: self.attributes.hashValue)
				hashCombine(seed: &hash, value: self.bloodLine.hashValue)
				hashCombine(seed: &hash, value: self.bloodLineID.hashValue)
				hashCombine(seed: &hash, value: self.cloneJumpDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.dateOfBirth.hashValue)
				hashCombine(seed: &hash, value: self.freeRespecs.hashValue)
				hashCombine(seed: &hash, value: self.gender.hashValue)
				self.implants?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.jumpActivation?.hashValue ?? 0)
				self.jumpCloneImplants?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.jumpClones?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.jumpFatigue?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.jumpLastUpdate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.lastRespecDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.lastTimedRespec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: self.race.hashValue)
				hashCombine(seed: &hash, value: self.remoteStationDate?.hashValue ?? 0)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Clones, rhs: EVE.Char.Clones) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Clones) {
				ancestry = other.ancestry
				ancestryID = other.ancestryID
				attributes = EVE.Char.Clones.Attributes(other.attributes)
				bloodLine = other.bloodLine
				bloodLineID = other.bloodLineID
				cloneJumpDate = other.cloneJumpDate
				dateOfBirth = other.dateOfBirth
				freeRespecs = other.freeRespecs
				gender = other.gender
				implants = other.implants?.flatMap { EVE.Char.Clones.Implant($0) }
				jumpActivation = other.jumpActivation
				jumpCloneImplants = other.jumpCloneImplants?.flatMap { EVE.Char.Clones.JumpCloneImplant($0) }
				jumpClones = other.jumpClones?.flatMap { EVE.Char.Clones.JumpClone($0) }
				jumpFatigue = other.jumpFatigue
				jumpLastUpdate = other.jumpLastUpdate
				lastRespecDate = other.lastRespecDate
				lastTimedRespec = other.lastTimedRespec
				race = other.race
				remoteStationDate = other.remoteStationDate
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Clones(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Clones)?.hashValue == hashValue
			}
			
		}
		
		
		public class ContactList: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Contact: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var contactID: Int64 = Int64()
				public var contactName: String = String()
				public var contactTypeID: Int = Int()
				public var inWatchlist: Bool? = nil
				public var labelMask: Int64 = Int64()
				public var standing: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let contactID = dictionary["contactID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contactID = contactID
					guard let contactName = dictionary["contactName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contactName = contactName
					guard let contactTypeID = dictionary["contactTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contactTypeID = contactTypeID
					inWatchlist = dictionary["inWatchlist"] as? Bool
					guard let labelMask = dictionary["labelMask"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.labelMask = labelMask
					guard let standing = dictionary["standing"] as? Float else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.standing = standing
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["contactID"] = contactID.json
					json["contactName"] = contactName.json
					json["contactTypeID"] = contactTypeID.json
					if let v = inWatchlist?.json {
						json["inWatchlist"] = v
					}
					json["labelMask"] = labelMask.json
					json["standing"] = standing.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.contactID.hashValue)
					hashCombine(seed: &hash, value: self.contactName.hashValue)
					hashCombine(seed: &hash, value: self.contactTypeID.hashValue)
					hashCombine(seed: &hash, value: self.inWatchlist?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.labelMask.hashValue)
					hashCombine(seed: &hash, value: self.standing.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.ContactList.Contact, rhs: EVE.Char.ContactList.Contact) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.ContactList.Contact) {
					contactID = other.contactID
					contactName = other.contactName
					contactTypeID = other.contactTypeID
					inWatchlist = other.inWatchlist
					labelMask = other.labelMask
					standing = other.standing
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.ContactList.Contact(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.ContactList.Contact)?.hashValue == hashValue
				}
				
			}
			
			public class Label: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var labelID: Int64 = Int64()
				public var name: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let labelID = dictionary["labelID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.labelID = labelID
					guard let name = dictionary["name"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.name = name
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["labelID"] = labelID.json
					json["name"] = name.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.labelID.hashValue)
					hashCombine(seed: &hash, value: self.name.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.ContactList.Label, rhs: EVE.Char.ContactList.Label) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.ContactList.Label) {
					labelID = other.labelID
					name = other.name
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.ContactList.Label(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.ContactList.Label)?.hashValue == hashValue
				}
				
			}
			
			public var allianceContactLabels: [EVE.Char.ContactList.Label] = []
			public var allianceContactList: [EVE.Char.ContactList.Contact] = []
			public var contactLabels: [EVE.Char.ContactList.Label] = []
			public var contactList: [EVE.Char.ContactList.Contact] = []
			public var corporateContactLabels: [EVE.Char.ContactList.Label] = []
			public var corporateContactList: [EVE.Char.ContactList.Contact] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let allianceContactLabels = try dictionary.rowset(name: "allianceContactLabels")?.map ({try EVE.Char.ContactList.Label(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.allianceContactLabels = allianceContactLabels
				guard let allianceContactList = try dictionary.rowset(name: "allianceContactList")?.map ({try EVE.Char.ContactList.Contact(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.allianceContactList = allianceContactList
				guard let contactLabels = try dictionary.rowset(name: "contactLabels")?.map ({try EVE.Char.ContactList.Label(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.contactLabels = contactLabels
				guard let contactList = try dictionary.rowset(name: "contactList")?.map ({try EVE.Char.ContactList.Contact(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.contactList = contactList
				guard let corporateContactLabels = try dictionary.rowset(name: "corporateContactLabels")?.map ({try EVE.Char.ContactList.Label(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporateContactLabels = corporateContactLabels
				guard let corporateContactList = try dictionary.rowset(name: "corporateContactList")?.map ({try EVE.Char.ContactList.Contact(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.corporateContactList = corporateContactList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["allianceContactLabels"] = allianceContactLabels.json
				json["allianceContactList"] = allianceContactList.json
				json["contactLabels"] = contactLabels.json
				json["contactList"] = contactList.json
				json["corporateContactLabels"] = corporateContactLabels.json
				json["corporateContactList"] = corporateContactList.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.allianceContactLabels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.allianceContactList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.contactLabels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.contactList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporateContactLabels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.corporateContactList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.ContactList, rhs: EVE.Char.ContactList) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.ContactList) {
				allianceContactLabels = other.allianceContactLabels.flatMap { EVE.Char.ContactList.Label($0) }
				allianceContactList = other.allianceContactList.flatMap { EVE.Char.ContactList.Contact($0) }
				contactLabels = other.contactLabels.flatMap { EVE.Char.ContactList.Label($0) }
				contactList = other.contactList.flatMap { EVE.Char.ContactList.Contact($0) }
				corporateContactLabels = other.corporateContactLabels.flatMap { EVE.Char.ContactList.Label($0) }
				corporateContactList = other.corporateContactList.flatMap { EVE.Char.ContactList.Contact($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.ContactList(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.ContactList)?.hashValue == hashValue
			}
			
		}
		
		
		public class ContactNotifications: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Notification: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var messageData: String = String()
				public var notificationID: Int64 = Int64()
				public var senderID: Int64 = Int64()
				public var senderName: String = String()
				public var sentDate: Date = Date()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let messageData = dictionary["messageData"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.messageData = messageData
					guard let notificationID = dictionary["notificationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.notificationID = notificationID
					guard let senderID = dictionary["senderID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.senderID = senderID
					guard let senderName = dictionary["senderName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.senderName = senderName
					guard let sentDate = DateFormatter.eveDateFormatter.date(from: dictionary["sentDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.sentDate = sentDate
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["messageData"] = messageData.json
					json["notificationID"] = notificationID.json
					json["senderID"] = senderID.json
					json["senderName"] = senderName.json
					json["sentDate"] = sentDate.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.messageData.hashValue)
					hashCombine(seed: &hash, value: self.notificationID.hashValue)
					hashCombine(seed: &hash, value: self.senderID.hashValue)
					hashCombine(seed: &hash, value: self.senderName.hashValue)
					hashCombine(seed: &hash, value: self.sentDate.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.ContactNotifications.Notification, rhs: EVE.Char.ContactNotifications.Notification) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.ContactNotifications.Notification) {
					messageData = other.messageData
					notificationID = other.notificationID
					senderID = other.senderID
					senderName = other.senderName
					sentDate = other.sentDate
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.ContactNotifications.Notification(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.ContactNotifications.Notification)?.hashValue == hashValue
				}
				
			}
			
			public var contactNotifications: [EVE.Char.ContactNotifications.Notification] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let contactNotifications = try dictionary.rowset(name: "contactNotifications")?.map ({try EVE.Char.ContactNotifications.Notification(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.contactNotifications = contactNotifications
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["contactNotifications"] = contactNotifications.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.contactNotifications.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.ContactNotifications, rhs: EVE.Char.ContactNotifications) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.ContactNotifications) {
				contactNotifications = other.contactNotifications.flatMap { EVE.Char.ContactNotifications.Notification($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.ContactNotifications(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.ContactNotifications)?.hashValue == hashValue
			}
			
		}
		
		
		public class ContractBids: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Bid: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var amount: Double = Double()
				public var bidID: Int64 = Int64()
				public var bidderID: Int64 = Int64()
				public var contractID: Int64 = Int64()
				public var dateBid: Date = Date()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let amount = dictionary["amount"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.amount = amount
					guard let bidID = dictionary["bidID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.bidID = bidID
					guard let bidderID = dictionary["bidderID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.bidderID = bidderID
					guard let contractID = dictionary["contractID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contractID = contractID
					guard let dateBid = DateFormatter.eveDateFormatter.date(from: dictionary["dateBid"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.dateBid = dateBid
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["amount"] = amount.json
					json["bidID"] = bidID.json
					json["bidderID"] = bidderID.json
					json["contractID"] = contractID.json
					json["dateBid"] = dateBid.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount.hashValue)
					hashCombine(seed: &hash, value: self.bidID.hashValue)
					hashCombine(seed: &hash, value: self.bidderID.hashValue)
					hashCombine(seed: &hash, value: self.contractID.hashValue)
					hashCombine(seed: &hash, value: self.dateBid.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.ContractBids.Bid, rhs: EVE.Char.ContractBids.Bid) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.ContractBids.Bid) {
					amount = other.amount
					bidID = other.bidID
					bidderID = other.bidderID
					contractID = other.contractID
					dateBid = other.dateBid
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.ContractBids.Bid(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.ContractBids.Bid)?.hashValue == hashValue
				}
				
			}
			
			public var bidList: [EVE.Char.ContractBids.Bid] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let bidList = try dictionary.rowset(name: "bidList")?.map ({try EVE.Char.ContractBids.Bid(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.bidList = bidList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["bidList"] = bidList.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.bidList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.ContractBids, rhs: EVE.Char.ContractBids) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.ContractBids) {
				bidList = other.bidList.flatMap { EVE.Char.ContractBids.Bid($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.ContractBids(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.ContractBids)?.hashValue == hashValue
			}
			
		}
		
		
		public class ContractItems: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Item: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var included: Bool = Bool()
				public var quantity: Int64 = Int64()
				public var rawQuantity: Int = Int()
				public var recordID: Int64 = Int64()
				public var singleton: Bool = Bool()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let included = dictionary["included"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.included = included
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantity = quantity
					guard let rawQuantity = dictionary["rawQuantity"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.rawQuantity = rawQuantity
					guard let recordID = dictionary["recordID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.recordID = recordID
					guard let singleton = dictionary["singleton"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.singleton = singleton
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["included"] = included.json
					json["quantity"] = quantity.json
					json["rawQuantity"] = rawQuantity.json
					json["recordID"] = recordID.json
					json["singleton"] = singleton.json
					json["typeID"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.included.hashValue)
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.rawQuantity.hashValue)
					hashCombine(seed: &hash, value: self.recordID.hashValue)
					hashCombine(seed: &hash, value: self.singleton.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.ContractItems.Item, rhs: EVE.Char.ContractItems.Item) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.ContractItems.Item) {
					included = other.included
					quantity = other.quantity
					rawQuantity = other.rawQuantity
					recordID = other.recordID
					singleton = other.singleton
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.ContractItems.Item(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.ContractItems.Item)?.hashValue == hashValue
				}
				
			}
			
			public var itemList: [EVE.Char.ContractItems.Item] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let itemList = try dictionary.rowset(name: "itemList")?.map ({try EVE.Char.ContractItems.Item(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.itemList = itemList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["itemList"] = itemList.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.itemList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.ContractItems, rhs: EVE.Char.ContractItems) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.ContractItems) {
				itemList = other.itemList.flatMap { EVE.Char.ContractItems.Item($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.ContractItems(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.ContractItems)?.hashValue == hashValue
			}
			
		}
		
		
		public class Contracts: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Contract: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum Availability: String, JSONCoding, Codable {
					case `private` = "Private"
					case `public` = "Public"
					
					public init() {
						self = .`private`
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = Availability(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public enum ContractType: String, JSONCoding, Codable {
					case auction = "Auction"
					case courier = "Courier"
					case itemExchange = "ItemExchange"
					case loan = "Loan"
					
					public init() {
						self = .auction
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = ContractType(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public enum Status: String, JSONCoding, Codable {
					case cancelled = "Cancelled"
					case completed = "Completed"
					case completedByContractor = "CompletedByContractor"
					case completedByIssuer = "CompletedByIssuer"
					case deleted = "Deleted"
					case failed = "Failed"
					case inProgress = "InProgress"
					case outstanding = "Outstanding"
					case rejected = "Rejected"
					case reversed = "Reversed"
					
					public init() {
						self = .cancelled
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = Status(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var acceptorID: Int64 = Int64()
				public var assigneeID: Int64 = Int64()
				public var availability: EVE.Char.Contracts.Contract.Availability = EVE.Char.Contracts.Contract.Availability()
				public var buyout: Double = Double()
				public var collateral: Double = Double()
				public var contractID: Int64 = Int64()
				public var dateAccepted: Date = Date()
				public var dateCompleted: Date = Date()
				public var dateExpired: Date = Date()
				public var dateIssued: Date = Date()
				public var endStationID: Int = Int()
				public var forCorp: Bool = Bool()
				public var issuerCorpID: Int64 = Int64()
				public var issuerID: Int64 = Int64()
				public var numDays: Int = Int()
				public var price: Double = Double()
				public var reward: Double = Double()
				public var startStationID: Int = Int()
				public var status: EVE.Char.Contracts.Contract.Status = EVE.Char.Contracts.Contract.Status()
				public var title: String = String()
				public var type: EVE.Char.Contracts.Contract.ContractType = EVE.Char.Contracts.Contract.ContractType()
				public var volume: Double = Double()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let acceptorID = dictionary["acceptorID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.acceptorID = acceptorID
					guard let assigneeID = dictionary["assigneeID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.assigneeID = assigneeID
					guard let availability = EVE.Char.Contracts.Contract.Availability(rawValue: dictionary["availability"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.availability = availability
					guard let buyout = dictionary["buyout"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.buyout = buyout
					guard let collateral = dictionary["collateral"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.collateral = collateral
					guard let contractID = dictionary["contractID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contractID = contractID
					guard let dateAccepted = DateFormatter.eveDateFormatter.date(from: dictionary["dateAccepted"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.dateAccepted = dateAccepted
					guard let dateCompleted = DateFormatter.eveDateFormatter.date(from: dictionary["dateCompleted"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.dateCompleted = dateCompleted
					guard let dateExpired = DateFormatter.eveDateFormatter.date(from: dictionary["dateExpired"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.dateExpired = dateExpired
					guard let dateIssued = DateFormatter.eveDateFormatter.date(from: dictionary["dateIssued"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.dateIssued = dateIssued
					guard let endStationID = dictionary["endStationID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.endStationID = endStationID
					guard let forCorp = dictionary["forCorp"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.forCorp = forCorp
					guard let issuerCorpID = dictionary["issuerCorpID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.issuerCorpID = issuerCorpID
					guard let issuerID = dictionary["issuerID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.issuerID = issuerID
					guard let numDays = dictionary["numDays"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.numDays = numDays
					guard let price = dictionary["price"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.price = price
					guard let reward = dictionary["reward"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.reward = reward
					guard let startStationID = dictionary["startStationID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.startStationID = startStationID
					guard let status = EVE.Char.Contracts.Contract.Status(rawValue: dictionary["status"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.status = status
					guard let title = dictionary["title"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.title = title
					guard let type = EVE.Char.Contracts.Contract.ContractType(rawValue: dictionary["type"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.type = type
					guard let volume = dictionary["volume"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.volume = volume
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["acceptorID"] = acceptorID.json
					json["assigneeID"] = assigneeID.json
					json["availability"] = availability.json
					json["buyout"] = buyout.json
					json["collateral"] = collateral.json
					json["contractID"] = contractID.json
					json["dateAccepted"] = dateAccepted.json
					json["dateCompleted"] = dateCompleted.json
					json["dateExpired"] = dateExpired.json
					json["dateIssued"] = dateIssued.json
					json["endStationID"] = endStationID.json
					json["forCorp"] = forCorp.json
					json["issuerCorpID"] = issuerCorpID.json
					json["issuerID"] = issuerID.json
					json["numDays"] = numDays.json
					json["price"] = price.json
					json["reward"] = reward.json
					json["startStationID"] = startStationID.json
					json["status"] = status.json
					json["title"] = title.json
					json["type"] = type.json
					json["volume"] = volume.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.acceptorID.hashValue)
					hashCombine(seed: &hash, value: self.assigneeID.hashValue)
					hashCombine(seed: &hash, value: self.availability.hashValue)
					hashCombine(seed: &hash, value: self.buyout.hashValue)
					hashCombine(seed: &hash, value: self.collateral.hashValue)
					hashCombine(seed: &hash, value: self.contractID.hashValue)
					hashCombine(seed: &hash, value: self.dateAccepted.hashValue)
					hashCombine(seed: &hash, value: self.dateCompleted.hashValue)
					hashCombine(seed: &hash, value: self.dateExpired.hashValue)
					hashCombine(seed: &hash, value: self.dateIssued.hashValue)
					hashCombine(seed: &hash, value: self.endStationID.hashValue)
					hashCombine(seed: &hash, value: self.forCorp.hashValue)
					hashCombine(seed: &hash, value: self.issuerCorpID.hashValue)
					hashCombine(seed: &hash, value: self.issuerID.hashValue)
					hashCombine(seed: &hash, value: self.numDays.hashValue)
					hashCombine(seed: &hash, value: self.price.hashValue)
					hashCombine(seed: &hash, value: self.reward.hashValue)
					hashCombine(seed: &hash, value: self.startStationID.hashValue)
					hashCombine(seed: &hash, value: self.status.hashValue)
					hashCombine(seed: &hash, value: self.title.hashValue)
					hashCombine(seed: &hash, value: self.type.hashValue)
					hashCombine(seed: &hash, value: self.volume.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Contracts.Contract, rhs: EVE.Char.Contracts.Contract) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Contracts.Contract) {
					acceptorID = other.acceptorID
					assigneeID = other.assigneeID
					availability = other.availability
					buyout = other.buyout
					collateral = other.collateral
					contractID = other.contractID
					dateAccepted = other.dateAccepted
					dateCompleted = other.dateCompleted
					dateExpired = other.dateExpired
					dateIssued = other.dateIssued
					endStationID = other.endStationID
					forCorp = other.forCorp
					issuerCorpID = other.issuerCorpID
					issuerID = other.issuerID
					numDays = other.numDays
					price = other.price
					reward = other.reward
					startStationID = other.startStationID
					status = other.status
					title = other.title
					type = other.type
					volume = other.volume
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Contracts.Contract(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Contracts.Contract)?.hashValue == hashValue
				}
				
			}
			
			public var contractList: [EVE.Char.Contracts.Contract] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let contractList = try dictionary.rowset(name: "contractList")?.map ({try EVE.Char.Contracts.Contract(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.contractList = contractList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["contractList"] = contractList.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.contractList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Contracts, rhs: EVE.Char.Contracts) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Contracts) {
				contractList = other.contractList.flatMap { EVE.Char.Contracts.Contract($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Contracts(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Contracts)?.hashValue == hashValue
			}
			
		}
		
		
		public class FacWarStats: NSObject, Codable, NSCopying, JSONCoding {
			
			
			public var currentRank: Int = Int()
			public var enlisted: Date = Date()
			public var factionID: Int = Int()
			public var factionName: String = String()
			public var highestRank: Int = Int()
			public var killsLastWeek: Int = Int()
			public var killsTotal: Int = Int()
			public var killsYesterday: Int = Int()
			public var victoryPointsLastWeek: Int = Int()
			public var victoryPointsTotal: Int = Int()
			public var victoryPointsYesterday: Int = Int()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let currentRank = dictionary["currentRank"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.currentRank = currentRank
				guard let enlisted = DateFormatter.eveDateFormatter.date(from: dictionary["enlisted"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
				self.enlisted = enlisted
				guard let factionID = dictionary["factionID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.factionID = factionID
				guard let factionName = dictionary["factionName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.factionName = factionName
				guard let highestRank = dictionary["highestRank"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.highestRank = highestRank
				guard let killsLastWeek = dictionary["killsLastWeek"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killsLastWeek = killsLastWeek
				guard let killsTotal = dictionary["killsTotal"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killsTotal = killsTotal
				guard let killsYesterday = dictionary["killsYesterday"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.killsYesterday = killsYesterday
				guard let victoryPointsLastWeek = dictionary["victoryPointsLastWeek"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.victoryPointsLastWeek = victoryPointsLastWeek
				guard let victoryPointsTotal = dictionary["victoryPointsTotal"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.victoryPointsTotal = victoryPointsTotal
				guard let victoryPointsYesterday = dictionary["victoryPointsYesterday"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.victoryPointsYesterday = victoryPointsYesterday
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["currentRank"] = currentRank.json
				json["enlisted"] = enlisted.json
				json["factionID"] = factionID.json
				json["factionName"] = factionName.json
				json["highestRank"] = highestRank.json
				json["killsLastWeek"] = killsLastWeek.json
				json["killsTotal"] = killsTotal.json
				json["killsYesterday"] = killsYesterday.json
				json["victoryPointsLastWeek"] = victoryPointsLastWeek.json
				json["victoryPointsTotal"] = victoryPointsTotal.json
				json["victoryPointsYesterday"] = victoryPointsYesterday.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.currentRank.hashValue)
				hashCombine(seed: &hash, value: self.enlisted.hashValue)
				hashCombine(seed: &hash, value: self.factionID.hashValue)
				hashCombine(seed: &hash, value: self.factionName.hashValue)
				hashCombine(seed: &hash, value: self.highestRank.hashValue)
				hashCombine(seed: &hash, value: self.killsLastWeek.hashValue)
				hashCombine(seed: &hash, value: self.killsTotal.hashValue)
				hashCombine(seed: &hash, value: self.killsYesterday.hashValue)
				hashCombine(seed: &hash, value: self.victoryPointsLastWeek.hashValue)
				hashCombine(seed: &hash, value: self.victoryPointsTotal.hashValue)
				hashCombine(seed: &hash, value: self.victoryPointsYesterday.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.FacWarStats, rhs: EVE.Char.FacWarStats) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.FacWarStats) {
				currentRank = other.currentRank
				enlisted = other.enlisted
				factionID = other.factionID
				factionName = other.factionName
				highestRank = other.highestRank
				killsLastWeek = other.killsLastWeek
				killsTotal = other.killsTotal
				killsYesterday = other.killsYesterday
				victoryPointsLastWeek = other.victoryPointsLastWeek
				victoryPointsTotal = other.victoryPointsTotal
				victoryPointsYesterday = other.victoryPointsYesterday
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.FacWarStats(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.FacWarStats)?.hashValue == hashValue
			}
			
		}
		
		
		public class IndustryJobs: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Job: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum Status: Int, JSONCoding, Codable {
					case active = 1
					case cancelled = 102
					case delivered = 101
					case paused = 2
					case ready = 3
					case reverted = 103
					
					public init() {
						self = .active
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? Int, let v = Status(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var activityID: Int = Int()
				public var blueprintID: Int64 = Int64()
				public var blueprintLocationID: Int64 = Int64()
				public var blueprintTypeID: Int = Int()
				public var blueprintTypeName: String = String()
				public var completedCharacterID: Int64 = Int64()
				public var completedDate: Date = Date()
				public var cost: Double = Double()
				public var endDate: Date = Date()
				public var facilityID: Int = Int()
				public var installerID: Int64 = Int64()
				public var installerName: String = String()
				public var jobID: Int64 = Int64()
				public var licensedRuns: Int = Int()
				public var outputLocationID: Int64 = Int64()
				public var pauseDate: Date = Date()
				public var probability: Float = Float()
				public var productTypeID: Int = Int()
				public var productTypeName: String = String()
				public var runs: Int = Int()
				public var solarSystemID: Int = Int()
				public var solarSystemName: String = String()
				public var startDate: Date = Date()
				public var stationID: Int64 = Int64()
				public var status: EVE.Char.IndustryJobs.Job.Status = EVE.Char.IndustryJobs.Job.Status()
				public var successfulRuns: Int = Int()
				public var teamID: Int = Int()
				public var timeInSeconds: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let activityID = dictionary["activityID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.activityID = activityID
					guard let blueprintID = dictionary["blueprintID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.blueprintID = blueprintID
					guard let blueprintLocationID = dictionary["blueprintLocationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.blueprintLocationID = blueprintLocationID
					guard let blueprintTypeID = dictionary["blueprintTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.blueprintTypeID = blueprintTypeID
					guard let blueprintTypeName = dictionary["blueprintTypeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.blueprintTypeName = blueprintTypeName
					guard let completedCharacterID = dictionary["completedCharacterID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.completedCharacterID = completedCharacterID
					guard let completedDate = DateFormatter.eveDateFormatter.date(from: dictionary["completedDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.completedDate = completedDate
					guard let cost = dictionary["cost"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.cost = cost
					guard let endDate = DateFormatter.eveDateFormatter.date(from: dictionary["endDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.endDate = endDate
					guard let facilityID = dictionary["facilityID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.facilityID = facilityID
					guard let installerID = dictionary["installerID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.installerID = installerID
					guard let installerName = dictionary["installerName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.installerName = installerName
					guard let jobID = dictionary["jobID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.jobID = jobID
					guard let licensedRuns = dictionary["licensedRuns"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.licensedRuns = licensedRuns
					guard let outputLocationID = dictionary["outputLocationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.outputLocationID = outputLocationID
					guard let pauseDate = DateFormatter.eveDateFormatter.date(from: dictionary["pauseDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.pauseDate = pauseDate
					guard let probability = dictionary["probability"] as? Float else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.probability = probability
					guard let productTypeID = dictionary["productTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.productTypeID = productTypeID
					guard let productTypeName = dictionary["productTypeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.productTypeName = productTypeName
					guard let runs = dictionary["runs"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.runs = runs
					guard let solarSystemID = dictionary["solarSystemID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.solarSystemID = solarSystemID
					guard let solarSystemName = dictionary["solarSystemName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.solarSystemName = solarSystemName
					guard let startDate = DateFormatter.eveDateFormatter.date(from: dictionary["startDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.startDate = startDate
					guard let stationID = dictionary["stationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.stationID = stationID
					guard let status = EVE.Char.IndustryJobs.Job.Status(rawValue: dictionary["status"] as? Int ?? Int()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.status = status
					guard let successfulRuns = dictionary["successfulRuns"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.successfulRuns = successfulRuns
					guard let teamID = dictionary["teamID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.teamID = teamID
					guard let timeInSeconds = dictionary["timeInSeconds"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.timeInSeconds = timeInSeconds
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["activityID"] = activityID.json
					json["blueprintID"] = blueprintID.json
					json["blueprintLocationID"] = blueprintLocationID.json
					json["blueprintTypeID"] = blueprintTypeID.json
					json["blueprintTypeName"] = blueprintTypeName.json
					json["completedCharacterID"] = completedCharacterID.json
					json["completedDate"] = completedDate.json
					json["cost"] = cost.json
					json["endDate"] = endDate.json
					json["facilityID"] = facilityID.json
					json["installerID"] = installerID.json
					json["installerName"] = installerName.json
					json["jobID"] = jobID.json
					json["licensedRuns"] = licensedRuns.json
					json["outputLocationID"] = outputLocationID.json
					json["pauseDate"] = pauseDate.json
					json["probability"] = probability.json
					json["productTypeID"] = productTypeID.json
					json["productTypeName"] = productTypeName.json
					json["runs"] = runs.json
					json["solarSystemID"] = solarSystemID.json
					json["solarSystemName"] = solarSystemName.json
					json["startDate"] = startDate.json
					json["stationID"] = stationID.json
					json["status"] = status.json
					json["successfulRuns"] = successfulRuns.json
					json["teamID"] = teamID.json
					json["timeInSeconds"] = timeInSeconds.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.activityID.hashValue)
					hashCombine(seed: &hash, value: self.blueprintID.hashValue)
					hashCombine(seed: &hash, value: self.blueprintLocationID.hashValue)
					hashCombine(seed: &hash, value: self.blueprintTypeID.hashValue)
					hashCombine(seed: &hash, value: self.blueprintTypeName.hashValue)
					hashCombine(seed: &hash, value: self.completedCharacterID.hashValue)
					hashCombine(seed: &hash, value: self.completedDate.hashValue)
					hashCombine(seed: &hash, value: self.cost.hashValue)
					hashCombine(seed: &hash, value: self.endDate.hashValue)
					hashCombine(seed: &hash, value: self.facilityID.hashValue)
					hashCombine(seed: &hash, value: self.installerID.hashValue)
					hashCombine(seed: &hash, value: self.installerName.hashValue)
					hashCombine(seed: &hash, value: self.jobID.hashValue)
					hashCombine(seed: &hash, value: self.licensedRuns.hashValue)
					hashCombine(seed: &hash, value: self.outputLocationID.hashValue)
					hashCombine(seed: &hash, value: self.pauseDate.hashValue)
					hashCombine(seed: &hash, value: self.probability.hashValue)
					hashCombine(seed: &hash, value: self.productTypeID.hashValue)
					hashCombine(seed: &hash, value: self.productTypeName.hashValue)
					hashCombine(seed: &hash, value: self.runs.hashValue)
					hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
					hashCombine(seed: &hash, value: self.solarSystemName.hashValue)
					hashCombine(seed: &hash, value: self.startDate.hashValue)
					hashCombine(seed: &hash, value: self.stationID.hashValue)
					hashCombine(seed: &hash, value: self.status.hashValue)
					hashCombine(seed: &hash, value: self.successfulRuns.hashValue)
					hashCombine(seed: &hash, value: self.teamID.hashValue)
					hashCombine(seed: &hash, value: self.timeInSeconds.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.IndustryJobs.Job, rhs: EVE.Char.IndustryJobs.Job) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.IndustryJobs.Job) {
					activityID = other.activityID
					blueprintID = other.blueprintID
					blueprintLocationID = other.blueprintLocationID
					blueprintTypeID = other.blueprintTypeID
					blueprintTypeName = other.blueprintTypeName
					completedCharacterID = other.completedCharacterID
					completedDate = other.completedDate
					cost = other.cost
					endDate = other.endDate
					facilityID = other.facilityID
					installerID = other.installerID
					installerName = other.installerName
					jobID = other.jobID
					licensedRuns = other.licensedRuns
					outputLocationID = other.outputLocationID
					pauseDate = other.pauseDate
					probability = other.probability
					productTypeID = other.productTypeID
					productTypeName = other.productTypeName
					runs = other.runs
					solarSystemID = other.solarSystemID
					solarSystemName = other.solarSystemName
					startDate = other.startDate
					stationID = other.stationID
					status = other.status
					successfulRuns = other.successfulRuns
					teamID = other.teamID
					timeInSeconds = other.timeInSeconds
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.IndustryJobs.Job(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.IndustryJobs.Job)?.hashValue == hashValue
				}
				
			}
			
			public var jobs: [EVE.Char.IndustryJobs.Job] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let jobs = try dictionary.rowset(name: "jobs")?.map ({try EVE.Char.IndustryJobs.Job(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.jobs = jobs
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["jobs"] = jobs.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.jobs.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.IndustryJobs, rhs: EVE.Char.IndustryJobs) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.IndustryJobs) {
				jobs = other.jobs.flatMap { EVE.Char.IndustryJobs.Job($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.IndustryJobs(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.IndustryJobs)?.hashValue == hashValue
			}
			
		}
		
		
		public class KillMails: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Kill: NSObject, Codable, NSCopying, JSONCoding {
				
				public class Attacker: NSObject, Codable, NSCopying, JSONCoding {
					
					
					public var allianceID: Int64? = nil
					public var allianceName: String? = nil
					public var characterID: Int64 = Int64()
					public var characterName: String = String()
					public var corporationID: Int64 = Int64()
					public var corporationName: String = String()
					public var damageDone: Int64 = Int64()
					public var factionID: Int? = nil
					public var factionName: String? = nil
					public var finalBlow: Bool = Bool()
					public var securityStatus: Float = Float()
					public var shipTypeID: Int = Int()
					public var weaponTypeID: Int = Int()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						allianceID = dictionary["allianceID"] as? Int64
						allianceName = dictionary["allianceName"] as? String
						guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.characterID = characterID
						guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.characterName = characterName
						guard let corporationID = dictionary["corporationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.corporationID = corporationID
						guard let corporationName = dictionary["corporationName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.corporationName = corporationName
						guard let damageDone = dictionary["damageDone"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.damageDone = damageDone
						factionID = dictionary["factionID"] as? Int
						factionName = dictionary["factionName"] as? String
						guard let finalBlow = dictionary["finalBlow"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.finalBlow = finalBlow
						guard let securityStatus = dictionary["securityStatus"] as? Float else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.securityStatus = securityStatus
						guard let shipTypeID = dictionary["shipTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.shipTypeID = shipTypeID
						guard let weaponTypeID = dictionary["weaponTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.weaponTypeID = weaponTypeID
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					/*
					public required init?(coder aDecoder: NSCoder) {
						{decodings}
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						{encodings}
					}
					*/
					public var json: Any {
						var json = [String: Any]()
						if let v = allianceID?.json {
							json["allianceID"] = v
						}
						if let v = allianceName?.json {
							json["allianceName"] = v
						}
						json["characterID"] = characterID.json
						json["characterName"] = characterName.json
						json["corporationID"] = corporationID.json
						json["corporationName"] = corporationName.json
						json["damageDone"] = damageDone.json
						if let v = factionID?.json {
							json["factionID"] = v
						}
						if let v = factionName?.json {
							json["factionName"] = v
						}
						json["finalBlow"] = finalBlow.json
						json["securityStatus"] = securityStatus.json
						json["shipTypeID"] = shipTypeID.json
						json["weaponTypeID"] = weaponTypeID.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.allianceName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.characterID.hashValue)
						hashCombine(seed: &hash, value: self.characterName.hashValue)
						hashCombine(seed: &hash, value: self.corporationID.hashValue)
						hashCombine(seed: &hash, value: self.corporationName.hashValue)
						hashCombine(seed: &hash, value: self.damageDone.hashValue)
						hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.factionName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.finalBlow.hashValue)
						hashCombine(seed: &hash, value: self.securityStatus.hashValue)
						hashCombine(seed: &hash, value: self.shipTypeID.hashValue)
						hashCombine(seed: &hash, value: self.weaponTypeID.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: EVE.Char.KillMails.Kill.Attacker, rhs: EVE.Char.KillMails.Kill.Attacker) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: EVE.Char.KillMails.Kill.Attacker) {
						allianceID = other.allianceID
						allianceName = other.allianceName
						characterID = other.characterID
						characterName = other.characterName
						corporationID = other.corporationID
						corporationName = other.corporationName
						damageDone = other.damageDone
						factionID = other.factionID
						factionName = other.factionName
						finalBlow = other.finalBlow
						securityStatus = other.securityStatus
						shipTypeID = other.shipTypeID
						weaponTypeID = other.weaponTypeID
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return EVE.Char.KillMails.Kill.Attacker(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? EVE.Char.KillMails.Kill.Attacker)?.hashValue == hashValue
					}
					
				}
				
				public class Item: NSObject, Codable, NSCopying, JSONCoding {
					
					
					public var flag: Int = Int()
					public var qtyDestroyed: Int = Int()
					public var qtyDropped: Int = Int()
					public var singleton: Bool = Bool()
					public var typeID: Int = Int()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						guard let flag = dictionary["flag"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.flag = flag
						guard let qtyDestroyed = dictionary["qtyDestroyed"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.qtyDestroyed = qtyDestroyed
						guard let qtyDropped = dictionary["qtyDropped"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.qtyDropped = qtyDropped
						guard let singleton = dictionary["singleton"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.singleton = singleton
						guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.typeID = typeID
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					/*
					public required init?(coder aDecoder: NSCoder) {
						{decodings}
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						{encodings}
					}
					*/
					public var json: Any {
						var json = [String: Any]()
						json["flag"] = flag.json
						json["qtyDestroyed"] = qtyDestroyed.json
						json["qtyDropped"] = qtyDropped.json
						json["singleton"] = singleton.json
						json["typeID"] = typeID.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.flag.hashValue)
						hashCombine(seed: &hash, value: self.qtyDestroyed.hashValue)
						hashCombine(seed: &hash, value: self.qtyDropped.hashValue)
						hashCombine(seed: &hash, value: self.singleton.hashValue)
						hashCombine(seed: &hash, value: self.typeID.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: EVE.Char.KillMails.Kill.Item, rhs: EVE.Char.KillMails.Kill.Item) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: EVE.Char.KillMails.Kill.Item) {
						flag = other.flag
						qtyDestroyed = other.qtyDestroyed
						qtyDropped = other.qtyDropped
						singleton = other.singleton
						typeID = other.typeID
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return EVE.Char.KillMails.Kill.Item(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? EVE.Char.KillMails.Kill.Item)?.hashValue == hashValue
					}
					
				}
				
				public class Victim: NSObject, Codable, NSCopying, JSONCoding {
					
					
					public var allianceID: Int64? = nil
					public var allianceName: String? = nil
					public var characterID: Int64 = Int64()
					public var characterName: String = String()
					public var corporationID: Int64 = Int64()
					public var corporationName: String = String()
					public var damageTaken: Int64 = Int64()
					public var factionID: Int? = nil
					public var factionName: String? = nil
					public var shipTypeID: Int = Int()
					public var x: Double = Double()
					public var y: Double = Double()
					public var z: Double = Double()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
						
						allianceID = dictionary["allianceID"] as? Int64
						allianceName = dictionary["allianceName"] as? String
						guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.characterID = characterID
						guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.characterName = characterName
						guard let corporationID = dictionary["corporationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.corporationID = corporationID
						guard let corporationName = dictionary["corporationName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.corporationName = corporationName
						guard let damageTaken = dictionary["damageTaken"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.damageTaken = damageTaken
						factionID = dictionary["factionID"] as? Int
						factionName = dictionary["factionName"] as? String
						guard let shipTypeID = dictionary["shipTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.shipTypeID = shipTypeID
						guard let x = dictionary["x"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.x = x
						guard let y = dictionary["y"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.y = y
						guard let z = dictionary["z"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
						self.z = z
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					/*
					public required init?(coder aDecoder: NSCoder) {
						{decodings}
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						{encodings}
					}
					*/
					public var json: Any {
						var json = [String: Any]()
						if let v = allianceID?.json {
							json["allianceID"] = v
						}
						if let v = allianceName?.json {
							json["allianceName"] = v
						}
						json["characterID"] = characterID.json
						json["characterName"] = characterName.json
						json["corporationID"] = corporationID.json
						json["corporationName"] = corporationName.json
						json["damageTaken"] = damageTaken.json
						if let v = factionID?.json {
							json["factionID"] = v
						}
						if let v = factionName?.json {
							json["factionName"] = v
						}
						json["shipTypeID"] = shipTypeID.json
						json["x"] = x.json
						json["y"] = y.json
						json["z"] = z.json
						return json
					}
					
					private lazy var _hashValue: Int = {
						var hash: Int = 0
						hashCombine(seed: &hash, value: self.allianceID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.allianceName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.characterID.hashValue)
						hashCombine(seed: &hash, value: self.characterName.hashValue)
						hashCombine(seed: &hash, value: self.corporationID.hashValue)
						hashCombine(seed: &hash, value: self.corporationName.hashValue)
						hashCombine(seed: &hash, value: self.damageTaken.hashValue)
						hashCombine(seed: &hash, value: self.factionID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.factionName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: self.shipTypeID.hashValue)
						hashCombine(seed: &hash, value: self.x.hashValue)
						hashCombine(seed: &hash, value: self.y.hashValue)
						hashCombine(seed: &hash, value: self.z.hashValue)
						return hash
					}()
					
					override public var hashValue: Int {
						return _hashValue
					}
					
					public static func ==(lhs: EVE.Char.KillMails.Kill.Victim, rhs: EVE.Char.KillMails.Kill.Victim) -> Bool {
						return lhs.hashValue == rhs.hashValue
					}
					
					init(_ other: EVE.Char.KillMails.Kill.Victim) {
						allianceID = other.allianceID
						allianceName = other.allianceName
						characterID = other.characterID
						characterName = other.characterName
						corporationID = other.corporationID
						corporationName = other.corporationName
						damageTaken = other.damageTaken
						factionID = other.factionID
						factionName = other.factionName
						shipTypeID = other.shipTypeID
						x = other.x
						y = other.y
						z = other.z
					}
					
					public func copy(with zone: NSZone? = nil) -> Any {
						return EVE.Char.KillMails.Kill.Victim(self)
					}
					
					
					public override func isEqual(_ object: Any?) -> Bool {
						return (object as? EVE.Char.KillMails.Kill.Victim)?.hashValue == hashValue
					}
					
				}
				
				public var attackers: [EVE.Char.KillMails.Kill.Attacker] = []
				public var items: [EVE.Char.KillMails.Kill.Item] = []
				public var killID: Int64 = Int64()
				public var killTime: Date = Date()
				public var moonID: Int = Int()
				public var solarSystemID: Int = Int()
				public var victim: EVE.Char.KillMails.Kill.Victim = EVE.Char.KillMails.Kill.Victim()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let attackers = try dictionary.rowset(name: "attackers")?.map ({try EVE.Char.KillMails.Kill.Attacker(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.attackers = attackers
					guard let items = try dictionary.rowset(name: "items")?.map ({try EVE.Char.KillMails.Kill.Item(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.items = items
					guard let killID = dictionary["killID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.killID = killID
					guard let killTime = DateFormatter.eveDateFormatter.date(from: dictionary["killTime"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.killTime = killTime
					guard let moonID = dictionary["moonID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.moonID = moonID
					guard let solarSystemID = dictionary["solarSystemID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.solarSystemID = solarSystemID
					victim = try EVE.Char.KillMails.Kill.Victim(json: dictionary["victim"] as? [String: Any] ?? [:])
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["attackers"] = attackers.json
					json["items"] = items.json
					json["killID"] = killID.json
					json["killTime"] = killTime.json
					json["moonID"] = moonID.json
					json["solarSystemID"] = solarSystemID.json
					json["victim"] = victim.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					self.attackers.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					self.items.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: self.killID.hashValue)
					hashCombine(seed: &hash, value: self.killTime.hashValue)
					hashCombine(seed: &hash, value: self.moonID.hashValue)
					hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
					hashCombine(seed: &hash, value: self.victim.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.KillMails.Kill, rhs: EVE.Char.KillMails.Kill) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.KillMails.Kill) {
					attackers = other.attackers.flatMap { EVE.Char.KillMails.Kill.Attacker($0) }
					items = other.items.flatMap { EVE.Char.KillMails.Kill.Item($0) }
					killID = other.killID
					killTime = other.killTime
					moonID = other.moonID
					solarSystemID = other.solarSystemID
					victim = EVE.Char.KillMails.Kill.Victim(other.victim)
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.KillMails.Kill(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.KillMails.Kill)?.hashValue == hashValue
				}
				
			}
			
			public var kills: [EVE.Char.KillMails.Kill] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let kills = try dictionary.rowset(name: "kills")?.map ({try EVE.Char.KillMails.Kill(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.kills = kills
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["kills"] = kills.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.kills.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.KillMails, rhs: EVE.Char.KillMails) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.KillMails) {
				kills = other.kills.flatMap { EVE.Char.KillMails.Kill($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.KillMails(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.KillMails)?.hashValue == hashValue
			}
			
		}
		
		
		public class Locations: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Location: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var itemID: Int64 = Int64()
				public var itemName: String = String()
				public var x: Double = Double()
				public var y: Double = Double()
				public var z: Double = Double()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.itemID = itemID
					guard let itemName = dictionary["itemName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.itemName = itemName
					guard let x = dictionary["x"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["itemID"] = itemID.json
					json["itemName"] = itemName.json
					json["x"] = x.json
					json["y"] = y.json
					json["z"] = z.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.itemID.hashValue)
					hashCombine(seed: &hash, value: self.itemName.hashValue)
					hashCombine(seed: &hash, value: self.x.hashValue)
					hashCombine(seed: &hash, value: self.y.hashValue)
					hashCombine(seed: &hash, value: self.z.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Locations.Location, rhs: EVE.Char.Locations.Location) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Locations.Location) {
					itemID = other.itemID
					itemName = other.itemName
					x = other.x
					y = other.y
					z = other.z
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Locations.Location(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Locations.Location)?.hashValue == hashValue
				}
				
			}
			
			public var locations: [EVE.Char.Locations.Location] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let locations = try dictionary.rowset(name: "locations")?.map ({try EVE.Char.Locations.Location(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.locations = locations
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["locations"] = locations.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.locations.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Locations, rhs: EVE.Char.Locations) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Locations) {
				locations = other.locations.flatMap { EVE.Char.Locations.Location($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Locations(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Locations)?.hashValue == hashValue
			}
			
		}
		
		
		public class MailBodies: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Message: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var messageID: Int64 = Int64()
				public var text: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let messageID = dictionary["messageID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.messageID = messageID
					guard let text = dictionary["_"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.text = text
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["messageID"] = messageID.json
					json["text"] = text.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.messageID.hashValue)
					hashCombine(seed: &hash, value: self.text.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.MailBodies.Message, rhs: EVE.Char.MailBodies.Message) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.MailBodies.Message) {
					messageID = other.messageID
					text = other.text
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.MailBodies.Message(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.MailBodies.Message)?.hashValue == hashValue
				}
				
			}
			
			public var messages: [EVE.Char.MailBodies.Message] = []
			public var missingMessageIDs: String = String()
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let messages = try dictionary.rowset(name: "messages")?.map ({try EVE.Char.MailBodies.Message(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.messages = messages
				guard let missingMessageIDs = dictionary["missingMessageIDs"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.missingMessageIDs = missingMessageIDs
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["messages"] = messages.json
				json["missingMessageIDs"] = missingMessageIDs.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.messages.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: self.missingMessageIDs.hashValue)
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.MailBodies, rhs: EVE.Char.MailBodies) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.MailBodies) {
				messages = other.messages.flatMap { EVE.Char.MailBodies.Message($0) }
				missingMessageIDs = other.missingMessageIDs
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.MailBodies(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.MailBodies)?.hashValue == hashValue
			}
			
		}
		
		
		public class MailingLists: NSObject, Codable, NSCopying, JSONCoding {
			
			public class MailingList: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var displayName: String = String()
				public var listID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let displayName = dictionary["displayName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.displayName = displayName
					guard let listID = dictionary["listID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.listID = listID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["displayName"] = displayName.json
					json["listID"] = listID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.displayName.hashValue)
					hashCombine(seed: &hash, value: self.listID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.MailingLists.MailingList, rhs: EVE.Char.MailingLists.MailingList) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.MailingLists.MailingList) {
					displayName = other.displayName
					listID = other.listID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.MailingLists.MailingList(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.MailingLists.MailingList)?.hashValue == hashValue
				}
				
			}
			
			public var mailingLists: [EVE.Char.MailingLists.MailingList] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let mailingLists = try dictionary.rowset(name: "mailingLists")?.map ({try EVE.Char.MailingLists.MailingList(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.mailingLists = mailingLists
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["mailingLists"] = mailingLists.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.mailingLists.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.MailingLists, rhs: EVE.Char.MailingLists) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.MailingLists) {
				mailingLists = other.mailingLists.flatMap { EVE.Char.MailingLists.MailingList($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.MailingLists(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.MailingLists)?.hashValue == hashValue
			}
			
		}
		
		
		public class MarketOrders: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Order: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum State: Int, JSONCoding, Codable {
					case cancelled = 3
					case closed = 1
					case deleted = 5
					case expired = 2
					case open = 0
					case pending = 4
					
					public init() {
						self = .cancelled
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? Int, let v = State(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var accountKey: Int = Int()
				public var bid: Bool = Bool()
				public var characterID: Int64 = Int64()
				public var duration: Int = Int()
				public var escrow: Double = Double()
				public var issued: Date = Date()
				public var minVolume: Int64 = Int64()
				public var orderID: Int64 = Int64()
				public var orderState: EVE.Char.MarketOrders.Order.State = EVE.Char.MarketOrders.Order.State()
				public var price: Double = Double()
				public var range: Int = Int()
				public var stationID: Int = Int()
				public var typeID: Int = Int()
				public var volEntered: Int64 = Int64()
				public var volRemaining: Int64 = Int64()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let accountKey = dictionary["accountKey"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.accountKey = accountKey
					guard let bid = dictionary["bid"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.bid = bid
					guard let characterID = dictionary["charID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.characterID = characterID
					guard let duration = dictionary["duration"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.duration = duration
					guard let escrow = dictionary["escrow"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.escrow = escrow
					guard let issued = DateFormatter.eveDateFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.issued = issued
					guard let minVolume = dictionary["minVolume"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.minVolume = minVolume
					guard let orderID = dictionary["orderID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.orderID = orderID
					guard let orderState = EVE.Char.MarketOrders.Order.State(rawValue: dictionary["orderState"] as? Int ?? Int()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.orderState = orderState
					guard let price = dictionary["price"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.price = price
					guard let range = dictionary["range"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.range = range
					guard let stationID = dictionary["stationID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.stationID = stationID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let volEntered = dictionary["volEntered"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.volEntered = volEntered
					guard let volRemaining = dictionary["volRemaining"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.volRemaining = volRemaining
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["accountKey"] = accountKey.json
					json["bid"] = bid.json
					json["characterID"] = characterID.json
					json["duration"] = duration.json
					json["escrow"] = escrow.json
					json["issued"] = issued.json
					json["minVolume"] = minVolume.json
					json["orderID"] = orderID.json
					json["orderState"] = orderState.json
					json["price"] = price.json
					json["range"] = range.json
					json["stationID"] = stationID.json
					json["typeID"] = typeID.json
					json["volEntered"] = volEntered.json
					json["volRemaining"] = volRemaining.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.accountKey.hashValue)
					hashCombine(seed: &hash, value: self.bid.hashValue)
					hashCombine(seed: &hash, value: self.characterID.hashValue)
					hashCombine(seed: &hash, value: self.duration.hashValue)
					hashCombine(seed: &hash, value: self.escrow.hashValue)
					hashCombine(seed: &hash, value: self.issued.hashValue)
					hashCombine(seed: &hash, value: self.minVolume.hashValue)
					hashCombine(seed: &hash, value: self.orderID.hashValue)
					hashCombine(seed: &hash, value: self.orderState.hashValue)
					hashCombine(seed: &hash, value: self.price.hashValue)
					hashCombine(seed: &hash, value: self.range.hashValue)
					hashCombine(seed: &hash, value: self.stationID.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.volEntered.hashValue)
					hashCombine(seed: &hash, value: self.volRemaining.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.MarketOrders.Order, rhs: EVE.Char.MarketOrders.Order) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.MarketOrders.Order) {
					accountKey = other.accountKey
					bid = other.bid
					characterID = other.characterID
					duration = other.duration
					escrow = other.escrow
					issued = other.issued
					minVolume = other.minVolume
					orderID = other.orderID
					orderState = other.orderState
					price = other.price
					range = other.range
					stationID = other.stationID
					typeID = other.typeID
					volEntered = other.volEntered
					volRemaining = other.volRemaining
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.MarketOrders.Order(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.MarketOrders.Order)?.hashValue == hashValue
				}
				
			}
			
			public var orders: [EVE.Char.MarketOrders.Order] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let orders = try dictionary.rowset(name: "orders")?.map ({try EVE.Char.MarketOrders.Order(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.orders = orders
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["orders"] = orders.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.orders.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.MarketOrders, rhs: EVE.Char.MarketOrders) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.MarketOrders) {
				orders = other.orders.flatMap { EVE.Char.MarketOrders.Order($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.MarketOrders(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.MarketOrders)?.hashValue == hashValue
			}
			
		}
		
		
		public class Medals: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Medal: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum Status: String, JSONCoding, Codable {
					case `private` = "private"
					case `public` = "public"
					
					public init() {
						self = .`private`
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = Status(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var corporationID: Int64? = nil
				public var issued: Date = Date()
				public var issuerID: Int64 = Int64()
				public var medalDescription: String? = nil
				public var medalID: Int = Int()
				public var reason: String = String()
				public var status: EVE.Char.Medals.Medal.Status = EVE.Char.Medals.Medal.Status()
				public var title: String? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					corporationID = dictionary["corporationID"] as? Int64
					guard let issued = DateFormatter.eveDateFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.issued = issued
					guard let issuerID = dictionary["issuerID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.issuerID = issuerID
					medalDescription = dictionary["description"] as? String
					guard let medalID = dictionary["medalID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.medalID = medalID
					guard let reason = dictionary["reason"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.reason = reason
					guard let status = EVE.Char.Medals.Medal.Status(rawValue: dictionary["status"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.status = status
					title = dictionary["title"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					if let v = corporationID?.json {
						json["corporationID"] = v
					}
					json["issued"] = issued.json
					json["issuerID"] = issuerID.json
					if let v = medalDescription?.json {
						json["medalDescription"] = v
					}
					json["medalID"] = medalID.json
					json["reason"] = reason.json
					json["status"] = status.json
					if let v = title?.json {
						json["title"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.issued.hashValue)
					hashCombine(seed: &hash, value: self.issuerID.hashValue)
					hashCombine(seed: &hash, value: self.medalDescription?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.medalID.hashValue)
					hashCombine(seed: &hash, value: self.reason.hashValue)
					hashCombine(seed: &hash, value: self.status.hashValue)
					hashCombine(seed: &hash, value: self.title?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Medals.Medal, rhs: EVE.Char.Medals.Medal) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Medals.Medal) {
					corporationID = other.corporationID
					issued = other.issued
					issuerID = other.issuerID
					medalDescription = other.medalDescription
					medalID = other.medalID
					reason = other.reason
					status = other.status
					title = other.title
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Medals.Medal(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Medals.Medal)?.hashValue == hashValue
				}
				
			}
			
			public var currentCorporation: [EVE.Char.Medals.Medal] = []
			public var otherCorporations: [EVE.Char.Medals.Medal] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let currentCorporation = try dictionary.rowset(name: "currentCorporation")?.map ({try EVE.Char.Medals.Medal(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.currentCorporation = currentCorporation
				guard let otherCorporations = try dictionary.rowset(name: "otherCorporations")?.map ({try EVE.Char.Medals.Medal(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.otherCorporations = otherCorporations
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["currentCorporation"] = currentCorporation.json
				json["otherCorporations"] = otherCorporations.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.currentCorporation.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.otherCorporations.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Medals, rhs: EVE.Char.Medals) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Medals) {
				currentCorporation = other.currentCorporation.flatMap { EVE.Char.Medals.Medal($0) }
				otherCorporations = other.otherCorporations.flatMap { EVE.Char.Medals.Medal($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Medals(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Medals)?.hashValue == hashValue
			}
			
		}
		
		
		public class Messages: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Message: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var messageID: Int64 = Int64()
				public var senderID: Int64 = Int64()
				public var senderName: String = String()
				public var sentDate: Date = Date()
				public var title: String = String()
				public var toCharacterIDs: String? = nil
				public var toCorpOrAllianceID: Int? = nil
				public var toListID: String? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let messageID = dictionary["messageID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.messageID = messageID
					guard let senderID = dictionary["senderID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.senderID = senderID
					guard let senderName = dictionary["senderName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.senderName = senderName
					guard let sentDate = DateFormatter.eveDateFormatter.date(from: dictionary["sentDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.sentDate = sentDate
					guard let title = dictionary["title"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.title = title
					toCharacterIDs = dictionary["toCharacterIDs"] as? String
					toCorpOrAllianceID = dictionary["toCorpOrAllianceID"] as? Int
					toListID = dictionary["toListID"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["messageID"] = messageID.json
					json["senderID"] = senderID.json
					json["senderName"] = senderName.json
					json["sentDate"] = sentDate.json
					json["title"] = title.json
					if let v = toCharacterIDs?.json {
						json["toCharacterIDs"] = v
					}
					if let v = toCorpOrAllianceID?.json {
						json["toCorpOrAllianceID"] = v
					}
					if let v = toListID?.json {
						json["toListID"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.messageID.hashValue)
					hashCombine(seed: &hash, value: self.senderID.hashValue)
					hashCombine(seed: &hash, value: self.senderName.hashValue)
					hashCombine(seed: &hash, value: self.sentDate.hashValue)
					hashCombine(seed: &hash, value: self.title.hashValue)
					hashCombine(seed: &hash, value: self.toCharacterIDs?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.toCorpOrAllianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.toListID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Messages.Message, rhs: EVE.Char.Messages.Message) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Messages.Message) {
					messageID = other.messageID
					senderID = other.senderID
					senderName = other.senderName
					sentDate = other.sentDate
					title = other.title
					toCharacterIDs = other.toCharacterIDs
					toCorpOrAllianceID = other.toCorpOrAllianceID
					toListID = other.toListID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Messages.Message(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Messages.Message)?.hashValue == hashValue
				}
				
			}
			
			public var messages: [EVE.Char.Messages.Message] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let messages = try dictionary.rowset(name: "messages")?.map ({try EVE.Char.Messages.Message(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.messages = messages
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["messages"] = messages.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.messages.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Messages, rhs: EVE.Char.Messages) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Messages) {
				messages = other.messages.flatMap { EVE.Char.Messages.Message($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Messages(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Messages)?.hashValue == hashValue
			}
			
		}
		
		
		public class NotificationTexts: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Notification: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var notificationID: Int64 = Int64()
				public var text: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let notificationID = dictionary["notificationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.notificationID = notificationID
					guard let text = dictionary["_"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.text = text
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["notificationID"] = notificationID.json
					json["text"] = text.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.notificationID.hashValue)
					hashCombine(seed: &hash, value: self.text.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.NotificationTexts.Notification, rhs: EVE.Char.NotificationTexts.Notification) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.NotificationTexts.Notification) {
					notificationID = other.notificationID
					text = other.text
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.NotificationTexts.Notification(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.NotificationTexts.Notification)?.hashValue == hashValue
				}
				
			}
			
			public var missindIDs: String? = nil
			public var notifications: [EVE.Char.NotificationTexts.Notification] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				missindIDs = dictionary["missindIDs"] as? String
				guard let notifications = try dictionary.rowset(name: "notifications")?.map ({try EVE.Char.NotificationTexts.Notification(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.notifications = notifications
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				if let v = missindIDs?.json {
					json["missindIDs"] = v
				}
				json["notifications"] = notifications.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				hashCombine(seed: &hash, value: self.missindIDs?.hashValue ?? 0)
				self.notifications.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.NotificationTexts, rhs: EVE.Char.NotificationTexts) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.NotificationTexts) {
				missindIDs = other.missindIDs
				notifications = other.notifications.flatMap { EVE.Char.NotificationTexts.Notification($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.NotificationTexts(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.NotificationTexts)?.hashValue == hashValue
			}
			
		}
		
		
		public class Notifications: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Notification: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum NotificationType: Int, JSONCoding, Codable {
					case allianceWarDeclared = 5
					case allianceWarInvalidatedByConcord = 8
					case allianceWarRetracted = 7
					case allianceWarSurrender = 6
					case corpDeclaresWar = 27
					case corpRetractsWar = 30
					case corpSurrendersWar = 29
					case corpWarHasStarted = 28
					case corpWarInvalidatedByConcord = 31
					
					public init() {
						self = .allianceWarDeclared
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? Int, let v = NotificationType(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var notificationID: Int64 = Int64()
				public var read: Bool = Bool()
				public var senderID: Int64 = Int64()
				public var senderName: String = String()
				public var sentDate: Date = Date()
				public var type: EVE.Char.Notifications.Notification.NotificationType = EVE.Char.Notifications.Notification.NotificationType()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let notificationID = dictionary["notificationID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.notificationID = notificationID
					guard let read = dictionary["read"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.read = read
					guard let senderID = dictionary["senderID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.senderID = senderID
					guard let senderName = dictionary["senderName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.senderName = senderName
					guard let sentDate = DateFormatter.eveDateFormatter.date(from: dictionary["sentDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.sentDate = sentDate
					guard let type = EVE.Char.Notifications.Notification.NotificationType(rawValue: dictionary["typeID"] as? Int ?? Int()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.type = type
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["notificationID"] = notificationID.json
					json["read"] = read.json
					json["senderID"] = senderID.json
					json["senderName"] = senderName.json
					json["sentDate"] = sentDate.json
					json["type"] = type.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.notificationID.hashValue)
					hashCombine(seed: &hash, value: self.read.hashValue)
					hashCombine(seed: &hash, value: self.senderID.hashValue)
					hashCombine(seed: &hash, value: self.senderName.hashValue)
					hashCombine(seed: &hash, value: self.sentDate.hashValue)
					hashCombine(seed: &hash, value: self.type.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Notifications.Notification, rhs: EVE.Char.Notifications.Notification) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Notifications.Notification) {
					notificationID = other.notificationID
					read = other.read
					senderID = other.senderID
					senderName = other.senderName
					sentDate = other.sentDate
					type = other.type
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Notifications.Notification(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Notifications.Notification)?.hashValue == hashValue
				}
				
			}
			
			public var notifications: [EVE.Char.Notifications.Notification] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let notifications = try dictionary.rowset(name: "notifications")?.map ({try EVE.Char.Notifications.Notification(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.notifications = notifications
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["notifications"] = notifications.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.notifications.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Notifications, rhs: EVE.Char.Notifications) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Notifications) {
				notifications = other.notifications.flatMap { EVE.Char.Notifications.Notification($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Notifications(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Notifications)?.hashValue == hashValue
			}
			
		}
		
		
		public class PlanetaryColonies: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Colony: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var lastUpdate: Date = Date()
				public var numberOfPins: Int = Int()
				public var ownerID: Int64 = Int64()
				public var ownerName: String = String()
				public var planetID: Int = Int()
				public var planetName: String = String()
				public var planetTypeID: Int = Int()
				public var planetTypeName: String = String()
				public var solarSystemID: Int = Int()
				public var solarSystemName: String = String()
				public var upgradeLevel: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let lastUpdate = DateFormatter.eveDateFormatter.date(from: dictionary["lastUpdate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.lastUpdate = lastUpdate
					guard let numberOfPins = dictionary["numberOfPins"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.numberOfPins = numberOfPins
					guard let ownerID = dictionary["ownerID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.ownerID = ownerID
					guard let ownerName = dictionary["ownerName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.ownerName = ownerName
					guard let planetID = dictionary["planetID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.planetID = planetID
					guard let planetName = dictionary["planetName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.planetName = planetName
					guard let planetTypeID = dictionary["planetTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.planetTypeID = planetTypeID
					guard let planetTypeName = dictionary["planetTypeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.planetTypeName = planetTypeName
					guard let solarSystemID = dictionary["solarSystemID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.solarSystemID = solarSystemID
					guard let solarSystemName = dictionary["solarSystemName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.solarSystemName = solarSystemName
					guard let upgradeLevel = dictionary["upgradeLevel"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.upgradeLevel = upgradeLevel
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["lastUpdate"] = lastUpdate.json
					json["numberOfPins"] = numberOfPins.json
					json["ownerID"] = ownerID.json
					json["ownerName"] = ownerName.json
					json["planetID"] = planetID.json
					json["planetName"] = planetName.json
					json["planetTypeID"] = planetTypeID.json
					json["planetTypeName"] = planetTypeName.json
					json["solarSystemID"] = solarSystemID.json
					json["solarSystemName"] = solarSystemName.json
					json["upgradeLevel"] = upgradeLevel.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.lastUpdate.hashValue)
					hashCombine(seed: &hash, value: self.numberOfPins.hashValue)
					hashCombine(seed: &hash, value: self.ownerID.hashValue)
					hashCombine(seed: &hash, value: self.ownerName.hashValue)
					hashCombine(seed: &hash, value: self.planetID.hashValue)
					hashCombine(seed: &hash, value: self.planetName.hashValue)
					hashCombine(seed: &hash, value: self.planetTypeID.hashValue)
					hashCombine(seed: &hash, value: self.planetTypeName.hashValue)
					hashCombine(seed: &hash, value: self.solarSystemID.hashValue)
					hashCombine(seed: &hash, value: self.solarSystemName.hashValue)
					hashCombine(seed: &hash, value: self.upgradeLevel.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.PlanetaryColonies.Colony, rhs: EVE.Char.PlanetaryColonies.Colony) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.PlanetaryColonies.Colony) {
					lastUpdate = other.lastUpdate
					numberOfPins = other.numberOfPins
					ownerID = other.ownerID
					ownerName = other.ownerName
					planetID = other.planetID
					planetName = other.planetName
					planetTypeID = other.planetTypeID
					planetTypeName = other.planetTypeName
					solarSystemID = other.solarSystemID
					solarSystemName = other.solarSystemName
					upgradeLevel = other.upgradeLevel
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.PlanetaryColonies.Colony(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.PlanetaryColonies.Colony)?.hashValue == hashValue
				}
				
			}
			
			public var colonies: [EVE.Char.PlanetaryColonies.Colony] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let colonies = try dictionary.rowset(name: "colonies")?.map ({try EVE.Char.PlanetaryColonies.Colony(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.colonies = colonies
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["colonies"] = colonies.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.colonies.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.PlanetaryColonies, rhs: EVE.Char.PlanetaryColonies) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.PlanetaryColonies) {
				colonies = other.colonies.flatMap { EVE.Char.PlanetaryColonies.Colony($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.PlanetaryColonies(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.PlanetaryColonies)?.hashValue == hashValue
			}
			
		}
		
		
		public class PlanetaryLinks: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Link: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var destinationPinID: Int64 = Int64()
				public var linkLevel: Int = Int()
				public var sourcePinID: Int64 = Int64()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let destinationPinID = dictionary["destinationPinID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.destinationPinID = destinationPinID
					guard let linkLevel = dictionary["linkLevel"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.linkLevel = linkLevel
					guard let sourcePinID = dictionary["sourcePinID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.sourcePinID = sourcePinID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["destinationPinID"] = destinationPinID.json
					json["linkLevel"] = linkLevel.json
					json["sourcePinID"] = sourcePinID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.destinationPinID.hashValue)
					hashCombine(seed: &hash, value: self.linkLevel.hashValue)
					hashCombine(seed: &hash, value: self.sourcePinID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.PlanetaryLinks.Link, rhs: EVE.Char.PlanetaryLinks.Link) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.PlanetaryLinks.Link) {
					destinationPinID = other.destinationPinID
					linkLevel = other.linkLevel
					sourcePinID = other.sourcePinID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.PlanetaryLinks.Link(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.PlanetaryLinks.Link)?.hashValue == hashValue
				}
				
			}
			
			public var links: [EVE.Char.PlanetaryLinks.Link] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let links = try dictionary.rowset(name: "links")?.map ({try EVE.Char.PlanetaryLinks.Link(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.links = links
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["links"] = links.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.links.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.PlanetaryLinks, rhs: EVE.Char.PlanetaryLinks) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.PlanetaryLinks) {
				links = other.links.flatMap { EVE.Char.PlanetaryLinks.Link($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.PlanetaryLinks(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.PlanetaryLinks)?.hashValue == hashValue
			}
			
		}
		
		
		public class PlanetaryPins: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Pin: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var contentQuantity: Int = Int()
				public var contentTypeID: Int = Int()
				public var contentTypeName: String = String()
				public var cycleTime: Int = Int()
				public var expiryTime: Date? = nil
				public var installTime: Date? = nil
				public var lastLaunchTime: Date? = nil
				public var latitude: Double = Double()
				public var longitude: Double = Double()
				public var pinID: Int64 = Int64()
				public var quantityPerCycle: Int = Int()
				public var schematicID: Int = Int()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let contentQuantity = dictionary["contentQuantity"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contentQuantity = contentQuantity
					guard let contentTypeID = dictionary["contentTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contentTypeID = contentTypeID
					guard let contentTypeName = dictionary["contentTypeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contentTypeName = contentTypeName
					guard let cycleTime = dictionary["cycleTime"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.cycleTime = cycleTime
					expiryTime = DateFormatter.eveDateFormatter.date(from: dictionary["expiryTime"] as? String ?? "")
					installTime = DateFormatter.eveDateFormatter.date(from: dictionary["installTime"] as? String ?? "")
					lastLaunchTime = DateFormatter.eveDateFormatter.date(from: dictionary["lastLaunchTime"] as? String ?? "")
					guard let latitude = dictionary["latitude"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.latitude = latitude
					guard let longitude = dictionary["longitude"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.longitude = longitude
					guard let pinID = dictionary["pinID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.pinID = pinID
					guard let quantityPerCycle = dictionary["quantityPerCycle"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantityPerCycle = quantityPerCycle
					guard let schematicID = dictionary["schematicID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.schematicID = schematicID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["contentQuantity"] = contentQuantity.json
					json["contentTypeID"] = contentTypeID.json
					json["contentTypeName"] = contentTypeName.json
					json["cycleTime"] = cycleTime.json
					if let v = expiryTime?.json {
						json["expiryTime"] = v
					}
					if let v = installTime?.json {
						json["installTime"] = v
					}
					if let v = lastLaunchTime?.json {
						json["lastLaunchTime"] = v
					}
					json["latitude"] = latitude.json
					json["longitude"] = longitude.json
					json["pinID"] = pinID.json
					json["quantityPerCycle"] = quantityPerCycle.json
					json["schematicID"] = schematicID.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.contentQuantity.hashValue)
					hashCombine(seed: &hash, value: self.contentTypeID.hashValue)
					hashCombine(seed: &hash, value: self.contentTypeName.hashValue)
					hashCombine(seed: &hash, value: self.cycleTime.hashValue)
					hashCombine(seed: &hash, value: self.expiryTime?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.installTime?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.lastLaunchTime?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.latitude.hashValue)
					hashCombine(seed: &hash, value: self.longitude.hashValue)
					hashCombine(seed: &hash, value: self.pinID.hashValue)
					hashCombine(seed: &hash, value: self.quantityPerCycle.hashValue)
					hashCombine(seed: &hash, value: self.schematicID.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.typeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.PlanetaryPins.Pin, rhs: EVE.Char.PlanetaryPins.Pin) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.PlanetaryPins.Pin) {
					contentQuantity = other.contentQuantity
					contentTypeID = other.contentTypeID
					contentTypeName = other.contentTypeName
					cycleTime = other.cycleTime
					expiryTime = other.expiryTime
					installTime = other.installTime
					lastLaunchTime = other.lastLaunchTime
					latitude = other.latitude
					longitude = other.longitude
					pinID = other.pinID
					quantityPerCycle = other.quantityPerCycle
					schematicID = other.schematicID
					typeID = other.typeID
					typeName = other.typeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.PlanetaryPins.Pin(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.PlanetaryPins.Pin)?.hashValue == hashValue
				}
				
			}
			
			public var pins: [EVE.Char.PlanetaryPins.Pin] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let pins = try dictionary.rowset(name: "pins")?.map ({try EVE.Char.PlanetaryPins.Pin(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.pins = pins
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["pins"] = pins.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.pins.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.PlanetaryPins, rhs: EVE.Char.PlanetaryPins) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.PlanetaryPins) {
				pins = other.pins.flatMap { EVE.Char.PlanetaryPins.Pin($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.PlanetaryPins(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.PlanetaryPins)?.hashValue == hashValue
			}
			
		}
		
		
		public class PlanetaryRoutes: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Route: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var contentTypeID: Int = Int()
				public var contentTypeName: String = String()
				public var destinationPinID: Int64 = Int64()
				public var quantity: Int = Int()
				public var routeID: Int64 = Int64()
				public var sourcePinID: Int64 = Int64()
				public var waypoint1: Int64 = Int64()
				public var waypoint2: Int64 = Int64()
				public var waypoint3: Int64 = Int64()
				public var waypoint4: Int64 = Int64()
				public var waypoint5: Int64 = Int64()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let contentTypeID = dictionary["contentTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contentTypeID = contentTypeID
					guard let contentTypeName = dictionary["contentTypeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.contentTypeName = contentTypeName
					guard let destinationPinID = dictionary["destinationPinID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.destinationPinID = destinationPinID
					guard let quantity = dictionary["quantity"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantity = quantity
					guard let routeID = dictionary["routeID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.routeID = routeID
					guard let sourcePinID = dictionary["sourcePinID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.sourcePinID = sourcePinID
					guard let waypoint1 = dictionary["waypoint1"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.waypoint1 = waypoint1
					guard let waypoint2 = dictionary["waypoint2"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.waypoint2 = waypoint2
					guard let waypoint3 = dictionary["waypoint3"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.waypoint3 = waypoint3
					guard let waypoint4 = dictionary["waypoint4"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.waypoint4 = waypoint4
					guard let waypoint5 = dictionary["waypoint5"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.waypoint5 = waypoint5
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["contentTypeID"] = contentTypeID.json
					json["contentTypeName"] = contentTypeName.json
					json["destinationPinID"] = destinationPinID.json
					json["quantity"] = quantity.json
					json["routeID"] = routeID.json
					json["sourcePinID"] = sourcePinID.json
					json["waypoint1"] = waypoint1.json
					json["waypoint2"] = waypoint2.json
					json["waypoint3"] = waypoint3.json
					json["waypoint4"] = waypoint4.json
					json["waypoint5"] = waypoint5.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.contentTypeID.hashValue)
					hashCombine(seed: &hash, value: self.contentTypeName.hashValue)
					hashCombine(seed: &hash, value: self.destinationPinID.hashValue)
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.routeID.hashValue)
					hashCombine(seed: &hash, value: self.sourcePinID.hashValue)
					hashCombine(seed: &hash, value: self.waypoint1.hashValue)
					hashCombine(seed: &hash, value: self.waypoint2.hashValue)
					hashCombine(seed: &hash, value: self.waypoint3.hashValue)
					hashCombine(seed: &hash, value: self.waypoint4.hashValue)
					hashCombine(seed: &hash, value: self.waypoint5.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.PlanetaryRoutes.Route, rhs: EVE.Char.PlanetaryRoutes.Route) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.PlanetaryRoutes.Route) {
					contentTypeID = other.contentTypeID
					contentTypeName = other.contentTypeName
					destinationPinID = other.destinationPinID
					quantity = other.quantity
					routeID = other.routeID
					sourcePinID = other.sourcePinID
					waypoint1 = other.waypoint1
					waypoint2 = other.waypoint2
					waypoint3 = other.waypoint3
					waypoint4 = other.waypoint4
					waypoint5 = other.waypoint5
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.PlanetaryRoutes.Route(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.PlanetaryRoutes.Route)?.hashValue == hashValue
				}
				
			}
			
			public var routes: [EVE.Char.PlanetaryRoutes.Route] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let routes = try dictionary.rowset(name: "routes")?.map ({try EVE.Char.PlanetaryRoutes.Route(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.routes = routes
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["routes"] = routes.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.routes.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.PlanetaryRoutes, rhs: EVE.Char.PlanetaryRoutes) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.PlanetaryRoutes) {
				routes = other.routes.flatMap { EVE.Char.PlanetaryRoutes.Route($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.PlanetaryRoutes(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.PlanetaryRoutes)?.hashValue == hashValue
			}
			
		}
		
		
		public class Research: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Research: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var agentID: Int = Int()
				public var pointsPerDay: Float = Float()
				public var remainderPoints: Float = Float()
				public var researchStartDate: Date = Date()
				public var skillTypeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let agentID = dictionary["agentID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.agentID = agentID
					guard let pointsPerDay = dictionary["pointsPerDay"] as? Float else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.pointsPerDay = pointsPerDay
					guard let remainderPoints = dictionary["remainderPoints"] as? Float else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.remainderPoints = remainderPoints
					guard let researchStartDate = DateFormatter.eveDateFormatter.date(from: dictionary["researchStartDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.researchStartDate = researchStartDate
					guard let skillTypeID = dictionary["skillTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.skillTypeID = skillTypeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["agentID"] = agentID.json
					json["pointsPerDay"] = pointsPerDay.json
					json["remainderPoints"] = remainderPoints.json
					json["researchStartDate"] = researchStartDate.json
					json["skillTypeID"] = skillTypeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.agentID.hashValue)
					hashCombine(seed: &hash, value: self.pointsPerDay.hashValue)
					hashCombine(seed: &hash, value: self.remainderPoints.hashValue)
					hashCombine(seed: &hash, value: self.researchStartDate.hashValue)
					hashCombine(seed: &hash, value: self.skillTypeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Research.Research, rhs: EVE.Char.Research.Research) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Research.Research) {
					agentID = other.agentID
					pointsPerDay = other.pointsPerDay
					remainderPoints = other.remainderPoints
					researchStartDate = other.researchStartDate
					skillTypeID = other.skillTypeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Research.Research(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Research.Research)?.hashValue == hashValue
				}
				
			}
			
			public var research: [EVE.Char.Research] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let research = try dictionary.rowset(name: "research")?.map ({try EVE.Char.Research(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.research = research
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["research"] = research.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.research.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Research, rhs: EVE.Char.Research) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Research) {
				research = other.research.flatMap { EVE.Char.Research($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Research(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Research)?.hashValue == hashValue
			}
			
		}
		
		
		public class SkillQueue: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Skill: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var endSP: Int = Int()
				public var endTime: Date = Date()
				public var level: Int = Int()
				public var queuePosition: Int = Int()
				public var startSP: Int = Int()
				public var startTime: Date = Date()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let endSP = dictionary["endSP"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.endSP = endSP
					guard let endTime = DateFormatter.eveDateFormatter.date(from: dictionary["endTime"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.endTime = endTime
					guard let level = dictionary["level"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.level = level
					guard let queuePosition = dictionary["queuePosition"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.queuePosition = queuePosition
					guard let startSP = dictionary["startSP"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.startSP = startSP
					guard let startTime = DateFormatter.eveDateFormatter.date(from: dictionary["startTime"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.startTime = startTime
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["endSP"] = endSP.json
					json["endTime"] = endTime.json
					json["level"] = level.json
					json["queuePosition"] = queuePosition.json
					json["startSP"] = startSP.json
					json["startTime"] = startTime.json
					json["typeID"] = typeID.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.endSP.hashValue)
					hashCombine(seed: &hash, value: self.endTime.hashValue)
					hashCombine(seed: &hash, value: self.level.hashValue)
					hashCombine(seed: &hash, value: self.queuePosition.hashValue)
					hashCombine(seed: &hash, value: self.startSP.hashValue)
					hashCombine(seed: &hash, value: self.startTime.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.SkillQueue.Skill, rhs: EVE.Char.SkillQueue.Skill) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.SkillQueue.Skill) {
					endSP = other.endSP
					endTime = other.endTime
					level = other.level
					queuePosition = other.queuePosition
					startSP = other.startSP
					startTime = other.startTime
					typeID = other.typeID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.SkillQueue.Skill(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.SkillQueue.Skill)?.hashValue == hashValue
				}
				
			}
			
			public var skillQueue: [EVE.Char.SkillQueue.Skill] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let skillQueue = try dictionary.rowset(name: "skillqueue")?.map ({try EVE.Char.SkillQueue.Skill(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.skillQueue = skillQueue
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["skillQueue"] = skillQueue.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.skillQueue.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.SkillQueue, rhs: EVE.Char.SkillQueue) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.SkillQueue) {
				skillQueue = other.skillQueue.flatMap { EVE.Char.SkillQueue.Skill($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.SkillQueue(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.SkillQueue)?.hashValue == hashValue
			}
			
		}
		
		
		public class Skills: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Skill: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var level: Int = Int()
				public var published: Bool = Bool()
				public var skillpoints: Int = Int()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let level = dictionary["level"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.level = level
					guard let published = dictionary["published"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.published = published
					guard let skillpoints = dictionary["skillpoints"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.skillpoints = skillpoints
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["level"] = level.json
					json["published"] = published.json
					json["skillpoints"] = skillpoints.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.level.hashValue)
					hashCombine(seed: &hash, value: self.published.hashValue)
					hashCombine(seed: &hash, value: self.skillpoints.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.typeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Skills.Skill, rhs: EVE.Char.Skills.Skill) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Skills.Skill) {
					level = other.level
					published = other.published
					skillpoints = other.skillpoints
					typeID = other.typeID
					typeName = other.typeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Skills.Skill(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Skills.Skill)?.hashValue == hashValue
				}
				
			}
			
			public var skills: [EVE.Char.Skills.Skill] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let skills = try dictionary.rowset(name: "skills")?.map ({try EVE.Char.Skills.Skill(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.skills = skills
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["skills"] = skills.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.skills.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Skills, rhs: EVE.Char.Skills) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Skills) {
				skills = other.skills.flatMap { EVE.Char.Skills.Skill($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Skills(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Skills)?.hashValue == hashValue
			}
			
		}
		
		
		public class Standings: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Standing: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var fromID: Int64 = Int64()
				public var fromName: String = String()
				public var standing: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let fromID = dictionary["fromID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.fromID = fromID
					guard let fromName = dictionary["fromName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.fromName = fromName
					guard let standing = dictionary["standing"] as? Float else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.standing = standing
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["fromID"] = fromID.json
					json["fromName"] = fromName.json
					json["standing"] = standing.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.fromID.hashValue)
					hashCombine(seed: &hash, value: self.fromName.hashValue)
					hashCombine(seed: &hash, value: self.standing.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.Standings.Standing, rhs: EVE.Char.Standings.Standing) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.Standings.Standing) {
					fromID = other.fromID
					fromName = other.fromName
					standing = other.standing
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.Standings.Standing(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.Standings.Standing)?.hashValue == hashValue
				}
				
			}
			
			public var agents: [EVE.Char.Standings.Standing]? = nil
			public var factions: [EVE.Char.Standings.Standing]? = nil
			public var npcCorporations: [EVE.Char.Standings.Standing]? = nil
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				agents = try dictionary.rowset(name: "agents")?.map {try EVE.Char.Standings.Standing(json: $0)}
				factions = try dictionary.rowset(name: "factions")?.map {try EVE.Char.Standings.Standing(json: $0)}
				npcCorporations = try dictionary.rowset(name: "NPCCorporations")?.map {try EVE.Char.Standings.Standing(json: $0)}
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				if let v = agents?.json {
					json["agents"] = v
				}
				if let v = factions?.json {
					json["factions"] = v
				}
				if let v = npcCorporations?.json {
					json["npcCorporations"] = v
				}
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.agents?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.factions?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				self.npcCorporations?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.Standings, rhs: EVE.Char.Standings) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.Standings) {
				agents = other.agents?.flatMap { EVE.Char.Standings.Standing($0) }
				factions = other.factions?.flatMap { EVE.Char.Standings.Standing($0) }
				npcCorporations = other.npcCorporations?.flatMap { EVE.Char.Standings.Standing($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.Standings(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.Standings)?.hashValue == hashValue
			}
			
		}
		
		
		public class UpcomingCalendarEvents: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Event: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum Response: String, JSONCoding, Codable {
					case accepted = "Accepted"
					case declined = "Declined"
					case tentative = "Tentative"
					case undecided = "Undecided"
					
					public init() {
						self = .accepted
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = Response(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var duration: Int = Int()
				public var eventDate: Date = Date()
				public var eventID: Int64 = Int64()
				public var eventText: String = String()
				public var eventTitle: String = String()
				public var importance: Bool = Bool()
				public var ownerID: Int64 = Int64()
				public var ownerName: String = String()
				public var response: EVE.Char.UpcomingCalendarEvents.Event.Response = EVE.Char.UpcomingCalendarEvents.Event.Response()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let duration = dictionary["duration"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.duration = duration
					guard let eventDate = DateFormatter.eveDateFormatter.date(from: dictionary["eventDate"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.eventDate = eventDate
					guard let eventID = dictionary["eventID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.eventID = eventID
					guard let eventText = dictionary["eventText"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.eventText = eventText
					guard let eventTitle = dictionary["eventTitle"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.eventTitle = eventTitle
					guard let importance = dictionary["importance"] as? Bool else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.importance = importance
					guard let ownerID = dictionary["ownerID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.ownerID = ownerID
					guard let ownerName = dictionary["ownerName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.ownerName = ownerName
					guard let response = EVE.Char.UpcomingCalendarEvents.Event.Response(rawValue: dictionary["response"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.response = response
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["duration"] = duration.json
					json["eventDate"] = eventDate.json
					json["eventID"] = eventID.json
					json["eventText"] = eventText.json
					json["eventTitle"] = eventTitle.json
					json["importance"] = importance.json
					json["ownerID"] = ownerID.json
					json["ownerName"] = ownerName.json
					json["response"] = response.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.duration.hashValue)
					hashCombine(seed: &hash, value: self.eventDate.hashValue)
					hashCombine(seed: &hash, value: self.eventID.hashValue)
					hashCombine(seed: &hash, value: self.eventText.hashValue)
					hashCombine(seed: &hash, value: self.eventTitle.hashValue)
					hashCombine(seed: &hash, value: self.importance.hashValue)
					hashCombine(seed: &hash, value: self.ownerID.hashValue)
					hashCombine(seed: &hash, value: self.ownerName.hashValue)
					hashCombine(seed: &hash, value: self.response.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.UpcomingCalendarEvents.Event, rhs: EVE.Char.UpcomingCalendarEvents.Event) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.UpcomingCalendarEvents.Event) {
					duration = other.duration
					eventDate = other.eventDate
					eventID = other.eventID
					eventText = other.eventText
					eventTitle = other.eventTitle
					importance = other.importance
					ownerID = other.ownerID
					ownerName = other.ownerName
					response = other.response
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.UpcomingCalendarEvents.Event(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.UpcomingCalendarEvents.Event)?.hashValue == hashValue
				}
				
			}
			
			public var upcomingEvents: [EVE.Char.UpcomingCalendarEvents.Event] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let upcomingEvents = try dictionary.rowset(name: "upcomingEvents")?.map ({try EVE.Char.UpcomingCalendarEvents.Event(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.upcomingEvents = upcomingEvents
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["upcomingEvents"] = upcomingEvents.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.upcomingEvents.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.UpcomingCalendarEvents, rhs: EVE.Char.UpcomingCalendarEvents) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.UpcomingCalendarEvents) {
				upcomingEvents = other.upcomingEvents.flatMap { EVE.Char.UpcomingCalendarEvents.Event($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.UpcomingCalendarEvents(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.UpcomingCalendarEvents)?.hashValue == hashValue
			}
			
		}
		
		
		public class WalletJournal: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Transaction: NSObject, Codable, NSCopying, JSONCoding {
				
				
				public var amount: Double = Double()
				public var argID1: Int? = nil
				public var argName1: String? = nil
				public var balance: Double = Double()
				public var date: Date = Date()
				public var owner1TypeID: Int? = nil
				public var owner2TypeID: Int? = nil
				public var ownerID1: Int64? = nil
				public var ownerID2: Int64? = nil
				public var ownerName1: String? = nil
				public var ownerName2: String? = nil
				public var reason: String? = nil
				public var refID: Int64 = Int64()
				public var refTypeID: Int = Int()
				public var taxAmount: Double? = nil
				public var taxReceiverID: Int64? = nil
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let amount = dictionary["amount"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.amount = amount
					argID1 = dictionary["argID1"] as? Int
					argName1 = dictionary["argName1"] as? String
					guard let balance = dictionary["balance"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.balance = balance
					guard let date = DateFormatter.eveDateFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.date = date
					owner1TypeID = dictionary["owner1TypeID"] as? Int
					owner2TypeID = dictionary["owner2TypeID"] as? Int
					ownerID1 = dictionary["ownerID1"] as? Int64
					ownerID2 = dictionary["ownerID2"] as? Int64
					ownerName1 = dictionary["ownerName1"] as? String
					ownerName2 = dictionary["ownerName2"] as? String
					reason = dictionary["reason"] as? String
					guard let refID = dictionary["refID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.refID = refID
					guard let refTypeID = dictionary["refTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.refTypeID = refTypeID
					taxAmount = dictionary["taxAmount"] as? Double
					taxReceiverID = dictionary["taxReceiverID"] as? Int64
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["amount"] = amount.json
					if let v = argID1?.json {
						json["argID1"] = v
					}
					if let v = argName1?.json {
						json["argName1"] = v
					}
					json["balance"] = balance.json
					json["date"] = date.json
					if let v = owner1TypeID?.json {
						json["owner1TypeID"] = v
					}
					if let v = owner2TypeID?.json {
						json["owner2TypeID"] = v
					}
					if let v = ownerID1?.json {
						json["ownerID1"] = v
					}
					if let v = ownerID2?.json {
						json["ownerID2"] = v
					}
					if let v = ownerName1?.json {
						json["ownerName1"] = v
					}
					if let v = ownerName2?.json {
						json["ownerName2"] = v
					}
					if let v = reason?.json {
						json["reason"] = v
					}
					json["refID"] = refID.json
					json["refTypeID"] = refTypeID.json
					if let v = taxAmount?.json {
						json["taxAmount"] = v
					}
					if let v = taxReceiverID?.json {
						json["taxReceiverID"] = v
					}
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.amount.hashValue)
					hashCombine(seed: &hash, value: self.argID1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.argName1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.balance.hashValue)
					hashCombine(seed: &hash, value: self.date.hashValue)
					hashCombine(seed: &hash, value: self.owner1TypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.owner2TypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.ownerID1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.ownerID2?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.ownerName1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.ownerName2?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.reason?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.refID.hashValue)
					hashCombine(seed: &hash, value: self.refTypeID.hashValue)
					hashCombine(seed: &hash, value: self.taxAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: self.taxReceiverID?.hashValue ?? 0)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.WalletJournal.Transaction, rhs: EVE.Char.WalletJournal.Transaction) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.WalletJournal.Transaction) {
					amount = other.amount
					argID1 = other.argID1
					argName1 = other.argName1
					balance = other.balance
					date = other.date
					owner1TypeID = other.owner1TypeID
					owner2TypeID = other.owner2TypeID
					ownerID1 = other.ownerID1
					ownerID2 = other.ownerID2
					ownerName1 = other.ownerName1
					ownerName2 = other.ownerName2
					reason = other.reason
					refID = other.refID
					refTypeID = other.refTypeID
					taxAmount = other.taxAmount
					taxReceiverID = other.taxReceiverID
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.WalletJournal.Transaction(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.WalletJournal.Transaction)?.hashValue == hashValue
				}
				
			}
			
			public var transactions: [EVE.Char.WalletJournal.Transaction] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let transactions = try dictionary.rowset(name: "transactions")?.map ({try EVE.Char.WalletJournal.Transaction(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.transactions = transactions
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["transactions"] = transactions.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.transactions.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.WalletJournal, rhs: EVE.Char.WalletJournal) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.WalletJournal) {
				transactions = other.transactions.flatMap { EVE.Char.WalletJournal.Transaction($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.WalletJournal(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.WalletJournal)?.hashValue == hashValue
			}
			
		}
		
		
		public class WalletTransactions: NSObject, Codable, NSCopying, JSONCoding {
			
			public class Transaction: NSObject, Codable, NSCopying, JSONCoding {
				
				public enum ClientType: String, JSONCoding, Codable {
					case alliance = "alliance"
					case corporation = "corporation"
					case personal = "personal"
					
					public init() {
						self = .alliance
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = ClientType(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public enum TransactionType: String, JSONCoding, Codable {
					case buy = "buy"
					case sell = "sell"
					
					public init() {
						self = .buy
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = TransactionType(rawValue: s) else {throw EVEError.invalidFormat(Swift.type(of: self), json)}
						self = v
					}
					
				}
				
				public var clientID: Int64 = Int64()
				public var clientName: String = String()
				public var clientTypeID: Int = Int()
				public var journalTransactionID: Int64 = Int64()
				public var price: Double = Double()
				public var quantity: Int64 = Int64()
				public var stationID: Int = Int()
				public var stationName: String = String()
				public var transactionDateTime: Date = Date()
				public var transactionFor: EVE.Char.WalletTransactions.Transaction.ClientType = EVE.Char.WalletTransactions.Transaction.ClientType()
				public var transactionID: Int64 = Int64()
				public var transactionType: EVE.Char.WalletTransactions.Transaction.TransactionType = EVE.Char.WalletTransactions.Transaction.TransactionType()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
					
					guard let clientID = dictionary["clientID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.clientID = clientID
					guard let clientName = dictionary["clientName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.clientName = clientName
					guard let clientTypeID = dictionary["clientTypeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.clientTypeID = clientTypeID
					guard let journalTransactionID = dictionary["journalTransactionID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.journalTransactionID = journalTransactionID
					guard let price = dictionary["price"] as? Double else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.price = price
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.quantity = quantity
					guard let stationID = dictionary["stationID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.stationID = stationID
					guard let stationName = dictionary["stationName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.stationName = stationName
					guard let transactionDateTime = DateFormatter.eveDateFormatter.date(from: dictionary["transactionDateTime"] as? String ?? "") else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.transactionDateTime = transactionDateTime
					guard let transactionFor = EVE.Char.WalletTransactions.Transaction.ClientType(rawValue: dictionary["transactionFor"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.transactionFor = transactionFor
					guard let transactionID = dictionary["transactionID"] as? Int64 else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.transactionID = transactionID
					guard let transactionType = EVE.Char.WalletTransactions.Transaction.TransactionType(rawValue: dictionary["transactionType"] as? String ?? String()) else {throw ESIError.invalidFormat(Swift.type(of: self), dictionary)}
					self.transactionType = transactionType
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				/*
				public required init?(coder aDecoder: NSCoder) {
					{decodings}
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					{encodings}
				}
				*/
				public var json: Any {
					var json = [String: Any]()
					json["clientID"] = clientID.json
					json["clientName"] = clientName.json
					json["clientTypeID"] = clientTypeID.json
					json["journalTransactionID"] = journalTransactionID.json
					json["price"] = price.json
					json["quantity"] = quantity.json
					json["stationID"] = stationID.json
					json["stationName"] = stationName.json
					json["transactionDateTime"] = transactionDateTime.json
					json["transactionFor"] = transactionFor.json
					json["transactionID"] = transactionID.json
					json["transactionType"] = transactionType.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				private lazy var _hashValue: Int = {
					var hash: Int = 0
					hashCombine(seed: &hash, value: self.clientID.hashValue)
					hashCombine(seed: &hash, value: self.clientName.hashValue)
					hashCombine(seed: &hash, value: self.clientTypeID.hashValue)
					hashCombine(seed: &hash, value: self.journalTransactionID.hashValue)
					hashCombine(seed: &hash, value: self.price.hashValue)
					hashCombine(seed: &hash, value: self.quantity.hashValue)
					hashCombine(seed: &hash, value: self.stationID.hashValue)
					hashCombine(seed: &hash, value: self.stationName.hashValue)
					hashCombine(seed: &hash, value: self.transactionDateTime.hashValue)
					hashCombine(seed: &hash, value: self.transactionFor.hashValue)
					hashCombine(seed: &hash, value: self.transactionID.hashValue)
					hashCombine(seed: &hash, value: self.transactionType.hashValue)
					hashCombine(seed: &hash, value: self.typeID.hashValue)
					hashCombine(seed: &hash, value: self.typeName.hashValue)
					return hash
				}()
				
				override public var hashValue: Int {
					return _hashValue
				}
				
				public static func ==(lhs: EVE.Char.WalletTransactions.Transaction, rhs: EVE.Char.WalletTransactions.Transaction) -> Bool {
					return lhs.hashValue == rhs.hashValue
				}
				
				init(_ other: EVE.Char.WalletTransactions.Transaction) {
					clientID = other.clientID
					clientName = other.clientName
					clientTypeID = other.clientTypeID
					journalTransactionID = other.journalTransactionID
					price = other.price
					quantity = other.quantity
					stationID = other.stationID
					stationName = other.stationName
					transactionDateTime = other.transactionDateTime
					transactionFor = other.transactionFor
					transactionID = other.transactionID
					transactionType = other.transactionType
					typeID = other.typeID
					typeName = other.typeName
				}
				
				public func copy(with zone: NSZone? = nil) -> Any {
					return EVE.Char.WalletTransactions.Transaction(self)
				}
				
				
				public override func isEqual(_ object: Any?) -> Bool {
					return (object as? EVE.Char.WalletTransactions.Transaction)?.hashValue == hashValue
				}
				
			}
			
			public var transactions: [EVE.Char.WalletTransactions.Transaction] = []
			
			public static var supportsSecureCoding: Bool {
				return true
			}
			
			public required init(json: Any) throws {
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(Swift.type(of: self), json)}
				
				guard let transactions = try dictionary.rowset(name: "transactions")?.map ({try EVE.Char.WalletTransactions.Transaction(json: $0)}) else {throw EVEError.invalidFormat(Swift.type(of: self), dictionary)}
				self.transactions = transactions
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			/*
			public required init?(coder aDecoder: NSCoder) {
				{decodings}
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				{encodings}
			}
			*/
			public var json: Any {
				var json = [String: Any]()
				json["transactions"] = transactions.json
				return json
			}
			
			private lazy var _hashValue: Int = {
				var hash: Int = 0
				self.transactions.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
			}()
			
			override public var hashValue: Int {
				return _hashValue
			}
			
			public static func ==(lhs: EVE.Char.WalletTransactions, rhs: EVE.Char.WalletTransactions) -> Bool {
				return lhs.hashValue == rhs.hashValue
			}
			
			init(_ other: EVE.Char.WalletTransactions) {
				transactions = other.transactions.flatMap { EVE.Char.WalletTransactions.Transaction($0) }
			}
			
			public func copy(with zone: NSZone? = nil) -> Any {
				return EVE.Char.WalletTransactions(self)
			}
			
			
			public override func isEqual(_ object: Any?) -> Bool {
				return (object as? EVE.Char.WalletTransactions)?.hashValue == hashValue
			}
			
		}
		
		
	}
	
}
