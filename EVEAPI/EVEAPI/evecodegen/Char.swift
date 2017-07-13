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
		
		
		public class AccountBalance: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Account: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var accountID: Int = Int()
				public var accountKey: Int = Int()
				public var balance: Double = Double()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let accountID = dictionary["accountID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.accountID = accountID
					guard let accountKey = dictionary["accountKey"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.accountKey = accountKey
					guard let balance = dictionary["balance"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.balance = balance
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					accountID = aDecoder.decodeInteger(forKey: "accountID")
					accountKey = aDecoder.decodeInteger(forKey: "accountKey")
					balance = aDecoder.decodeDouble(forKey: "balance")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(accountID, forKey: "accountID")
					aCoder.encode(accountKey, forKey: "accountKey")
					aCoder.encode(balance, forKey: "balance")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["accountID"] = accountID.json
					json["accountKey"] = accountKey.json
					json["balance"] = balance.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: accountID.hashValue)
					hashCombine(seed: &hash, value: accountKey.hashValue)
					hashCombine(seed: &hash, value: balance.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let accounts = try dictionary.rowset(name: "accounts")?.map ({try EVE.Char.AccountBalance.Account(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.accounts = accounts
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				accounts = aDecoder.decodeObject(of: [EVE.Char.AccountBalance.Account.self], forKey: "accounts") as? [EVE.Char.AccountBalance.Account] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(accounts, forKey: "accounts")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["accounts"] = accounts.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				accounts.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class AssetList: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Asset: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					contents = try dictionary.rowset(name: "contents")?.map {try EVE.Char.AssetList.Asset(json: $0)}
					guard let flag = dictionary["flag"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.flag = flag
					guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.itemID = itemID
					locationID = dictionary["locationID"] as? Int64
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.quantity = quantity
					rawQuantity = dictionary["rawQuantity"] as? Int
					guard let singleton = dictionary["singleton"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.singleton = singleton
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					contents = aDecoder.decodeObject(of: [EVE.Char.AssetList.Asset.self], forKey: "contents") as? [EVE.Char.AssetList.Asset]
					flag = aDecoder.decodeInteger(forKey: "flag")
					itemID = aDecoder.decodeInt64(forKey: "itemID")
					locationID = aDecoder.containsValue(forKey: "locationID") ? aDecoder.decodeInt64(forKey: "locationID") : nil
					quantity = aDecoder.decodeInt64(forKey: "quantity")
					rawQuantity = aDecoder.containsValue(forKey: "rawQuantity") ? aDecoder.decodeInteger(forKey: "rawQuantity") : nil
					singleton = aDecoder.decodeBool(forKey: "singleton")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = contents {
						aCoder.encode(v, forKey: "contents")
					}
					aCoder.encode(flag, forKey: "flag")
					aCoder.encode(itemID, forKey: "itemID")
					if let v = locationID {
						aCoder.encode(v, forKey: "locationID")
					}
					aCoder.encode(quantity, forKey: "quantity")
					if let v = rawQuantity {
						aCoder.encode(v, forKey: "rawQuantity")
					}
					aCoder.encode(singleton, forKey: "singleton")
					aCoder.encode(typeID, forKey: "typeID")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					contents?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: flag.hashValue)
					hashCombine(seed: &hash, value: itemID.hashValue)
					hashCombine(seed: &hash, value: locationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: rawQuantity?.hashValue ?? 0)
					hashCombine(seed: &hash, value: singleton.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let assets = try dictionary.rowset(name: "assets")?.map ({try EVE.Char.AssetList.Asset(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.assets = assets
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				assets = aDecoder.decodeObject(of: [EVE.Char.AssetList.Asset.self], forKey: "assets") as? [EVE.Char.AssetList.Asset] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(assets, forKey: "assets")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["assets"] = assets.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				assets.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Blueprints: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Blueprint: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let flag = dictionary["flag"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.flag = flag
					guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.itemID = itemID
					guard let locationID = dictionary["locationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.locationID = locationID
					guard let materialEfficiency = dictionary["materialEfficiency"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.materialEfficiency = materialEfficiency
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.quantity = quantity
					guard let runs = dictionary["runs"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.runs = runs
					guard let timeEfficiency = dictionary["timeEfficiency"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.timeEfficiency = timeEfficiency
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					flag = aDecoder.decodeInteger(forKey: "flag")
					itemID = aDecoder.decodeInt64(forKey: "itemID")
					locationID = aDecoder.decodeInt64(forKey: "locationID")
					materialEfficiency = aDecoder.decodeInteger(forKey: "materialEfficiency")
					quantity = aDecoder.decodeInt64(forKey: "quantity")
					runs = aDecoder.decodeInteger(forKey: "runs")
					timeEfficiency = aDecoder.decodeInteger(forKey: "timeEfficiency")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					typeName = aDecoder.decodeObject(forKey: "typeName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(flag, forKey: "flag")
					aCoder.encode(itemID, forKey: "itemID")
					aCoder.encode(locationID, forKey: "locationID")
					aCoder.encode(materialEfficiency, forKey: "materialEfficiency")
					aCoder.encode(quantity, forKey: "quantity")
					aCoder.encode(runs, forKey: "runs")
					aCoder.encode(timeEfficiency, forKey: "timeEfficiency")
					aCoder.encode(typeID, forKey: "typeID")
					aCoder.encode(typeName, forKey: "typeName")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: flag.hashValue)
					hashCombine(seed: &hash, value: itemID.hashValue)
					hashCombine(seed: &hash, value: locationID.hashValue)
					hashCombine(seed: &hash, value: materialEfficiency.hashValue)
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: runs.hashValue)
					hashCombine(seed: &hash, value: timeEfficiency.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					hashCombine(seed: &hash, value: typeName.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let blueprints = try dictionary.rowset(name: "blueprints")?.map ({try EVE.Char.Blueprints.Blueprint(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.blueprints = blueprints
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				blueprints = aDecoder.decodeObject(of: [EVE.Char.Blueprints.Blueprint.self], forKey: "blueprints") as? [EVE.Char.Blueprints.Blueprint] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(blueprints, forKey: "blueprints")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["blueprints"] = blueprints.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				blueprints.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Bookmarks: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Folder: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public class Bookmark: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
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
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						guard let bookmarkID = dictionary["bookmarkID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.bookmarkID = bookmarkID
						guard let created = DateFormatter.eveDateFormatter.date(from: dictionary["created"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
						self.created = created
						guard let creatorID = dictionary["creatorID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.creatorID = creatorID
						guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.itemID = itemID
						guard let locationID = dictionary["locationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.locationID = locationID
						guard let memo = dictionary["memo"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.memo = memo
						guard let note = dictionary["note"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.note = note
						guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.typeID = typeID
						guard let x = dictionary["x"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.x = x
						guard let y = dictionary["y"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.y = y
						guard let z = dictionary["z"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.z = z
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public required init?(coder aDecoder: NSCoder) {
						bookmarkID = aDecoder.decodeInteger(forKey: "bookmarkID")
						created = aDecoder.decodeObject(forKey: "created") as? Date ?? Date()
						creatorID = aDecoder.decodeInt64(forKey: "creatorID")
						itemID = aDecoder.decodeInt64(forKey: "itemID")
						locationID = aDecoder.decodeInt64(forKey: "locationID")
						memo = aDecoder.decodeObject(forKey: "memo") as? String ?? String()
						note = aDecoder.decodeObject(forKey: "note") as? String ?? String()
						typeID = aDecoder.decodeInteger(forKey: "typeID")
						x = aDecoder.decodeDouble(forKey: "x")
						y = aDecoder.decodeDouble(forKey: "y")
						z = aDecoder.decodeDouble(forKey: "z")
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						aCoder.encode(bookmarkID, forKey: "bookmarkID")
						aCoder.encode(created, forKey: "created")
						aCoder.encode(creatorID, forKey: "creatorID")
						aCoder.encode(itemID, forKey: "itemID")
						aCoder.encode(locationID, forKey: "locationID")
						aCoder.encode(memo, forKey: "memo")
						aCoder.encode(note, forKey: "note")
						aCoder.encode(typeID, forKey: "typeID")
						aCoder.encode(x, forKey: "x")
						aCoder.encode(y, forKey: "y")
						aCoder.encode(z, forKey: "z")
					}
					
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
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: bookmarkID.hashValue)
						hashCombine(seed: &hash, value: created.hashValue)
						hashCombine(seed: &hash, value: creatorID.hashValue)
						hashCombine(seed: &hash, value: itemID.hashValue)
						hashCombine(seed: &hash, value: locationID.hashValue)
						hashCombine(seed: &hash, value: memo.hashValue)
						hashCombine(seed: &hash, value: note.hashValue)
						hashCombine(seed: &hash, value: typeID.hashValue)
						hashCombine(seed: &hash, value: x.hashValue)
						hashCombine(seed: &hash, value: y.hashValue)
						hashCombine(seed: &hash, value: z.hashValue)
						return hash
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let bookmarks = try dictionary.rowset(name: "bookmarks")?.map ({try EVE.Char.Bookmarks.Folder.Bookmark(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.bookmarks = bookmarks
					guard let folderID = dictionary["folderID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.folderID = folderID
					guard let folderName = dictionary["folderName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.folderName = folderName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					bookmarks = aDecoder.decodeObject(of: [EVE.Char.Bookmarks.Folder.Bookmark.self], forKey: "bookmarks") as? [EVE.Char.Bookmarks.Folder.Bookmark] ?? []
					folderID = aDecoder.decodeInteger(forKey: "folderID")
					folderName = aDecoder.decodeObject(forKey: "folderName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(bookmarks, forKey: "bookmarks")
					aCoder.encode(folderID, forKey: "folderID")
					aCoder.encode(folderName, forKey: "folderName")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["bookmarks"] = bookmarks.json
					json["folderID"] = folderID.json
					json["folderName"] = folderName.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					bookmarks.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: folderID.hashValue)
					hashCombine(seed: &hash, value: folderName.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let folders = try dictionary.rowset(name: "folders")?.map ({try EVE.Char.Bookmarks.Folder(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.folders = folders
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				folders = aDecoder.decodeObject(of: [EVE.Char.Bookmarks.Folder.self], forKey: "folders") as? [EVE.Char.Bookmarks.Folder] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(folders, forKey: "folders")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["folders"] = folders.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				folders.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class CalendarEventAttendees: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Attendee: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum Response: String, JSONCoding {
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
						guard let s = json as? String, let v = Response(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.characterID = characterID
					guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.characterName = characterName
					guard let response = EVE.Char.CalendarEventAttendees.Attendee.Response(rawValue: dictionary["response"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.response = response
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					characterID = aDecoder.decodeInt64(forKey: "characterID")
					characterName = aDecoder.decodeObject(forKey: "characterName") as? String ?? String()
					response = EVE.Char.CalendarEventAttendees.Attendee.Response(rawValue: aDecoder.decodeObject(forKey: "response") as? String ?? String()) ?? EVE.Char.CalendarEventAttendees.Attendee.Response()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(characterID, forKey: "characterID")
					aCoder.encode(characterName, forKey: "characterName")
					aCoder.encode(response.rawValue, forKey: "response")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["characterID"] = characterID.json
					json["characterName"] = characterName.json
					json["response"] = response.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: characterID.hashValue)
					hashCombine(seed: &hash, value: characterName.hashValue)
					hashCombine(seed: &hash, value: response.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let eventAttendees = try dictionary.rowset(name: "eventAttendees")?.map ({try EVE.Char.CalendarEventAttendees.Attendee(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.eventAttendees = eventAttendees
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				eventAttendees = aDecoder.decodeObject(of: [EVE.Char.CalendarEventAttendees.Attendee.self], forKey: "eventAttendees") as? [EVE.Char.CalendarEventAttendees.Attendee] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(eventAttendees, forKey: "eventAttendees")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["eventAttendees"] = eventAttendees.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				eventAttendees.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class CharacterSheet: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Attributes: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var charisma: Int = Int()
				public var intelligence: Int = Int()
				public var memory: Int = Int()
				public var perception: Int = Int()
				public var willpower: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let charisma = dictionary["charisma"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.charisma = charisma
					guard let intelligence = dictionary["intelligence"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.intelligence = intelligence
					guard let memory = dictionary["memory"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.memory = memory
					guard let perception = dictionary["perception"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.perception = perception
					guard let willpower = dictionary["willpower"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.willpower = willpower
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					charisma = aDecoder.decodeInteger(forKey: "charisma")
					intelligence = aDecoder.decodeInteger(forKey: "intelligence")
					memory = aDecoder.decodeInteger(forKey: "memory")
					perception = aDecoder.decodeInteger(forKey: "perception")
					willpower = aDecoder.decodeInteger(forKey: "willpower")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(charisma, forKey: "charisma")
					aCoder.encode(intelligence, forKey: "intelligence")
					aCoder.encode(memory, forKey: "memory")
					aCoder.encode(perception, forKey: "perception")
					aCoder.encode(willpower, forKey: "willpower")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["charisma"] = charisma.json
					json["intelligence"] = intelligence.json
					json["memory"] = memory.json
					json["perception"] = perception.json
					json["willpower"] = willpower.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: charisma.hashValue)
					hashCombine(seed: &hash, value: intelligence.hashValue)
					hashCombine(seed: &hash, value: memory.hashValue)
					hashCombine(seed: &hash, value: perception.hashValue)
					hashCombine(seed: &hash, value: willpower.hashValue)
					return hash
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
			
			public class Certificate: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var certificateID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let certificateID = dictionary["certificateID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.certificateID = certificateID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					certificateID = aDecoder.decodeInteger(forKey: "certificateID")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(certificateID, forKey: "certificateID")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["certificateID"] = certificateID.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: certificateID.hashValue)
					return hash
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
			
			public enum Gender: String, JSONCoding {
				case female = "Female"
				case male = "Male"
				
				public init() {
					self = .female
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Gender(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
					self = v
				}
				
			}
			
			public class Implant: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					typeName = aDecoder.decodeObject(forKey: "typeName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(typeID, forKey: "typeID")
					aCoder.encode(typeName, forKey: "typeName")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: typeID.hashValue)
					hashCombine(seed: &hash, value: typeName.hashValue)
					return hash
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
			
			public class JumpClone: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var cloneName: String = String()
				public var jumpCloneID: Int64 = Int64()
				public var locationID: Int64 = Int64()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let cloneName = dictionary["cloneName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.cloneName = cloneName
					guard let jumpCloneID = dictionary["jumpCloneID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.jumpCloneID = jumpCloneID
					guard let locationID = dictionary["locationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.locationID = locationID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					cloneName = aDecoder.decodeObject(forKey: "cloneName") as? String ?? String()
					jumpCloneID = aDecoder.decodeInt64(forKey: "jumpCloneID")
					locationID = aDecoder.decodeInt64(forKey: "locationID")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(cloneName, forKey: "cloneName")
					aCoder.encode(jumpCloneID, forKey: "jumpCloneID")
					aCoder.encode(locationID, forKey: "locationID")
					aCoder.encode(typeID, forKey: "typeID")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["cloneName"] = cloneName.json
					json["jumpCloneID"] = jumpCloneID.json
					json["locationID"] = locationID.json
					json["typeID"] = typeID.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: cloneName.hashValue)
					hashCombine(seed: &hash, value: jumpCloneID.hashValue)
					hashCombine(seed: &hash, value: locationID.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
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
			
			public class JumpCloneImplant: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var jumpCloneID: Int64 = Int64()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let jumpCloneID = dictionary["jumpCloneID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.jumpCloneID = jumpCloneID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					jumpCloneID = aDecoder.decodeInt64(forKey: "jumpCloneID")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					typeName = aDecoder.decodeObject(forKey: "typeName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(jumpCloneID, forKey: "jumpCloneID")
					aCoder.encode(typeID, forKey: "typeID")
					aCoder.encode(typeName, forKey: "typeName")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["jumpCloneID"] = jumpCloneID.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: jumpCloneID.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					hashCombine(seed: &hash, value: typeName.hashValue)
					return hash
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
			
			public class Role: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var roleID: Int = Int()
				public var roleName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let roleID = dictionary["roleID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.roleID = roleID
					guard let roleName = dictionary["roleName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.roleName = roleName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					roleID = aDecoder.decodeInteger(forKey: "roleID")
					roleName = aDecoder.decodeObject(forKey: "roleName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(roleID, forKey: "roleID")
					aCoder.encode(roleName, forKey: "roleName")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["roleID"] = roleID.json
					json["roleName"] = roleName.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: roleID.hashValue)
					hashCombine(seed: &hash, value: roleName.hashValue)
					return hash
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
			
			public class Skill: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var level: Int = Int()
				public var published: Bool = Bool()
				public var skillpoints: Int = Int()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let level = dictionary["level"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.level = level
					guard let published = dictionary["published"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.published = published
					guard let skillpoints = dictionary["skillpoints"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.skillpoints = skillpoints
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					level = aDecoder.decodeInteger(forKey: "level")
					published = aDecoder.decodeBool(forKey: "published")
					skillpoints = aDecoder.decodeInteger(forKey: "skillpoints")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(level, forKey: "level")
					aCoder.encode(published, forKey: "published")
					aCoder.encode(skillpoints, forKey: "skillpoints")
					aCoder.encode(typeID, forKey: "typeID")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["level"] = level.json
					json["published"] = published.json
					json["skillpoints"] = skillpoints.json
					json["typeID"] = typeID.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: level.hashValue)
					hashCombine(seed: &hash, value: published.hashValue)
					hashCombine(seed: &hash, value: skillpoints.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let allianceID = dictionary["allianceID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.allianceID = allianceID
				allianceName = dictionary["allianceName"] as? String
				guard let ancestry = dictionary["ancestry"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.ancestry = ancestry
				guard let ancestryID = dictionary["ancestryID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.ancestryID = ancestryID
				attributes = try EVE.Char.CharacterSheet.Attributes(json: dictionary["attributes"] as? [String: Any] ?? [:])
				guard let balance = dictionary["balance"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.balance = balance
				guard let bloodLine = dictionary["bloodLine"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.bloodLine = bloodLine
				guard let bloodLineID = dictionary["bloodLineID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.bloodLineID = bloodLineID
				guard let certificates = try dictionary.rowset(name: "certificates")?.map ({try EVE.Char.CharacterSheet.Certificate(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.certificates = certificates
				guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.characterID = characterID
				guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.characterName = characterName
				cloneJumpDate = DateFormatter.eveDateFormatter.date(from: dictionary["cloneJumpDate"] as? String ?? "")
				guard let cloneName = dictionary["cloneName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.cloneName = cloneName
				guard let cloneSkillPoints = dictionary["cloneSkillPoints"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.cloneSkillPoints = cloneSkillPoints
				guard let cloneTypeID = dictionary["cloneTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.cloneTypeID = cloneTypeID
				guard let corporationID = dictionary["corporationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.corporationID = corporationID
				guard let corporationName = dictionary["corporationName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.corporationName = corporationName
				guard let corporationRoles = try dictionary.rowset(name: "corporationRoles")?.map ({try EVE.Char.CharacterSheet.Role(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.corporationRoles = corporationRoles
				guard let corporationRolesAtBase = try dictionary.rowset(name: "corporationRolesAtBase")?.map ({try EVE.Char.CharacterSheet.Role(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.corporationRolesAtBase = corporationRolesAtBase
				guard let corporationRolesAtHQ = try dictionary.rowset(name: "corporationRolesAtHQ")?.map ({try EVE.Char.CharacterSheet.Role(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.corporationRolesAtHQ = corporationRolesAtHQ
				guard let corporationRolesAtOther = try dictionary.rowset(name: "corporationRolesAtOther")?.map ({try EVE.Char.CharacterSheet.Role(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.corporationRolesAtOther = corporationRolesAtOther
				guard let corporationTitles = try dictionary.rowset(name: "corporationTitles")?.map ({try EVE.Char.CharacterSheet.Role(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.corporationTitles = corporationTitles
				guard let dateOfBirth = DateFormatter.eveDateFormatter.date(from: dictionary["DoB"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.dateOfBirth = dateOfBirth
				factionID = dictionary["factionID"] as? Int
				factionName = dictionary["factionName"] as? String
				guard let freeRespecs = dictionary["freeRespecs"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.freeRespecs = freeRespecs
				guard let freeSkillPoints = dictionary["freeSkillPoints"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.freeSkillPoints = freeSkillPoints
				guard let gender = EVE.Char.CharacterSheet.Gender(rawValue: dictionary["gender"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.gender = gender
				guard let homeStationID = dictionary["homeStationID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.homeStationID = homeStationID
				guard let implants = try dictionary.rowset(name: "implants")?.map ({try EVE.Char.CharacterSheet.Implant(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.implants = implants
				jumpActivation = DateFormatter.eveDateFormatter.date(from: dictionary["jumpActivation"] as? String ?? "")
				guard let jumpCloneImplants = try dictionary.rowset(name: "jumpCloneImplants")?.map ({try EVE.Char.CharacterSheet.JumpCloneImplant(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.jumpCloneImplants = jumpCloneImplants
				guard let jumpClones = try dictionary.rowset(name: "jumpClones")?.map ({try EVE.Char.CharacterSheet.JumpClone(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.jumpClones = jumpClones
				jumpFatigue = DateFormatter.eveDateFormatter.date(from: dictionary["jumpFatigue"] as? String ?? "")
				jumpLastUpdate = DateFormatter.eveDateFormatter.date(from: dictionary["jumpLastUpdate"] as? String ?? "")
				lastRespecDate = DateFormatter.eveDateFormatter.date(from: dictionary["lastRespecDate"] as? String ?? "")
				lastTimedRespec = DateFormatter.eveDateFormatter.date(from: dictionary["lastTimedRespec"] as? String ?? "")
				guard let race = dictionary["race"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.race = race
				remoteStationDate = DateFormatter.eveDateFormatter.date(from: dictionary["remoteStationDate"] as? String ?? "")
				guard let skills = try dictionary.rowset(name: "skills")?.map ({try EVE.Char.CharacterSheet.Skill(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.skills = skills
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceID = aDecoder.decodeInt64(forKey: "allianceID")
				allianceName = aDecoder.decodeObject(forKey: "allianceName") as? String
				ancestry = aDecoder.decodeObject(forKey: "ancestry") as? String ?? String()
				ancestryID = aDecoder.decodeInteger(forKey: "ancestryID")
				attributes = aDecoder.decodeObject(of: EVE.Char.CharacterSheet.Attributes.self, forKey: "attributes")  ?? EVE.Char.CharacterSheet.Attributes()
				balance = aDecoder.decodeDouble(forKey: "balance")
				bloodLine = aDecoder.decodeObject(forKey: "bloodLine") as? String ?? String()
				bloodLineID = aDecoder.decodeInteger(forKey: "bloodLineID")
				certificates = aDecoder.decodeObject(of: [EVE.Char.CharacterSheet.Certificate.self], forKey: "certificates") as? [EVE.Char.CharacterSheet.Certificate] ?? []
				characterID = aDecoder.decodeInt64(forKey: "characterID")
				characterName = aDecoder.decodeObject(forKey: "characterName") as? String ?? String()
				cloneJumpDate = aDecoder.decodeObject(forKey: "cloneJumpDate") as? Date
				cloneName = aDecoder.decodeObject(forKey: "cloneName") as? String ?? String()
				cloneSkillPoints = aDecoder.decodeInt64(forKey: "cloneSkillPoints")
				cloneTypeID = aDecoder.decodeInteger(forKey: "cloneTypeID")
				corporationID = aDecoder.decodeInt64(forKey: "corporationID")
				corporationName = aDecoder.decodeObject(forKey: "corporationName") as? String ?? String()
				corporationRoles = aDecoder.decodeObject(of: [EVE.Char.CharacterSheet.Role.self], forKey: "corporationRoles") as? [EVE.Char.CharacterSheet.Role] ?? []
				corporationRolesAtBase = aDecoder.decodeObject(of: [EVE.Char.CharacterSheet.Role.self], forKey: "corporationRolesAtBase") as? [EVE.Char.CharacterSheet.Role] ?? []
				corporationRolesAtHQ = aDecoder.decodeObject(of: [EVE.Char.CharacterSheet.Role.self], forKey: "corporationRolesAtHQ") as? [EVE.Char.CharacterSheet.Role] ?? []
				corporationRolesAtOther = aDecoder.decodeObject(of: [EVE.Char.CharacterSheet.Role.self], forKey: "corporationRolesAtOther") as? [EVE.Char.CharacterSheet.Role] ?? []
				corporationTitles = aDecoder.decodeObject(of: [EVE.Char.CharacterSheet.Role.self], forKey: "corporationTitles") as? [EVE.Char.CharacterSheet.Role] ?? []
				dateOfBirth = aDecoder.decodeObject(forKey: "DoB") as? Date ?? Date()
				factionID = aDecoder.containsValue(forKey: "factionID") ? aDecoder.decodeInteger(forKey: "factionID") : nil
				factionName = aDecoder.decodeObject(forKey: "factionName") as? String
				freeRespecs = aDecoder.decodeInteger(forKey: "freeRespecs")
				freeSkillPoints = aDecoder.decodeInt64(forKey: "freeSkillPoints")
				gender = EVE.Char.CharacterSheet.Gender(rawValue: aDecoder.decodeObject(forKey: "gender") as? String ?? String()) ?? EVE.Char.CharacterSheet.Gender()
				homeStationID = aDecoder.decodeInteger(forKey: "homeStationID")
				implants = aDecoder.decodeObject(of: [EVE.Char.CharacterSheet.Implant.self], forKey: "implants") as? [EVE.Char.CharacterSheet.Implant] ?? []
				jumpActivation = aDecoder.decodeObject(forKey: "jumpActivation") as? Date
				jumpCloneImplants = aDecoder.decodeObject(of: [EVE.Char.CharacterSheet.JumpCloneImplant.self], forKey: "jumpCloneImplants") as? [EVE.Char.CharacterSheet.JumpCloneImplant] ?? []
				jumpClones = aDecoder.decodeObject(of: [EVE.Char.CharacterSheet.JumpClone.self], forKey: "jumpClones") as? [EVE.Char.CharacterSheet.JumpClone] ?? []
				jumpFatigue = aDecoder.decodeObject(forKey: "jumpFatigue") as? Date
				jumpLastUpdate = aDecoder.decodeObject(forKey: "jumpLastUpdate") as? Date
				lastRespecDate = aDecoder.decodeObject(forKey: "lastRespecDate") as? Date
				lastTimedRespec = aDecoder.decodeObject(forKey: "lastTimedRespec") as? Date
				race = aDecoder.decodeObject(forKey: "race") as? String ?? String()
				remoteStationDate = aDecoder.decodeObject(forKey: "remoteStationDate") as? Date
				skills = aDecoder.decodeObject(of: [EVE.Char.CharacterSheet.Skill.self], forKey: "skills") as? [EVE.Char.CharacterSheet.Skill] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(allianceID, forKey: "allianceID")
				if let v = allianceName {
					aCoder.encode(v, forKey: "allianceName")
				}
				aCoder.encode(ancestry, forKey: "ancestry")
				aCoder.encode(ancestryID, forKey: "ancestryID")
				aCoder.encode(attributes, forKey: "attributes")
				aCoder.encode(balance, forKey: "balance")
				aCoder.encode(bloodLine, forKey: "bloodLine")
				aCoder.encode(bloodLineID, forKey: "bloodLineID")
				aCoder.encode(certificates, forKey: "certificates")
				aCoder.encode(characterID, forKey: "characterID")
				aCoder.encode(characterName, forKey: "characterName")
				if let v = cloneJumpDate {
					aCoder.encode(v, forKey: "cloneJumpDate")
				}
				aCoder.encode(cloneName, forKey: "cloneName")
				aCoder.encode(cloneSkillPoints, forKey: "cloneSkillPoints")
				aCoder.encode(cloneTypeID, forKey: "cloneTypeID")
				aCoder.encode(corporationID, forKey: "corporationID")
				aCoder.encode(corporationName, forKey: "corporationName")
				aCoder.encode(corporationRoles, forKey: "corporationRoles")
				aCoder.encode(corporationRolesAtBase, forKey: "corporationRolesAtBase")
				aCoder.encode(corporationRolesAtHQ, forKey: "corporationRolesAtHQ")
				aCoder.encode(corporationRolesAtOther, forKey: "corporationRolesAtOther")
				aCoder.encode(corporationTitles, forKey: "corporationTitles")
				aCoder.encode(dateOfBirth, forKey: "DoB")
				if let v = factionID {
					aCoder.encode(v, forKey: "factionID")
				}
				if let v = factionName {
					aCoder.encode(v, forKey: "factionName")
				}
				aCoder.encode(freeRespecs, forKey: "freeRespecs")
				aCoder.encode(freeSkillPoints, forKey: "freeSkillPoints")
				aCoder.encode(gender.rawValue, forKey: "gender")
				aCoder.encode(homeStationID, forKey: "homeStationID")
				aCoder.encode(implants, forKey: "implants")
				if let v = jumpActivation {
					aCoder.encode(v, forKey: "jumpActivation")
				}
				aCoder.encode(jumpCloneImplants, forKey: "jumpCloneImplants")
				aCoder.encode(jumpClones, forKey: "jumpClones")
				if let v = jumpFatigue {
					aCoder.encode(v, forKey: "jumpFatigue")
				}
				if let v = jumpLastUpdate {
					aCoder.encode(v, forKey: "jumpLastUpdate")
				}
				if let v = lastRespecDate {
					aCoder.encode(v, forKey: "lastRespecDate")
				}
				if let v = lastTimedRespec {
					aCoder.encode(v, forKey: "lastTimedRespec")
				}
				aCoder.encode(race, forKey: "race")
				if let v = remoteStationDate {
					aCoder.encode(v, forKey: "remoteStationDate")
				}
				aCoder.encode(skills, forKey: "skills")
			}
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: allianceID.hashValue)
				hashCombine(seed: &hash, value: allianceName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: ancestry.hashValue)
				hashCombine(seed: &hash, value: ancestryID.hashValue)
				hashCombine(seed: &hash, value: attributes.hashValue)
				hashCombine(seed: &hash, value: balance.hashValue)
				hashCombine(seed: &hash, value: bloodLine.hashValue)
				hashCombine(seed: &hash, value: bloodLineID.hashValue)
				certificates.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: characterID.hashValue)
				hashCombine(seed: &hash, value: characterName.hashValue)
				hashCombine(seed: &hash, value: cloneJumpDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: cloneName.hashValue)
				hashCombine(seed: &hash, value: cloneSkillPoints.hashValue)
				hashCombine(seed: &hash, value: cloneTypeID.hashValue)
				hashCombine(seed: &hash, value: corporationID.hashValue)
				hashCombine(seed: &hash, value: corporationName.hashValue)
				corporationRoles.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				corporationRolesAtBase.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				corporationRolesAtHQ.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				corporationRolesAtOther.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				corporationTitles.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: dateOfBirth.hashValue)
				hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
				hashCombine(seed: &hash, value: factionName?.hashValue ?? 0)
				hashCombine(seed: &hash, value: freeRespecs.hashValue)
				hashCombine(seed: &hash, value: freeSkillPoints.hashValue)
				hashCombine(seed: &hash, value: gender.hashValue)
				hashCombine(seed: &hash, value: homeStationID.hashValue)
				implants.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: jumpActivation?.hashValue ?? 0)
				jumpCloneImplants.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				jumpClones.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: jumpFatigue?.hashValue ?? 0)
				hashCombine(seed: &hash, value: jumpLastUpdate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: lastRespecDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: lastTimedRespec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: race.hashValue)
				hashCombine(seed: &hash, value: remoteStationDate?.hashValue ?? 0)
				skills.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class ChatChannels: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Channel: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public class Accessor: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
					public var accessorID: Int64 = Int64()
					public var accessorName: String = String()
					public var reason: String? = nil
					public var untilWhen: Date? = nil
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						guard let accessorID = dictionary["accessorID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.accessorID = accessorID
						guard let accessorName = dictionary["accessorName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.accessorName = accessorName
						reason = dictionary["reason"] as? String
						untilWhen = DateFormatter.eveDateFormatter.date(from: dictionary["untilWhen"] as? String ?? "")
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public required init?(coder aDecoder: NSCoder) {
						accessorID = aDecoder.decodeInt64(forKey: "accessorID")
						accessorName = aDecoder.decodeObject(forKey: "accessorName") as? String ?? String()
						reason = aDecoder.decodeObject(forKey: "reason") as? String
						untilWhen = aDecoder.decodeObject(forKey: "untilWhen") as? Date
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						aCoder.encode(accessorID, forKey: "accessorID")
						aCoder.encode(accessorName, forKey: "accessorName")
						if let v = reason {
							aCoder.encode(v, forKey: "reason")
						}
						if let v = untilWhen {
							aCoder.encode(v, forKey: "untilWhen")
						}
					}
					
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
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: accessorID.hashValue)
						hashCombine(seed: &hash, value: accessorName.hashValue)
						hashCombine(seed: &hash, value: reason?.hashValue ?? 0)
						hashCombine(seed: &hash, value: untilWhen?.hashValue ?? 0)
						return hash
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					allowed = try dictionary.rowset(name: "allowed")?.map {try EVE.Char.ChatChannels.Channel.Accessor(json: $0)}
					blocked = try dictionary.rowset(name: "blocked")?.map {try EVE.Char.ChatChannels.Channel.Accessor(json: $0)}
					guard let channelID = dictionary["channelID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.channelID = channelID
					guard let comparisonKey = dictionary["comparisonKey"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.comparisonKey = comparisonKey
					guard let displayName = dictionary["displayName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.displayName = displayName
					guard let hasPassword = dictionary["hasPassword"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.hasPassword = hasPassword
					guard let motd = dictionary["motd"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.motd = motd
					muted = try dictionary.rowset(name: "muted")?.map {try EVE.Char.ChatChannels.Channel.Accessor(json: $0)}
					operators = try dictionary.rowset(name: "operators")?.map {try EVE.Char.ChatChannels.Channel.Accessor(json: $0)}
					guard let ownerID = dictionary["ownerID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.ownerID = ownerID
					guard let ownerName = dictionary["ownerName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.ownerName = ownerName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					allowed = aDecoder.decodeObject(of: [EVE.Char.ChatChannels.Channel.Accessor.self], forKey: "allowed") as? [EVE.Char.ChatChannels.Channel.Accessor]
					blocked = aDecoder.decodeObject(of: [EVE.Char.ChatChannels.Channel.Accessor.self], forKey: "blocked") as? [EVE.Char.ChatChannels.Channel.Accessor]
					channelID = aDecoder.decodeInteger(forKey: "channelID")
					comparisonKey = aDecoder.decodeObject(forKey: "comparisonKey") as? String ?? String()
					displayName = aDecoder.decodeObject(forKey: "displayName") as? String ?? String()
					hasPassword = aDecoder.decodeBool(forKey: "hasPassword")
					motd = aDecoder.decodeObject(forKey: "motd") as? String ?? String()
					muted = aDecoder.decodeObject(of: [EVE.Char.ChatChannels.Channel.Accessor.self], forKey: "muted") as? [EVE.Char.ChatChannels.Channel.Accessor]
					operators = aDecoder.decodeObject(of: [EVE.Char.ChatChannels.Channel.Accessor.self], forKey: "operators") as? [EVE.Char.ChatChannels.Channel.Accessor]
					ownerID = aDecoder.decodeInt64(forKey: "ownerID")
					ownerName = aDecoder.decodeObject(forKey: "ownerName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = allowed {
						aCoder.encode(v, forKey: "allowed")
					}
					if let v = blocked {
						aCoder.encode(v, forKey: "blocked")
					}
					aCoder.encode(channelID, forKey: "channelID")
					aCoder.encode(comparisonKey, forKey: "comparisonKey")
					aCoder.encode(displayName, forKey: "displayName")
					aCoder.encode(hasPassword, forKey: "hasPassword")
					aCoder.encode(motd, forKey: "motd")
					if let v = muted {
						aCoder.encode(v, forKey: "muted")
					}
					if let v = operators {
						aCoder.encode(v, forKey: "operators")
					}
					aCoder.encode(ownerID, forKey: "ownerID")
					aCoder.encode(ownerName, forKey: "ownerName")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					allowed?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					blocked?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: channelID.hashValue)
					hashCombine(seed: &hash, value: comparisonKey.hashValue)
					hashCombine(seed: &hash, value: displayName.hashValue)
					hashCombine(seed: &hash, value: hasPassword.hashValue)
					hashCombine(seed: &hash, value: motd.hashValue)
					muted?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					operators?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: ownerID.hashValue)
					hashCombine(seed: &hash, value: ownerName.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let channels = try dictionary.rowset(name: "channels")?.map ({try EVE.Char.ChatChannels.Channel(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.channels = channels
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				channels = aDecoder.decodeObject(of: [EVE.Char.ChatChannels.Channel.self], forKey: "channels") as? [EVE.Char.ChatChannels.Channel] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(channels, forKey: "channels")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["channels"] = channels.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				channels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Clones: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Attributes: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var charisma: Int = Int()
				public var intelligence: Int = Int()
				public var memory: Int = Int()
				public var perception: Int = Int()
				public var willpower: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let charisma = dictionary["charisma"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.charisma = charisma
					guard let intelligence = dictionary["intelligence"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.intelligence = intelligence
					guard let memory = dictionary["memory"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.memory = memory
					guard let perception = dictionary["perception"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.perception = perception
					guard let willpower = dictionary["willpower"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.willpower = willpower
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					charisma = aDecoder.decodeInteger(forKey: "charisma")
					intelligence = aDecoder.decodeInteger(forKey: "intelligence")
					memory = aDecoder.decodeInteger(forKey: "memory")
					perception = aDecoder.decodeInteger(forKey: "perception")
					willpower = aDecoder.decodeInteger(forKey: "willpower")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(charisma, forKey: "charisma")
					aCoder.encode(intelligence, forKey: "intelligence")
					aCoder.encode(memory, forKey: "memory")
					aCoder.encode(perception, forKey: "perception")
					aCoder.encode(willpower, forKey: "willpower")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["charisma"] = charisma.json
					json["intelligence"] = intelligence.json
					json["memory"] = memory.json
					json["perception"] = perception.json
					json["willpower"] = willpower.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: charisma.hashValue)
					hashCombine(seed: &hash, value: intelligence.hashValue)
					hashCombine(seed: &hash, value: memory.hashValue)
					hashCombine(seed: &hash, value: perception.hashValue)
					hashCombine(seed: &hash, value: willpower.hashValue)
					return hash
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
			
			public enum Gender: String, JSONCoding {
				case female = "Female"
				case male = "Male"
				
				public init() {
					self = .female
				}
				
				public var json: Any {
					return self.rawValue
				}
				
				public init(json: Any) throws {
					guard let s = json as? String, let v = Gender(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
					self = v
				}
				
			}
			
			public class Implant: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					typeName = aDecoder.decodeObject(forKey: "typeName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(typeID, forKey: "typeID")
					aCoder.encode(typeName, forKey: "typeName")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: typeID.hashValue)
					hashCombine(seed: &hash, value: typeName.hashValue)
					return hash
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
			
			public class JumpClone: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var cloneName: String = String()
				public var jumpCloneID: Int64 = Int64()
				public var locationID: Int64 = Int64()
				public var typeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let cloneName = dictionary["cloneName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.cloneName = cloneName
					guard let jumpCloneID = dictionary["jumpCloneID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.jumpCloneID = jumpCloneID
					guard let locationID = dictionary["locationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.locationID = locationID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					cloneName = aDecoder.decodeObject(forKey: "cloneName") as? String ?? String()
					jumpCloneID = aDecoder.decodeInt64(forKey: "jumpCloneID")
					locationID = aDecoder.decodeInt64(forKey: "locationID")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(cloneName, forKey: "cloneName")
					aCoder.encode(jumpCloneID, forKey: "jumpCloneID")
					aCoder.encode(locationID, forKey: "locationID")
					aCoder.encode(typeID, forKey: "typeID")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["cloneName"] = cloneName.json
					json["jumpCloneID"] = jumpCloneID.json
					json["locationID"] = locationID.json
					json["typeID"] = typeID.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: cloneName.hashValue)
					hashCombine(seed: &hash, value: jumpCloneID.hashValue)
					hashCombine(seed: &hash, value: locationID.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
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
			
			public class JumpCloneImplant: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var jumpCloneID: Int64 = Int64()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let jumpCloneID = dictionary["jumpCloneID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.jumpCloneID = jumpCloneID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					jumpCloneID = aDecoder.decodeInt64(forKey: "jumpCloneID")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					typeName = aDecoder.decodeObject(forKey: "typeName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(jumpCloneID, forKey: "jumpCloneID")
					aCoder.encode(typeID, forKey: "typeID")
					aCoder.encode(typeName, forKey: "typeName")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["jumpCloneID"] = jumpCloneID.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: jumpCloneID.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					hashCombine(seed: &hash, value: typeName.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let ancestry = dictionary["ancestry"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.ancestry = ancestry
				guard let ancestryID = dictionary["ancestryID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.ancestryID = ancestryID
				attributes = try EVE.Char.Clones.Attributes(json: dictionary["attributes"] as? [String: Any] ?? [:])
				guard let bloodLine = dictionary["bloodLine"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.bloodLine = bloodLine
				guard let bloodLineID = dictionary["bloodLineID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.bloodLineID = bloodLineID
				cloneJumpDate = DateFormatter.eveDateFormatter.date(from: dictionary["cloneJumpDate"] as? String ?? "")
				guard let dateOfBirth = DateFormatter.eveDateFormatter.date(from: dictionary["DoB"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.dateOfBirth = dateOfBirth
				guard let freeRespecs = dictionary["freeRespecs"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.freeRespecs = freeRespecs
				guard let gender = EVE.Char.Clones.Gender(rawValue: dictionary["gender"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.gender = gender
				implants = try dictionary.rowset(name: "implants")?.map {try EVE.Char.Clones.Implant(json: $0)}
				jumpActivation = DateFormatter.eveDateFormatter.date(from: dictionary["jumpActivation"] as? String ?? "")
				jumpCloneImplants = try dictionary.rowset(name: "jumpCloneImplants")?.map {try EVE.Char.Clones.JumpCloneImplant(json: $0)}
				jumpClones = try dictionary.rowset(name: "jumpClones")?.map {try EVE.Char.Clones.JumpClone(json: $0)}
				jumpFatigue = DateFormatter.eveDateFormatter.date(from: dictionary["jumpFatigue"] as? String ?? "")
				jumpLastUpdate = DateFormatter.eveDateFormatter.date(from: dictionary["jumpLastUpdate"] as? String ?? "")
				lastRespecDate = DateFormatter.eveDateFormatter.date(from: dictionary["lastRespecDate"] as? String ?? "")
				lastTimedRespec = DateFormatter.eveDateFormatter.date(from: dictionary["lastTimedRespec"] as? String ?? "")
				guard let race = dictionary["race"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.race = race
				remoteStationDate = DateFormatter.eveDateFormatter.date(from: dictionary["remoteStationDate"] as? String ?? "")
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				ancestry = aDecoder.decodeObject(forKey: "ancestry") as? String ?? String()
				ancestryID = aDecoder.decodeInteger(forKey: "ancestryID")
				attributes = aDecoder.decodeObject(of: EVE.Char.Clones.Attributes.self, forKey: "attributes")  ?? EVE.Char.Clones.Attributes()
				bloodLine = aDecoder.decodeObject(forKey: "bloodLine") as? String ?? String()
				bloodLineID = aDecoder.decodeInteger(forKey: "bloodLineID")
				cloneJumpDate = aDecoder.decodeObject(forKey: "cloneJumpDate") as? Date
				dateOfBirth = aDecoder.decodeObject(forKey: "DoB") as? Date ?? Date()
				freeRespecs = aDecoder.decodeInteger(forKey: "freeRespecs")
				gender = EVE.Char.Clones.Gender(rawValue: aDecoder.decodeObject(forKey: "gender") as? String ?? String()) ?? EVE.Char.Clones.Gender()
				implants = aDecoder.decodeObject(of: [EVE.Char.Clones.Implant.self], forKey: "implants") as? [EVE.Char.Clones.Implant]
				jumpActivation = aDecoder.decodeObject(forKey: "jumpActivation") as? Date
				jumpCloneImplants = aDecoder.decodeObject(of: [EVE.Char.Clones.JumpCloneImplant.self], forKey: "jumpCloneImplants") as? [EVE.Char.Clones.JumpCloneImplant]
				jumpClones = aDecoder.decodeObject(of: [EVE.Char.Clones.JumpClone.self], forKey: "jumpClones") as? [EVE.Char.Clones.JumpClone]
				jumpFatigue = aDecoder.decodeObject(forKey: "jumpFatigue") as? Date
				jumpLastUpdate = aDecoder.decodeObject(forKey: "jumpLastUpdate") as? Date
				lastRespecDate = aDecoder.decodeObject(forKey: "lastRespecDate") as? Date
				lastTimedRespec = aDecoder.decodeObject(forKey: "lastTimedRespec") as? Date
				race = aDecoder.decodeObject(forKey: "race") as? String ?? String()
				remoteStationDate = aDecoder.decodeObject(forKey: "remoteStationDate") as? Date
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(ancestry, forKey: "ancestry")
				aCoder.encode(ancestryID, forKey: "ancestryID")
				aCoder.encode(attributes, forKey: "attributes")
				aCoder.encode(bloodLine, forKey: "bloodLine")
				aCoder.encode(bloodLineID, forKey: "bloodLineID")
				if let v = cloneJumpDate {
					aCoder.encode(v, forKey: "cloneJumpDate")
				}
				aCoder.encode(dateOfBirth, forKey: "DoB")
				aCoder.encode(freeRespecs, forKey: "freeRespecs")
				aCoder.encode(gender.rawValue, forKey: "gender")
				if let v = implants {
					aCoder.encode(v, forKey: "implants")
				}
				if let v = jumpActivation {
					aCoder.encode(v, forKey: "jumpActivation")
				}
				if let v = jumpCloneImplants {
					aCoder.encode(v, forKey: "jumpCloneImplants")
				}
				if let v = jumpClones {
					aCoder.encode(v, forKey: "jumpClones")
				}
				if let v = jumpFatigue {
					aCoder.encode(v, forKey: "jumpFatigue")
				}
				if let v = jumpLastUpdate {
					aCoder.encode(v, forKey: "jumpLastUpdate")
				}
				if let v = lastRespecDate {
					aCoder.encode(v, forKey: "lastRespecDate")
				}
				if let v = lastTimedRespec {
					aCoder.encode(v, forKey: "lastTimedRespec")
				}
				aCoder.encode(race, forKey: "race")
				if let v = remoteStationDate {
					aCoder.encode(v, forKey: "remoteStationDate")
				}
			}
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: ancestry.hashValue)
				hashCombine(seed: &hash, value: ancestryID.hashValue)
				hashCombine(seed: &hash, value: attributes.hashValue)
				hashCombine(seed: &hash, value: bloodLine.hashValue)
				hashCombine(seed: &hash, value: bloodLineID.hashValue)
				hashCombine(seed: &hash, value: cloneJumpDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: dateOfBirth.hashValue)
				hashCombine(seed: &hash, value: freeRespecs.hashValue)
				hashCombine(seed: &hash, value: gender.hashValue)
				implants?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: jumpActivation?.hashValue ?? 0)
				jumpCloneImplants?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				jumpClones?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: jumpFatigue?.hashValue ?? 0)
				hashCombine(seed: &hash, value: jumpLastUpdate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: lastRespecDate?.hashValue ?? 0)
				hashCombine(seed: &hash, value: lastTimedRespec?.hashValue ?? 0)
				hashCombine(seed: &hash, value: race.hashValue)
				hashCombine(seed: &hash, value: remoteStationDate?.hashValue ?? 0)
				return hash
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
		
		
		public class ContactList: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Contact: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let contactID = dictionary["contactID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.contactID = contactID
					guard let contactName = dictionary["contactName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.contactName = contactName
					guard let contactTypeID = dictionary["contactTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.contactTypeID = contactTypeID
					inWatchlist = dictionary["inWatchlist"] as? Bool
					guard let labelMask = dictionary["labelMask"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.labelMask = labelMask
					guard let standing = dictionary["standing"] as? Float else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.standing = standing
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					contactID = aDecoder.decodeInt64(forKey: "contactID")
					contactName = aDecoder.decodeObject(forKey: "contactName") as? String ?? String()
					contactTypeID = aDecoder.decodeInteger(forKey: "contactTypeID")
					inWatchlist = aDecoder.containsValue(forKey: "inWatchlist") ? aDecoder.decodeBool(forKey: "inWatchlist") : nil
					labelMask = aDecoder.decodeInt64(forKey: "labelMask")
					standing = aDecoder.decodeFloat(forKey: "standing")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(contactID, forKey: "contactID")
					aCoder.encode(contactName, forKey: "contactName")
					aCoder.encode(contactTypeID, forKey: "contactTypeID")
					if let v = inWatchlist {
						aCoder.encode(v, forKey: "inWatchlist")
					}
					aCoder.encode(labelMask, forKey: "labelMask")
					aCoder.encode(standing, forKey: "standing")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: contactID.hashValue)
					hashCombine(seed: &hash, value: contactName.hashValue)
					hashCombine(seed: &hash, value: contactTypeID.hashValue)
					hashCombine(seed: &hash, value: inWatchlist?.hashValue ?? 0)
					hashCombine(seed: &hash, value: labelMask.hashValue)
					hashCombine(seed: &hash, value: standing.hashValue)
					return hash
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
			
			public class Label: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var labelID: Int64 = Int64()
				public var name: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let labelID = dictionary["labelID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.labelID = labelID
					guard let name = dictionary["name"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.name = name
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					labelID = aDecoder.decodeInt64(forKey: "labelID")
					name = aDecoder.decodeObject(forKey: "name") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(labelID, forKey: "labelID")
					aCoder.encode(name, forKey: "name")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["labelID"] = labelID.json
					json["name"] = name.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: labelID.hashValue)
					hashCombine(seed: &hash, value: name.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let allianceContactLabels = try dictionary.rowset(name: "allianceContactLabels")?.map ({try EVE.Char.ContactList.Label(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.allianceContactLabels = allianceContactLabels
				guard let allianceContactList = try dictionary.rowset(name: "allianceContactList")?.map ({try EVE.Char.ContactList.Contact(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.allianceContactList = allianceContactList
				guard let contactLabels = try dictionary.rowset(name: "contactLabels")?.map ({try EVE.Char.ContactList.Label(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.contactLabels = contactLabels
				guard let contactList = try dictionary.rowset(name: "contactList")?.map ({try EVE.Char.ContactList.Contact(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.contactList = contactList
				guard let corporateContactLabels = try dictionary.rowset(name: "corporateContactLabels")?.map ({try EVE.Char.ContactList.Label(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.corporateContactLabels = corporateContactLabels
				guard let corporateContactList = try dictionary.rowset(name: "corporateContactList")?.map ({try EVE.Char.ContactList.Contact(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.corporateContactList = corporateContactList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				allianceContactLabels = aDecoder.decodeObject(of: [EVE.Char.ContactList.Label.self], forKey: "allianceContactLabels") as? [EVE.Char.ContactList.Label] ?? []
				allianceContactList = aDecoder.decodeObject(of: [EVE.Char.ContactList.Contact.self], forKey: "allianceContactList") as? [EVE.Char.ContactList.Contact] ?? []
				contactLabels = aDecoder.decodeObject(of: [EVE.Char.ContactList.Label.self], forKey: "contactLabels") as? [EVE.Char.ContactList.Label] ?? []
				contactList = aDecoder.decodeObject(of: [EVE.Char.ContactList.Contact.self], forKey: "contactList") as? [EVE.Char.ContactList.Contact] ?? []
				corporateContactLabels = aDecoder.decodeObject(of: [EVE.Char.ContactList.Label.self], forKey: "corporateContactLabels") as? [EVE.Char.ContactList.Label] ?? []
				corporateContactList = aDecoder.decodeObject(of: [EVE.Char.ContactList.Contact.self], forKey: "corporateContactList") as? [EVE.Char.ContactList.Contact] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(allianceContactLabels, forKey: "allianceContactLabels")
				aCoder.encode(allianceContactList, forKey: "allianceContactList")
				aCoder.encode(contactLabels, forKey: "contactLabels")
				aCoder.encode(contactList, forKey: "contactList")
				aCoder.encode(corporateContactLabels, forKey: "corporateContactLabels")
				aCoder.encode(corporateContactList, forKey: "corporateContactList")
			}
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				allianceContactLabels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				allianceContactList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				contactLabels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				contactList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				corporateContactLabels.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				corporateContactList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class ContactNotifications: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Notification: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var messageData: String = String()
				public var notificationID: Int64 = Int64()
				public var senderID: Int64 = Int64()
				public var senderName: String = String()
				public var sentDate: Date = Date()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let messageData = dictionary["messageData"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.messageData = messageData
					guard let notificationID = dictionary["notificationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.notificationID = notificationID
					guard let senderID = dictionary["senderID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.senderID = senderID
					guard let senderName = dictionary["senderName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.senderName = senderName
					guard let sentDate = DateFormatter.eveDateFormatter.date(from: dictionary["sentDate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.sentDate = sentDate
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					messageData = aDecoder.decodeObject(forKey: "messageData") as? String ?? String()
					notificationID = aDecoder.decodeInt64(forKey: "notificationID")
					senderID = aDecoder.decodeInt64(forKey: "senderID")
					senderName = aDecoder.decodeObject(forKey: "senderName") as? String ?? String()
					sentDate = aDecoder.decodeObject(forKey: "sentDate") as? Date ?? Date()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(messageData, forKey: "messageData")
					aCoder.encode(notificationID, forKey: "notificationID")
					aCoder.encode(senderID, forKey: "senderID")
					aCoder.encode(senderName, forKey: "senderName")
					aCoder.encode(sentDate, forKey: "sentDate")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["messageData"] = messageData.json
					json["notificationID"] = notificationID.json
					json["senderID"] = senderID.json
					json["senderName"] = senderName.json
					json["sentDate"] = sentDate.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: messageData.hashValue)
					hashCombine(seed: &hash, value: notificationID.hashValue)
					hashCombine(seed: &hash, value: senderID.hashValue)
					hashCombine(seed: &hash, value: senderName.hashValue)
					hashCombine(seed: &hash, value: sentDate.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let contactNotifications = try dictionary.rowset(name: "contactNotifications")?.map ({try EVE.Char.ContactNotifications.Notification(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.contactNotifications = contactNotifications
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				contactNotifications = aDecoder.decodeObject(of: [EVE.Char.ContactNotifications.Notification.self], forKey: "contactNotifications") as? [EVE.Char.ContactNotifications.Notification] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(contactNotifications, forKey: "contactNotifications")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["contactNotifications"] = contactNotifications.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				contactNotifications.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class ContractBids: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Bid: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var amount: Double = Double()
				public var bidID: Int64 = Int64()
				public var bidderID: Int64 = Int64()
				public var contractID: Int64 = Int64()
				public var dateBid: Date = Date()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let amount = dictionary["amount"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.amount = amount
					guard let bidID = dictionary["bidID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.bidID = bidID
					guard let bidderID = dictionary["bidderID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.bidderID = bidderID
					guard let contractID = dictionary["contractID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.contractID = contractID
					guard let dateBid = DateFormatter.eveDateFormatter.date(from: dictionary["dateBid"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.dateBid = dateBid
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					amount = aDecoder.decodeDouble(forKey: "amount")
					bidID = aDecoder.decodeInt64(forKey: "bidID")
					bidderID = aDecoder.decodeInt64(forKey: "bidderID")
					contractID = aDecoder.decodeInt64(forKey: "contractID")
					dateBid = aDecoder.decodeObject(forKey: "dateBid") as? Date ?? Date()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(amount, forKey: "amount")
					aCoder.encode(bidID, forKey: "bidID")
					aCoder.encode(bidderID, forKey: "bidderID")
					aCoder.encode(contractID, forKey: "contractID")
					aCoder.encode(dateBid, forKey: "dateBid")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["amount"] = amount.json
					json["bidID"] = bidID.json
					json["bidderID"] = bidderID.json
					json["contractID"] = contractID.json
					json["dateBid"] = dateBid.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount.hashValue)
					hashCombine(seed: &hash, value: bidID.hashValue)
					hashCombine(seed: &hash, value: bidderID.hashValue)
					hashCombine(seed: &hash, value: contractID.hashValue)
					hashCombine(seed: &hash, value: dateBid.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let bidList = try dictionary.rowset(name: "bidList")?.map ({try EVE.Char.ContractBids.Bid(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.bidList = bidList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				bidList = aDecoder.decodeObject(of: [EVE.Char.ContractBids.Bid.self], forKey: "bidList") as? [EVE.Char.ContractBids.Bid] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(bidList, forKey: "bidList")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["bidList"] = bidList.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				bidList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class ContractItems: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Item: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let included = dictionary["included"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.included = included
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.quantity = quantity
					guard let rawQuantity = dictionary["rawQuantity"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.rawQuantity = rawQuantity
					guard let recordID = dictionary["recordID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.recordID = recordID
					guard let singleton = dictionary["singleton"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.singleton = singleton
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					included = aDecoder.decodeBool(forKey: "included")
					quantity = aDecoder.decodeInt64(forKey: "quantity")
					rawQuantity = aDecoder.decodeInteger(forKey: "rawQuantity")
					recordID = aDecoder.decodeInt64(forKey: "recordID")
					singleton = aDecoder.decodeBool(forKey: "singleton")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(included, forKey: "included")
					aCoder.encode(quantity, forKey: "quantity")
					aCoder.encode(rawQuantity, forKey: "rawQuantity")
					aCoder.encode(recordID, forKey: "recordID")
					aCoder.encode(singleton, forKey: "singleton")
					aCoder.encode(typeID, forKey: "typeID")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: included.hashValue)
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: rawQuantity.hashValue)
					hashCombine(seed: &hash, value: recordID.hashValue)
					hashCombine(seed: &hash, value: singleton.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let itemList = try dictionary.rowset(name: "itemList")?.map ({try EVE.Char.ContractItems.Item(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.itemList = itemList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				itemList = aDecoder.decodeObject(of: [EVE.Char.ContractItems.Item.self], forKey: "itemList") as? [EVE.Char.ContractItems.Item] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(itemList, forKey: "itemList")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["itemList"] = itemList.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				itemList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Contracts: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Contract: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum Availability: String, JSONCoding {
					case `private` = "Private"
					case `public` = "Public"
					
					public init() {
						self = .`private`
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = Availability(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
						self = v
					}
					
				}
				
				public enum ContractType: String, JSONCoding {
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
						guard let s = json as? String, let v = ContractType(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
						self = v
					}
					
				}
				
				public enum Status: String, JSONCoding {
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
						guard let s = json as? String, let v = Status(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let acceptorID = dictionary["acceptorID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.acceptorID = acceptorID
					guard let assigneeID = dictionary["assigneeID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.assigneeID = assigneeID
					guard let availability = EVE.Char.Contracts.Contract.Availability(rawValue: dictionary["availability"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.availability = availability
					guard let buyout = dictionary["buyout"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.buyout = buyout
					guard let collateral = dictionary["collateral"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.collateral = collateral
					guard let contractID = dictionary["contractID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.contractID = contractID
					guard let dateAccepted = DateFormatter.eveDateFormatter.date(from: dictionary["dateAccepted"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.dateAccepted = dateAccepted
					guard let dateCompleted = DateFormatter.eveDateFormatter.date(from: dictionary["dateCompleted"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.dateCompleted = dateCompleted
					guard let dateExpired = DateFormatter.eveDateFormatter.date(from: dictionary["dateExpired"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.dateExpired = dateExpired
					guard let dateIssued = DateFormatter.eveDateFormatter.date(from: dictionary["dateIssued"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.dateIssued = dateIssued
					guard let endStationID = dictionary["endStationID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.endStationID = endStationID
					guard let forCorp = dictionary["forCorp"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.forCorp = forCorp
					guard let issuerCorpID = dictionary["issuerCorpID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.issuerCorpID = issuerCorpID
					guard let issuerID = dictionary["issuerID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.issuerID = issuerID
					guard let numDays = dictionary["numDays"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.numDays = numDays
					guard let price = dictionary["price"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.price = price
					guard let reward = dictionary["reward"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.reward = reward
					guard let startStationID = dictionary["startStationID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.startStationID = startStationID
					guard let status = EVE.Char.Contracts.Contract.Status(rawValue: dictionary["status"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.status = status
					guard let title = dictionary["title"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.title = title
					guard let type = EVE.Char.Contracts.Contract.ContractType(rawValue: dictionary["type"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.type = type
					guard let volume = dictionary["volume"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.volume = volume
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					acceptorID = aDecoder.decodeInt64(forKey: "acceptorID")
					assigneeID = aDecoder.decodeInt64(forKey: "assigneeID")
					availability = EVE.Char.Contracts.Contract.Availability(rawValue: aDecoder.decodeObject(forKey: "availability") as? String ?? String()) ?? EVE.Char.Contracts.Contract.Availability()
					buyout = aDecoder.decodeDouble(forKey: "buyout")
					collateral = aDecoder.decodeDouble(forKey: "collateral")
					contractID = aDecoder.decodeInt64(forKey: "contractID")
					dateAccepted = aDecoder.decodeObject(forKey: "dateAccepted") as? Date ?? Date()
					dateCompleted = aDecoder.decodeObject(forKey: "dateCompleted") as? Date ?? Date()
					dateExpired = aDecoder.decodeObject(forKey: "dateExpired") as? Date ?? Date()
					dateIssued = aDecoder.decodeObject(forKey: "dateIssued") as? Date ?? Date()
					endStationID = aDecoder.decodeInteger(forKey: "endStationID")
					forCorp = aDecoder.decodeBool(forKey: "forCorp")
					issuerCorpID = aDecoder.decodeInt64(forKey: "issuerCorpID")
					issuerID = aDecoder.decodeInt64(forKey: "issuerID")
					numDays = aDecoder.decodeInteger(forKey: "numDays")
					price = aDecoder.decodeDouble(forKey: "price")
					reward = aDecoder.decodeDouble(forKey: "reward")
					startStationID = aDecoder.decodeInteger(forKey: "startStationID")
					status = EVE.Char.Contracts.Contract.Status(rawValue: aDecoder.decodeObject(forKey: "status") as? String ?? String()) ?? EVE.Char.Contracts.Contract.Status()
					title = aDecoder.decodeObject(forKey: "title") as? String ?? String()
					type = EVE.Char.Contracts.Contract.ContractType(rawValue: aDecoder.decodeObject(forKey: "type") as? String ?? String()) ?? EVE.Char.Contracts.Contract.ContractType()
					volume = aDecoder.decodeDouble(forKey: "volume")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(acceptorID, forKey: "acceptorID")
					aCoder.encode(assigneeID, forKey: "assigneeID")
					aCoder.encode(availability.rawValue, forKey: "availability")
					aCoder.encode(buyout, forKey: "buyout")
					aCoder.encode(collateral, forKey: "collateral")
					aCoder.encode(contractID, forKey: "contractID")
					aCoder.encode(dateAccepted, forKey: "dateAccepted")
					aCoder.encode(dateCompleted, forKey: "dateCompleted")
					aCoder.encode(dateExpired, forKey: "dateExpired")
					aCoder.encode(dateIssued, forKey: "dateIssued")
					aCoder.encode(endStationID, forKey: "endStationID")
					aCoder.encode(forCorp, forKey: "forCorp")
					aCoder.encode(issuerCorpID, forKey: "issuerCorpID")
					aCoder.encode(issuerID, forKey: "issuerID")
					aCoder.encode(numDays, forKey: "numDays")
					aCoder.encode(price, forKey: "price")
					aCoder.encode(reward, forKey: "reward")
					aCoder.encode(startStationID, forKey: "startStationID")
					aCoder.encode(status.rawValue, forKey: "status")
					aCoder.encode(title, forKey: "title")
					aCoder.encode(type.rawValue, forKey: "type")
					aCoder.encode(volume, forKey: "volume")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: acceptorID.hashValue)
					hashCombine(seed: &hash, value: assigneeID.hashValue)
					hashCombine(seed: &hash, value: availability.hashValue)
					hashCombine(seed: &hash, value: buyout.hashValue)
					hashCombine(seed: &hash, value: collateral.hashValue)
					hashCombine(seed: &hash, value: contractID.hashValue)
					hashCombine(seed: &hash, value: dateAccepted.hashValue)
					hashCombine(seed: &hash, value: dateCompleted.hashValue)
					hashCombine(seed: &hash, value: dateExpired.hashValue)
					hashCombine(seed: &hash, value: dateIssued.hashValue)
					hashCombine(seed: &hash, value: endStationID.hashValue)
					hashCombine(seed: &hash, value: forCorp.hashValue)
					hashCombine(seed: &hash, value: issuerCorpID.hashValue)
					hashCombine(seed: &hash, value: issuerID.hashValue)
					hashCombine(seed: &hash, value: numDays.hashValue)
					hashCombine(seed: &hash, value: price.hashValue)
					hashCombine(seed: &hash, value: reward.hashValue)
					hashCombine(seed: &hash, value: startStationID.hashValue)
					hashCombine(seed: &hash, value: status.hashValue)
					hashCombine(seed: &hash, value: title.hashValue)
					hashCombine(seed: &hash, value: type.hashValue)
					hashCombine(seed: &hash, value: volume.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let contractList = try dictionary.rowset(name: "contractList")?.map ({try EVE.Char.Contracts.Contract(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.contractList = contractList
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				contractList = aDecoder.decodeObject(of: [EVE.Char.Contracts.Contract.self], forKey: "contractList") as? [EVE.Char.Contracts.Contract] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(contractList, forKey: "contractList")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["contractList"] = contractList.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				contractList.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class FacWarStats: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let currentRank = dictionary["currentRank"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.currentRank = currentRank
				guard let enlisted = DateFormatter.eveDateFormatter.date(from: dictionary["enlisted"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
				self.enlisted = enlisted
				guard let factionID = dictionary["factionID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.factionID = factionID
				guard let factionName = dictionary["factionName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.factionName = factionName
				guard let highestRank = dictionary["highestRank"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.highestRank = highestRank
				guard let killsLastWeek = dictionary["killsLastWeek"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.killsLastWeek = killsLastWeek
				guard let killsTotal = dictionary["killsTotal"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.killsTotal = killsTotal
				guard let killsYesterday = dictionary["killsYesterday"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.killsYesterday = killsYesterday
				guard let victoryPointsLastWeek = dictionary["victoryPointsLastWeek"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.victoryPointsLastWeek = victoryPointsLastWeek
				guard let victoryPointsTotal = dictionary["victoryPointsTotal"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.victoryPointsTotal = victoryPointsTotal
				guard let victoryPointsYesterday = dictionary["victoryPointsYesterday"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.victoryPointsYesterday = victoryPointsYesterday
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				currentRank = aDecoder.decodeInteger(forKey: "currentRank")
				enlisted = aDecoder.decodeObject(forKey: "enlisted") as? Date ?? Date()
				factionID = aDecoder.decodeInteger(forKey: "factionID")
				factionName = aDecoder.decodeObject(forKey: "factionName") as? String ?? String()
				highestRank = aDecoder.decodeInteger(forKey: "highestRank")
				killsLastWeek = aDecoder.decodeInteger(forKey: "killsLastWeek")
				killsTotal = aDecoder.decodeInteger(forKey: "killsTotal")
				killsYesterday = aDecoder.decodeInteger(forKey: "killsYesterday")
				victoryPointsLastWeek = aDecoder.decodeInteger(forKey: "victoryPointsLastWeek")
				victoryPointsTotal = aDecoder.decodeInteger(forKey: "victoryPointsTotal")
				victoryPointsYesterday = aDecoder.decodeInteger(forKey: "victoryPointsYesterday")
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(currentRank, forKey: "currentRank")
				aCoder.encode(enlisted, forKey: "enlisted")
				aCoder.encode(factionID, forKey: "factionID")
				aCoder.encode(factionName, forKey: "factionName")
				aCoder.encode(highestRank, forKey: "highestRank")
				aCoder.encode(killsLastWeek, forKey: "killsLastWeek")
				aCoder.encode(killsTotal, forKey: "killsTotal")
				aCoder.encode(killsYesterday, forKey: "killsYesterday")
				aCoder.encode(victoryPointsLastWeek, forKey: "victoryPointsLastWeek")
				aCoder.encode(victoryPointsTotal, forKey: "victoryPointsTotal")
				aCoder.encode(victoryPointsYesterday, forKey: "victoryPointsYesterday")
			}
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: currentRank.hashValue)
				hashCombine(seed: &hash, value: enlisted.hashValue)
				hashCombine(seed: &hash, value: factionID.hashValue)
				hashCombine(seed: &hash, value: factionName.hashValue)
				hashCombine(seed: &hash, value: highestRank.hashValue)
				hashCombine(seed: &hash, value: killsLastWeek.hashValue)
				hashCombine(seed: &hash, value: killsTotal.hashValue)
				hashCombine(seed: &hash, value: killsYesterday.hashValue)
				hashCombine(seed: &hash, value: victoryPointsLastWeek.hashValue)
				hashCombine(seed: &hash, value: victoryPointsTotal.hashValue)
				hashCombine(seed: &hash, value: victoryPointsYesterday.hashValue)
				return hash
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
		
		
		public class IndustryJobs: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Job: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum Status: Int, JSONCoding {
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
						guard let s = json as? Int, let v = Status(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let activityID = dictionary["activityID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.activityID = activityID
					guard let blueprintID = dictionary["blueprintID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.blueprintID = blueprintID
					guard let blueprintLocationID = dictionary["blueprintLocationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.blueprintLocationID = blueprintLocationID
					guard let blueprintTypeID = dictionary["blueprintTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.blueprintTypeID = blueprintTypeID
					guard let blueprintTypeName = dictionary["blueprintTypeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.blueprintTypeName = blueprintTypeName
					guard let completedCharacterID = dictionary["completedCharacterID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.completedCharacterID = completedCharacterID
					guard let completedDate = DateFormatter.eveDateFormatter.date(from: dictionary["completedDate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.completedDate = completedDate
					guard let cost = dictionary["cost"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.cost = cost
					guard let endDate = DateFormatter.eveDateFormatter.date(from: dictionary["endDate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.endDate = endDate
					guard let facilityID = dictionary["facilityID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.facilityID = facilityID
					guard let installerID = dictionary["installerID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.installerID = installerID
					guard let installerName = dictionary["installerName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.installerName = installerName
					guard let jobID = dictionary["jobID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.jobID = jobID
					guard let licensedRuns = dictionary["licensedRuns"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.licensedRuns = licensedRuns
					guard let outputLocationID = dictionary["outputLocationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.outputLocationID = outputLocationID
					guard let pauseDate = DateFormatter.eveDateFormatter.date(from: dictionary["pauseDate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.pauseDate = pauseDate
					guard let probability = dictionary["probability"] as? Float else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.probability = probability
					guard let productTypeID = dictionary["productTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.productTypeID = productTypeID
					guard let productTypeName = dictionary["productTypeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.productTypeName = productTypeName
					guard let runs = dictionary["runs"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.runs = runs
					guard let solarSystemID = dictionary["solarSystemID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.solarSystemID = solarSystemID
					guard let solarSystemName = dictionary["solarSystemName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.solarSystemName = solarSystemName
					guard let startDate = DateFormatter.eveDateFormatter.date(from: dictionary["startDate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.startDate = startDate
					guard let stationID = dictionary["stationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.stationID = stationID
					guard let status = EVE.Char.IndustryJobs.Job.Status(rawValue: dictionary["status"] as? Int ?? Int()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.status = status
					guard let successfulRuns = dictionary["successfulRuns"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.successfulRuns = successfulRuns
					guard let teamID = dictionary["teamID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.teamID = teamID
					guard let timeInSeconds = dictionary["timeInSeconds"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.timeInSeconds = timeInSeconds
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					activityID = aDecoder.decodeInteger(forKey: "activityID")
					blueprintID = aDecoder.decodeInt64(forKey: "blueprintID")
					blueprintLocationID = aDecoder.decodeInt64(forKey: "blueprintLocationID")
					blueprintTypeID = aDecoder.decodeInteger(forKey: "blueprintTypeID")
					blueprintTypeName = aDecoder.decodeObject(forKey: "blueprintTypeName") as? String ?? String()
					completedCharacterID = aDecoder.decodeInt64(forKey: "completedCharacterID")
					completedDate = aDecoder.decodeObject(forKey: "completedDate") as? Date ?? Date()
					cost = aDecoder.decodeDouble(forKey: "cost")
					endDate = aDecoder.decodeObject(forKey: "endDate") as? Date ?? Date()
					facilityID = aDecoder.decodeInteger(forKey: "facilityID")
					installerID = aDecoder.decodeInt64(forKey: "installerID")
					installerName = aDecoder.decodeObject(forKey: "installerName") as? String ?? String()
					jobID = aDecoder.decodeInt64(forKey: "jobID")
					licensedRuns = aDecoder.decodeInteger(forKey: "licensedRuns")
					outputLocationID = aDecoder.decodeInt64(forKey: "outputLocationID")
					pauseDate = aDecoder.decodeObject(forKey: "pauseDate") as? Date ?? Date()
					probability = aDecoder.decodeFloat(forKey: "probability")
					productTypeID = aDecoder.decodeInteger(forKey: "productTypeID")
					productTypeName = aDecoder.decodeObject(forKey: "productTypeName") as? String ?? String()
					runs = aDecoder.decodeInteger(forKey: "runs")
					solarSystemID = aDecoder.decodeInteger(forKey: "solarSystemID")
					solarSystemName = aDecoder.decodeObject(forKey: "solarSystemName") as? String ?? String()
					startDate = aDecoder.decodeObject(forKey: "startDate") as? Date ?? Date()
					stationID = aDecoder.decodeInt64(forKey: "stationID")
					status = EVE.Char.IndustryJobs.Job.Status(rawValue: aDecoder.decodeObject(forKey: "status") as? Int ?? Int()) ?? EVE.Char.IndustryJobs.Job.Status()
					successfulRuns = aDecoder.decodeInteger(forKey: "successfulRuns")
					teamID = aDecoder.decodeInteger(forKey: "teamID")
					timeInSeconds = aDecoder.decodeInteger(forKey: "timeInSeconds")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(activityID, forKey: "activityID")
					aCoder.encode(blueprintID, forKey: "blueprintID")
					aCoder.encode(blueprintLocationID, forKey: "blueprintLocationID")
					aCoder.encode(blueprintTypeID, forKey: "blueprintTypeID")
					aCoder.encode(blueprintTypeName, forKey: "blueprintTypeName")
					aCoder.encode(completedCharacterID, forKey: "completedCharacterID")
					aCoder.encode(completedDate, forKey: "completedDate")
					aCoder.encode(cost, forKey: "cost")
					aCoder.encode(endDate, forKey: "endDate")
					aCoder.encode(facilityID, forKey: "facilityID")
					aCoder.encode(installerID, forKey: "installerID")
					aCoder.encode(installerName, forKey: "installerName")
					aCoder.encode(jobID, forKey: "jobID")
					aCoder.encode(licensedRuns, forKey: "licensedRuns")
					aCoder.encode(outputLocationID, forKey: "outputLocationID")
					aCoder.encode(pauseDate, forKey: "pauseDate")
					aCoder.encode(probability, forKey: "probability")
					aCoder.encode(productTypeID, forKey: "productTypeID")
					aCoder.encode(productTypeName, forKey: "productTypeName")
					aCoder.encode(runs, forKey: "runs")
					aCoder.encode(solarSystemID, forKey: "solarSystemID")
					aCoder.encode(solarSystemName, forKey: "solarSystemName")
					aCoder.encode(startDate, forKey: "startDate")
					aCoder.encode(stationID, forKey: "stationID")
					aCoder.encode(status.rawValue, forKey: "status")
					aCoder.encode(successfulRuns, forKey: "successfulRuns")
					aCoder.encode(teamID, forKey: "teamID")
					aCoder.encode(timeInSeconds, forKey: "timeInSeconds")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: activityID.hashValue)
					hashCombine(seed: &hash, value: blueprintID.hashValue)
					hashCombine(seed: &hash, value: blueprintLocationID.hashValue)
					hashCombine(seed: &hash, value: blueprintTypeID.hashValue)
					hashCombine(seed: &hash, value: blueprintTypeName.hashValue)
					hashCombine(seed: &hash, value: completedCharacterID.hashValue)
					hashCombine(seed: &hash, value: completedDate.hashValue)
					hashCombine(seed: &hash, value: cost.hashValue)
					hashCombine(seed: &hash, value: endDate.hashValue)
					hashCombine(seed: &hash, value: facilityID.hashValue)
					hashCombine(seed: &hash, value: installerID.hashValue)
					hashCombine(seed: &hash, value: installerName.hashValue)
					hashCombine(seed: &hash, value: jobID.hashValue)
					hashCombine(seed: &hash, value: licensedRuns.hashValue)
					hashCombine(seed: &hash, value: outputLocationID.hashValue)
					hashCombine(seed: &hash, value: pauseDate.hashValue)
					hashCombine(seed: &hash, value: probability.hashValue)
					hashCombine(seed: &hash, value: productTypeID.hashValue)
					hashCombine(seed: &hash, value: productTypeName.hashValue)
					hashCombine(seed: &hash, value: runs.hashValue)
					hashCombine(seed: &hash, value: solarSystemID.hashValue)
					hashCombine(seed: &hash, value: solarSystemName.hashValue)
					hashCombine(seed: &hash, value: startDate.hashValue)
					hashCombine(seed: &hash, value: stationID.hashValue)
					hashCombine(seed: &hash, value: status.hashValue)
					hashCombine(seed: &hash, value: successfulRuns.hashValue)
					hashCombine(seed: &hash, value: teamID.hashValue)
					hashCombine(seed: &hash, value: timeInSeconds.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let jobs = try dictionary.rowset(name: "jobs")?.map ({try EVE.Char.IndustryJobs.Job(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.jobs = jobs
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				jobs = aDecoder.decodeObject(of: [EVE.Char.IndustryJobs.Job.self], forKey: "jobs") as? [EVE.Char.IndustryJobs.Job] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(jobs, forKey: "jobs")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["jobs"] = jobs.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				jobs.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class KillMails: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Kill: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public class Attacker: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
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
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						allianceID = dictionary["allianceID"] as? Int64
						allianceName = dictionary["allianceName"] as? String
						guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.characterID = characterID
						guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.characterName = characterName
						guard let corporationID = dictionary["corporationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.corporationID = corporationID
						guard let corporationName = dictionary["corporationName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.corporationName = corporationName
						guard let damageDone = dictionary["damageDone"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.damageDone = damageDone
						factionID = dictionary["factionID"] as? Int
						factionName = dictionary["factionName"] as? String
						guard let finalBlow = dictionary["finalBlow"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.finalBlow = finalBlow
						guard let securityStatus = dictionary["securityStatus"] as? Float else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.securityStatus = securityStatus
						guard let shipTypeID = dictionary["shipTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.shipTypeID = shipTypeID
						guard let weaponTypeID = dictionary["weaponTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.weaponTypeID = weaponTypeID
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public required init?(coder aDecoder: NSCoder) {
						allianceID = aDecoder.containsValue(forKey: "allianceID") ? aDecoder.decodeInt64(forKey: "allianceID") : nil
						allianceName = aDecoder.decodeObject(forKey: "allianceName") as? String
						characterID = aDecoder.decodeInt64(forKey: "characterID")
						characterName = aDecoder.decodeObject(forKey: "characterName") as? String ?? String()
						corporationID = aDecoder.decodeInt64(forKey: "corporationID")
						corporationName = aDecoder.decodeObject(forKey: "corporationName") as? String ?? String()
						damageDone = aDecoder.decodeInt64(forKey: "damageDone")
						factionID = aDecoder.containsValue(forKey: "factionID") ? aDecoder.decodeInteger(forKey: "factionID") : nil
						factionName = aDecoder.decodeObject(forKey: "factionName") as? String
						finalBlow = aDecoder.decodeBool(forKey: "finalBlow")
						securityStatus = aDecoder.decodeFloat(forKey: "securityStatus")
						shipTypeID = aDecoder.decodeInteger(forKey: "shipTypeID")
						weaponTypeID = aDecoder.decodeInteger(forKey: "weaponTypeID")
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						if let v = allianceID {
							aCoder.encode(v, forKey: "allianceID")
						}
						if let v = allianceName {
							aCoder.encode(v, forKey: "allianceName")
						}
						aCoder.encode(characterID, forKey: "characterID")
						aCoder.encode(characterName, forKey: "characterName")
						aCoder.encode(corporationID, forKey: "corporationID")
						aCoder.encode(corporationName, forKey: "corporationName")
						aCoder.encode(damageDone, forKey: "damageDone")
						if let v = factionID {
							aCoder.encode(v, forKey: "factionID")
						}
						if let v = factionName {
							aCoder.encode(v, forKey: "factionName")
						}
						aCoder.encode(finalBlow, forKey: "finalBlow")
						aCoder.encode(securityStatus, forKey: "securityStatus")
						aCoder.encode(shipTypeID, forKey: "shipTypeID")
						aCoder.encode(weaponTypeID, forKey: "weaponTypeID")
					}
					
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
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: allianceName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: characterID.hashValue)
						hashCombine(seed: &hash, value: characterName.hashValue)
						hashCombine(seed: &hash, value: corporationID.hashValue)
						hashCombine(seed: &hash, value: corporationName.hashValue)
						hashCombine(seed: &hash, value: damageDone.hashValue)
						hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: factionName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: finalBlow.hashValue)
						hashCombine(seed: &hash, value: securityStatus.hashValue)
						hashCombine(seed: &hash, value: shipTypeID.hashValue)
						hashCombine(seed: &hash, value: weaponTypeID.hashValue)
						return hash
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
				
				public class Item: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
					public var flag: Int = Int()
					public var qtyDestroyed: Int = Int()
					public var qtyDropped: Int = Int()
					public var singleton: Bool = Bool()
					public var typeID: Int = Int()
					
					public static var supportsSecureCoding: Bool {
						return true
					}
					
					public required init(json: Any) throws {
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						guard let flag = dictionary["flag"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.flag = flag
						guard let qtyDestroyed = dictionary["qtyDestroyed"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.qtyDestroyed = qtyDestroyed
						guard let qtyDropped = dictionary["qtyDropped"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.qtyDropped = qtyDropped
						guard let singleton = dictionary["singleton"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.singleton = singleton
						guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.typeID = typeID
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public required init?(coder aDecoder: NSCoder) {
						flag = aDecoder.decodeInteger(forKey: "flag")
						qtyDestroyed = aDecoder.decodeInteger(forKey: "qtyDestroyed")
						qtyDropped = aDecoder.decodeInteger(forKey: "qtyDropped")
						singleton = aDecoder.decodeBool(forKey: "singleton")
						typeID = aDecoder.decodeInteger(forKey: "typeID")
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						aCoder.encode(flag, forKey: "flag")
						aCoder.encode(qtyDestroyed, forKey: "qtyDestroyed")
						aCoder.encode(qtyDropped, forKey: "qtyDropped")
						aCoder.encode(singleton, forKey: "singleton")
						aCoder.encode(typeID, forKey: "typeID")
					}
					
					public var json: Any {
						var json = [String: Any]()
						json["flag"] = flag.json
						json["qtyDestroyed"] = qtyDestroyed.json
						json["qtyDropped"] = qtyDropped.json
						json["singleton"] = singleton.json
						json["typeID"] = typeID.json
						return json
					}
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: flag.hashValue)
						hashCombine(seed: &hash, value: qtyDestroyed.hashValue)
						hashCombine(seed: &hash, value: qtyDropped.hashValue)
						hashCombine(seed: &hash, value: singleton.hashValue)
						hashCombine(seed: &hash, value: typeID.hashValue)
						return hash
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
				
				public class Victim: NSObject, NSSecureCoding, NSCopying, JSONCoding {
					
					
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
						guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
						
						allianceID = dictionary["allianceID"] as? Int64
						allianceName = dictionary["allianceName"] as? String
						guard let characterID = dictionary["characterID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.characterID = characterID
						guard let characterName = dictionary["characterName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.characterName = characterName
						guard let corporationID = dictionary["corporationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.corporationID = corporationID
						guard let corporationName = dictionary["corporationName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.corporationName = corporationName
						guard let damageTaken = dictionary["damageTaken"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.damageTaken = damageTaken
						factionID = dictionary["factionID"] as? Int
						factionName = dictionary["factionName"] as? String
						guard let shipTypeID = dictionary["shipTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.shipTypeID = shipTypeID
						guard let x = dictionary["x"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.x = x
						guard let y = dictionary["y"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.y = y
						guard let z = dictionary["z"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
						self.z = z
						
						super.init()
					}
					
					override public init() {
						super.init()
					}
					
					public required init?(coder aDecoder: NSCoder) {
						allianceID = aDecoder.containsValue(forKey: "allianceID") ? aDecoder.decodeInt64(forKey: "allianceID") : nil
						allianceName = aDecoder.decodeObject(forKey: "allianceName") as? String
						characterID = aDecoder.decodeInt64(forKey: "characterID")
						characterName = aDecoder.decodeObject(forKey: "characterName") as? String ?? String()
						corporationID = aDecoder.decodeInt64(forKey: "corporationID")
						corporationName = aDecoder.decodeObject(forKey: "corporationName") as? String ?? String()
						damageTaken = aDecoder.decodeInt64(forKey: "damageTaken")
						factionID = aDecoder.containsValue(forKey: "factionID") ? aDecoder.decodeInteger(forKey: "factionID") : nil
						factionName = aDecoder.decodeObject(forKey: "factionName") as? String
						shipTypeID = aDecoder.decodeInteger(forKey: "shipTypeID")
						x = aDecoder.decodeDouble(forKey: "x")
						y = aDecoder.decodeDouble(forKey: "y")
						z = aDecoder.decodeDouble(forKey: "z")
						
						super.init()
					}
					
					public func encode(with aCoder: NSCoder) {
						if let v = allianceID {
							aCoder.encode(v, forKey: "allianceID")
						}
						if let v = allianceName {
							aCoder.encode(v, forKey: "allianceName")
						}
						aCoder.encode(characterID, forKey: "characterID")
						aCoder.encode(characterName, forKey: "characterName")
						aCoder.encode(corporationID, forKey: "corporationID")
						aCoder.encode(corporationName, forKey: "corporationName")
						aCoder.encode(damageTaken, forKey: "damageTaken")
						if let v = factionID {
							aCoder.encode(v, forKey: "factionID")
						}
						if let v = factionName {
							aCoder.encode(v, forKey: "factionName")
						}
						aCoder.encode(shipTypeID, forKey: "shipTypeID")
						aCoder.encode(x, forKey: "x")
						aCoder.encode(y, forKey: "y")
						aCoder.encode(z, forKey: "z")
					}
					
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
					
					override public var hashValue: Int {
						var hash: Int = 0
						hashCombine(seed: &hash, value: allianceID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: allianceName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: characterID.hashValue)
						hashCombine(seed: &hash, value: characterName.hashValue)
						hashCombine(seed: &hash, value: corporationID.hashValue)
						hashCombine(seed: &hash, value: corporationName.hashValue)
						hashCombine(seed: &hash, value: damageTaken.hashValue)
						hashCombine(seed: &hash, value: factionID?.hashValue ?? 0)
						hashCombine(seed: &hash, value: factionName?.hashValue ?? 0)
						hashCombine(seed: &hash, value: shipTypeID.hashValue)
						hashCombine(seed: &hash, value: x.hashValue)
						hashCombine(seed: &hash, value: y.hashValue)
						hashCombine(seed: &hash, value: z.hashValue)
						return hash
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let attackers = try dictionary.rowset(name: "attackers")?.map ({try EVE.Char.KillMails.Kill.Attacker(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.attackers = attackers
					guard let items = try dictionary.rowset(name: "items")?.map ({try EVE.Char.KillMails.Kill.Item(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.items = items
					guard let killID = dictionary["killID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.killID = killID
					guard let killTime = DateFormatter.eveDateFormatter.date(from: dictionary["killTime"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.killTime = killTime
					guard let moonID = dictionary["moonID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.moonID = moonID
					guard let solarSystemID = dictionary["solarSystemID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.solarSystemID = solarSystemID
					victim = try EVE.Char.KillMails.Kill.Victim(json: dictionary["victim"] as? [String: Any] ?? [:])
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					attackers = aDecoder.decodeObject(of: [EVE.Char.KillMails.Kill.Attacker.self], forKey: "attackers") as? [EVE.Char.KillMails.Kill.Attacker] ?? []
					items = aDecoder.decodeObject(of: [EVE.Char.KillMails.Kill.Item.self], forKey: "items") as? [EVE.Char.KillMails.Kill.Item] ?? []
					killID = aDecoder.decodeInt64(forKey: "killID")
					killTime = aDecoder.decodeObject(forKey: "killTime") as? Date ?? Date()
					moonID = aDecoder.decodeInteger(forKey: "moonID")
					solarSystemID = aDecoder.decodeInteger(forKey: "solarSystemID")
					victim = aDecoder.decodeObject(of: EVE.Char.KillMails.Kill.Victim.self, forKey: "victim")  ?? EVE.Char.KillMails.Kill.Victim()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(attackers, forKey: "attackers")
					aCoder.encode(items, forKey: "items")
					aCoder.encode(killID, forKey: "killID")
					aCoder.encode(killTime, forKey: "killTime")
					aCoder.encode(moonID, forKey: "moonID")
					aCoder.encode(solarSystemID, forKey: "solarSystemID")
					aCoder.encode(victim, forKey: "victim")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					attackers.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					items.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
					hashCombine(seed: &hash, value: killID.hashValue)
					hashCombine(seed: &hash, value: killTime.hashValue)
					hashCombine(seed: &hash, value: moonID.hashValue)
					hashCombine(seed: &hash, value: solarSystemID.hashValue)
					hashCombine(seed: &hash, value: victim.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let kills = try dictionary.rowset(name: "kills")?.map ({try EVE.Char.KillMails.Kill(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.kills = kills
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				kills = aDecoder.decodeObject(of: [EVE.Char.KillMails.Kill.self], forKey: "kills") as? [EVE.Char.KillMails.Kill] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(kills, forKey: "kills")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["kills"] = kills.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				kills.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Locations: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Location: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var itemID: Int64 = Int64()
				public var itemName: String = String()
				public var x: Double = Double()
				public var y: Double = Double()
				public var z: Double = Double()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let itemID = dictionary["itemID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.itemID = itemID
					guard let itemName = dictionary["itemName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.itemName = itemName
					guard let x = dictionary["x"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.x = x
					guard let y = dictionary["y"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.y = y
					guard let z = dictionary["z"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.z = z
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					itemID = aDecoder.decodeInt64(forKey: "itemID")
					itemName = aDecoder.decodeObject(forKey: "itemName") as? String ?? String()
					x = aDecoder.decodeDouble(forKey: "x")
					y = aDecoder.decodeDouble(forKey: "y")
					z = aDecoder.decodeDouble(forKey: "z")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(itemID, forKey: "itemID")
					aCoder.encode(itemName, forKey: "itemName")
					aCoder.encode(x, forKey: "x")
					aCoder.encode(y, forKey: "y")
					aCoder.encode(z, forKey: "z")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["itemID"] = itemID.json
					json["itemName"] = itemName.json
					json["x"] = x.json
					json["y"] = y.json
					json["z"] = z.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: itemID.hashValue)
					hashCombine(seed: &hash, value: itemName.hashValue)
					hashCombine(seed: &hash, value: x.hashValue)
					hashCombine(seed: &hash, value: y.hashValue)
					hashCombine(seed: &hash, value: z.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let locations = try dictionary.rowset(name: "locations")?.map ({try EVE.Char.Locations.Location(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.locations = locations
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				locations = aDecoder.decodeObject(of: [EVE.Char.Locations.Location.self], forKey: "locations") as? [EVE.Char.Locations.Location] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(locations, forKey: "locations")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["locations"] = locations.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				locations.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class MailBodies: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Message: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var messageID: Int64 = Int64()
				public var text: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let messageID = dictionary["messageID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.messageID = messageID
					guard let text = dictionary["_"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.text = text
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					messageID = aDecoder.decodeInt64(forKey: "messageID")
					text = aDecoder.decodeObject(forKey: "_") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(messageID, forKey: "messageID")
					aCoder.encode(text, forKey: "_")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["messageID"] = messageID.json
					json["text"] = text.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: messageID.hashValue)
					hashCombine(seed: &hash, value: text.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let messages = try dictionary.rowset(name: "messages")?.map ({try EVE.Char.MailBodies.Message(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.messages = messages
				guard let missingMessageIDs = dictionary["missingMessageIDs"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.missingMessageIDs = missingMessageIDs
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				messages = aDecoder.decodeObject(of: [EVE.Char.MailBodies.Message.self], forKey: "messages") as? [EVE.Char.MailBodies.Message] ?? []
				missingMessageIDs = aDecoder.decodeObject(forKey: "missingMessageIDs") as? String ?? String()
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(messages, forKey: "messages")
				aCoder.encode(missingMessageIDs, forKey: "missingMessageIDs")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["messages"] = messages.json
				json["missingMessageIDs"] = missingMessageIDs.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				messages.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				hashCombine(seed: &hash, value: missingMessageIDs.hashValue)
				return hash
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
		
		
		public class MailingLists: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class MailingList: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var displayName: String = String()
				public var listID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let displayName = dictionary["displayName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.displayName = displayName
					guard let listID = dictionary["listID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.listID = listID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					displayName = aDecoder.decodeObject(forKey: "displayName") as? String ?? String()
					listID = aDecoder.decodeInteger(forKey: "listID")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(displayName, forKey: "displayName")
					aCoder.encode(listID, forKey: "listID")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["displayName"] = displayName.json
					json["listID"] = listID.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: displayName.hashValue)
					hashCombine(seed: &hash, value: listID.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let mailingLists = try dictionary.rowset(name: "mailingLists")?.map ({try EVE.Char.MailingLists.MailingList(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.mailingLists = mailingLists
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				mailingLists = aDecoder.decodeObject(of: [EVE.Char.MailingLists.MailingList.self], forKey: "mailingLists") as? [EVE.Char.MailingLists.MailingList] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(mailingLists, forKey: "mailingLists")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["mailingLists"] = mailingLists.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				mailingLists.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class MarketOrders: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Order: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum State: Int, JSONCoding {
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
						guard let s = json as? Int, let v = State(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let accountKey = dictionary["accountKey"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.accountKey = accountKey
					guard let bid = dictionary["bid"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.bid = bid
					guard let characterID = dictionary["charID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.characterID = characterID
					guard let duration = dictionary["duration"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.duration = duration
					guard let escrow = dictionary["escrow"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.escrow = escrow
					guard let issued = DateFormatter.eveDateFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.issued = issued
					guard let minVolume = dictionary["minVolume"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.minVolume = minVolume
					guard let orderID = dictionary["orderID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.orderID = orderID
					guard let orderState = EVE.Char.MarketOrders.Order.State(rawValue: dictionary["orderState"] as? Int ?? Int()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.orderState = orderState
					guard let price = dictionary["price"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.price = price
					guard let range = dictionary["range"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.range = range
					guard let stationID = dictionary["stationID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.stationID = stationID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					guard let volEntered = dictionary["volEntered"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.volEntered = volEntered
					guard let volRemaining = dictionary["volRemaining"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.volRemaining = volRemaining
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					accountKey = aDecoder.decodeInteger(forKey: "accountKey")
					bid = aDecoder.decodeBool(forKey: "bid")
					characterID = aDecoder.decodeInt64(forKey: "charID")
					duration = aDecoder.decodeInteger(forKey: "duration")
					escrow = aDecoder.decodeDouble(forKey: "escrow")
					issued = aDecoder.decodeObject(forKey: "issued") as? Date ?? Date()
					minVolume = aDecoder.decodeInt64(forKey: "minVolume")
					orderID = aDecoder.decodeInt64(forKey: "orderID")
					orderState = EVE.Char.MarketOrders.Order.State(rawValue: aDecoder.decodeObject(forKey: "orderState") as? Int ?? Int()) ?? EVE.Char.MarketOrders.Order.State()
					price = aDecoder.decodeDouble(forKey: "price")
					range = aDecoder.decodeInteger(forKey: "range")
					stationID = aDecoder.decodeInteger(forKey: "stationID")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					volEntered = aDecoder.decodeInt64(forKey: "volEntered")
					volRemaining = aDecoder.decodeInt64(forKey: "volRemaining")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(accountKey, forKey: "accountKey")
					aCoder.encode(bid, forKey: "bid")
					aCoder.encode(characterID, forKey: "charID")
					aCoder.encode(duration, forKey: "duration")
					aCoder.encode(escrow, forKey: "escrow")
					aCoder.encode(issued, forKey: "issued")
					aCoder.encode(minVolume, forKey: "minVolume")
					aCoder.encode(orderID, forKey: "orderID")
					aCoder.encode(orderState.rawValue, forKey: "orderState")
					aCoder.encode(price, forKey: "price")
					aCoder.encode(range, forKey: "range")
					aCoder.encode(stationID, forKey: "stationID")
					aCoder.encode(typeID, forKey: "typeID")
					aCoder.encode(volEntered, forKey: "volEntered")
					aCoder.encode(volRemaining, forKey: "volRemaining")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: accountKey.hashValue)
					hashCombine(seed: &hash, value: bid.hashValue)
					hashCombine(seed: &hash, value: characterID.hashValue)
					hashCombine(seed: &hash, value: duration.hashValue)
					hashCombine(seed: &hash, value: escrow.hashValue)
					hashCombine(seed: &hash, value: issued.hashValue)
					hashCombine(seed: &hash, value: minVolume.hashValue)
					hashCombine(seed: &hash, value: orderID.hashValue)
					hashCombine(seed: &hash, value: orderState.hashValue)
					hashCombine(seed: &hash, value: price.hashValue)
					hashCombine(seed: &hash, value: range.hashValue)
					hashCombine(seed: &hash, value: stationID.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					hashCombine(seed: &hash, value: volEntered.hashValue)
					hashCombine(seed: &hash, value: volRemaining.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let orders = try dictionary.rowset(name: "orders")?.map ({try EVE.Char.MarketOrders.Order(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.orders = orders
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				orders = aDecoder.decodeObject(of: [EVE.Char.MarketOrders.Order.self], forKey: "orders") as? [EVE.Char.MarketOrders.Order] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(orders, forKey: "orders")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["orders"] = orders.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				orders.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Medals: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Medal: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum Status: String, JSONCoding {
					case `private` = "private"
					case `public` = "public"
					
					public init() {
						self = .`private`
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = Status(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					corporationID = dictionary["corporationID"] as? Int64
					guard let issued = DateFormatter.eveDateFormatter.date(from: dictionary["issued"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.issued = issued
					guard let issuerID = dictionary["issuerID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.issuerID = issuerID
					medalDescription = dictionary["description"] as? String
					guard let medalID = dictionary["medalID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.medalID = medalID
					guard let reason = dictionary["reason"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.reason = reason
					guard let status = EVE.Char.Medals.Medal.Status(rawValue: dictionary["status"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.status = status
					title = dictionary["title"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					corporationID = aDecoder.containsValue(forKey: "corporationID") ? aDecoder.decodeInt64(forKey: "corporationID") : nil
					issued = aDecoder.decodeObject(forKey: "issued") as? Date ?? Date()
					issuerID = aDecoder.decodeInt64(forKey: "issuerID")
					medalDescription = aDecoder.decodeObject(forKey: "description") as? String
					medalID = aDecoder.decodeInteger(forKey: "medalID")
					reason = aDecoder.decodeObject(forKey: "reason") as? String ?? String()
					status = EVE.Char.Medals.Medal.Status(rawValue: aDecoder.decodeObject(forKey: "status") as? String ?? String()) ?? EVE.Char.Medals.Medal.Status()
					title = aDecoder.decodeObject(forKey: "title") as? String
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					if let v = corporationID {
						aCoder.encode(v, forKey: "corporationID")
					}
					aCoder.encode(issued, forKey: "issued")
					aCoder.encode(issuerID, forKey: "issuerID")
					if let v = medalDescription {
						aCoder.encode(v, forKey: "description")
					}
					aCoder.encode(medalID, forKey: "medalID")
					aCoder.encode(reason, forKey: "reason")
					aCoder.encode(status.rawValue, forKey: "status")
					if let v = title {
						aCoder.encode(v, forKey: "title")
					}
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: corporationID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: issued.hashValue)
					hashCombine(seed: &hash, value: issuerID.hashValue)
					hashCombine(seed: &hash, value: medalDescription?.hashValue ?? 0)
					hashCombine(seed: &hash, value: medalID.hashValue)
					hashCombine(seed: &hash, value: reason.hashValue)
					hashCombine(seed: &hash, value: status.hashValue)
					hashCombine(seed: &hash, value: title?.hashValue ?? 0)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let currentCorporation = try dictionary.rowset(name: "currentCorporation")?.map ({try EVE.Char.Medals.Medal(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.currentCorporation = currentCorporation
				guard let otherCorporations = try dictionary.rowset(name: "otherCorporations")?.map ({try EVE.Char.Medals.Medal(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.otherCorporations = otherCorporations
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				currentCorporation = aDecoder.decodeObject(of: [EVE.Char.Medals.Medal.self], forKey: "currentCorporation") as? [EVE.Char.Medals.Medal] ?? []
				otherCorporations = aDecoder.decodeObject(of: [EVE.Char.Medals.Medal.self], forKey: "otherCorporations") as? [EVE.Char.Medals.Medal] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(currentCorporation, forKey: "currentCorporation")
				aCoder.encode(otherCorporations, forKey: "otherCorporations")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["currentCorporation"] = currentCorporation.json
				json["otherCorporations"] = otherCorporations.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				currentCorporation.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				otherCorporations.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Messages: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Message: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let messageID = dictionary["messageID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.messageID = messageID
					guard let senderID = dictionary["senderID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.senderID = senderID
					guard let senderName = dictionary["senderName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.senderName = senderName
					guard let sentDate = DateFormatter.eveDateFormatter.date(from: dictionary["sentDate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.sentDate = sentDate
					guard let title = dictionary["title"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.title = title
					toCharacterIDs = dictionary["toCharacterIDs"] as? String
					toCorpOrAllianceID = dictionary["toCorpOrAllianceID"] as? Int
					toListID = dictionary["toListID"] as? String
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					messageID = aDecoder.decodeInt64(forKey: "messageID")
					senderID = aDecoder.decodeInt64(forKey: "senderID")
					senderName = aDecoder.decodeObject(forKey: "senderName") as? String ?? String()
					sentDate = aDecoder.decodeObject(forKey: "sentDate") as? Date ?? Date()
					title = aDecoder.decodeObject(forKey: "title") as? String ?? String()
					toCharacterIDs = aDecoder.decodeObject(forKey: "toCharacterIDs") as? String
					toCorpOrAllianceID = aDecoder.containsValue(forKey: "toCorpOrAllianceID") ? aDecoder.decodeInteger(forKey: "toCorpOrAllianceID") : nil
					toListID = aDecoder.decodeObject(forKey: "toListID") as? String
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(messageID, forKey: "messageID")
					aCoder.encode(senderID, forKey: "senderID")
					aCoder.encode(senderName, forKey: "senderName")
					aCoder.encode(sentDate, forKey: "sentDate")
					aCoder.encode(title, forKey: "title")
					if let v = toCharacterIDs {
						aCoder.encode(v, forKey: "toCharacterIDs")
					}
					if let v = toCorpOrAllianceID {
						aCoder.encode(v, forKey: "toCorpOrAllianceID")
					}
					if let v = toListID {
						aCoder.encode(v, forKey: "toListID")
					}
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: messageID.hashValue)
					hashCombine(seed: &hash, value: senderID.hashValue)
					hashCombine(seed: &hash, value: senderName.hashValue)
					hashCombine(seed: &hash, value: sentDate.hashValue)
					hashCombine(seed: &hash, value: title.hashValue)
					hashCombine(seed: &hash, value: toCharacterIDs?.hashValue ?? 0)
					hashCombine(seed: &hash, value: toCorpOrAllianceID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: toListID?.hashValue ?? 0)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let messages = try dictionary.rowset(name: "messages")?.map ({try EVE.Char.Messages.Message(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.messages = messages
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				messages = aDecoder.decodeObject(of: [EVE.Char.Messages.Message.self], forKey: "messages") as? [EVE.Char.Messages.Message] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(messages, forKey: "messages")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["messages"] = messages.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				messages.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class NotificationTexts: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Notification: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var notificationID: Int64 = Int64()
				public var text: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let notificationID = dictionary["notificationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.notificationID = notificationID
					guard let text = dictionary["_"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.text = text
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					notificationID = aDecoder.decodeInt64(forKey: "notificationID")
					text = aDecoder.decodeObject(forKey: "_") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(notificationID, forKey: "notificationID")
					aCoder.encode(text, forKey: "_")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["notificationID"] = notificationID.json
					json["text"] = text.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: notificationID.hashValue)
					hashCombine(seed: &hash, value: text.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				missindIDs = dictionary["missindIDs"] as? String
				guard let notifications = try dictionary.rowset(name: "notifications")?.map ({try EVE.Char.NotificationTexts.Notification(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.notifications = notifications
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				missindIDs = aDecoder.decodeObject(forKey: "missindIDs") as? String
				notifications = aDecoder.decodeObject(of: [EVE.Char.NotificationTexts.Notification.self], forKey: "notifications") as? [EVE.Char.NotificationTexts.Notification] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = missindIDs {
					aCoder.encode(v, forKey: "missindIDs")
				}
				aCoder.encode(notifications, forKey: "notifications")
			}
			
			public var json: Any {
				var json = [String: Any]()
				if let v = missindIDs?.json {
					json["missindIDs"] = v
				}
				json["notifications"] = notifications.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				hashCombine(seed: &hash, value: missindIDs?.hashValue ?? 0)
				notifications.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Notifications: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Notification: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum NotificationType: Int, JSONCoding {
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
						guard let s = json as? Int, let v = NotificationType(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let notificationID = dictionary["notificationID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.notificationID = notificationID
					guard let read = dictionary["read"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.read = read
					guard let senderID = dictionary["senderID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.senderID = senderID
					guard let senderName = dictionary["senderName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.senderName = senderName
					guard let sentDate = DateFormatter.eveDateFormatter.date(from: dictionary["sentDate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.sentDate = sentDate
					guard let type = EVE.Char.Notifications.Notification.NotificationType(rawValue: dictionary["typeID"] as? Int ?? Int()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.type = type
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					notificationID = aDecoder.decodeInt64(forKey: "notificationID")
					read = aDecoder.decodeBool(forKey: "read")
					senderID = aDecoder.decodeInt64(forKey: "senderID")
					senderName = aDecoder.decodeObject(forKey: "senderName") as? String ?? String()
					sentDate = aDecoder.decodeObject(forKey: "sentDate") as? Date ?? Date()
					type = EVE.Char.Notifications.Notification.NotificationType(rawValue: aDecoder.decodeObject(forKey: "typeID") as? Int ?? Int()) ?? EVE.Char.Notifications.Notification.NotificationType()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(notificationID, forKey: "notificationID")
					aCoder.encode(read, forKey: "read")
					aCoder.encode(senderID, forKey: "senderID")
					aCoder.encode(senderName, forKey: "senderName")
					aCoder.encode(sentDate, forKey: "sentDate")
					aCoder.encode(type.rawValue, forKey: "typeID")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: notificationID.hashValue)
					hashCombine(seed: &hash, value: read.hashValue)
					hashCombine(seed: &hash, value: senderID.hashValue)
					hashCombine(seed: &hash, value: senderName.hashValue)
					hashCombine(seed: &hash, value: sentDate.hashValue)
					hashCombine(seed: &hash, value: type.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let notifications = try dictionary.rowset(name: "notifications")?.map ({try EVE.Char.Notifications.Notification(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.notifications = notifications
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				notifications = aDecoder.decodeObject(of: [EVE.Char.Notifications.Notification.self], forKey: "notifications") as? [EVE.Char.Notifications.Notification] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(notifications, forKey: "notifications")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["notifications"] = notifications.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				notifications.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class PlanetaryColonies: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Colony: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let lastUpdate = DateFormatter.eveDateFormatter.date(from: dictionary["lastUpdate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.lastUpdate = lastUpdate
					guard let numberOfPins = dictionary["numberOfPins"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.numberOfPins = numberOfPins
					guard let ownerID = dictionary["ownerID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.ownerID = ownerID
					guard let ownerName = dictionary["ownerName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.ownerName = ownerName
					guard let planetID = dictionary["planetID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.planetID = planetID
					guard let planetName = dictionary["planetName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.planetName = planetName
					guard let planetTypeID = dictionary["planetTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.planetTypeID = planetTypeID
					guard let planetTypeName = dictionary["planetTypeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.planetTypeName = planetTypeName
					guard let solarSystemID = dictionary["solarSystemID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.solarSystemID = solarSystemID
					guard let solarSystemName = dictionary["solarSystemName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.solarSystemName = solarSystemName
					guard let upgradeLevel = dictionary["upgradeLevel"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.upgradeLevel = upgradeLevel
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					lastUpdate = aDecoder.decodeObject(forKey: "lastUpdate") as? Date ?? Date()
					numberOfPins = aDecoder.decodeInteger(forKey: "numberOfPins")
					ownerID = aDecoder.decodeInt64(forKey: "ownerID")
					ownerName = aDecoder.decodeObject(forKey: "ownerName") as? String ?? String()
					planetID = aDecoder.decodeInteger(forKey: "planetID")
					planetName = aDecoder.decodeObject(forKey: "planetName") as? String ?? String()
					planetTypeID = aDecoder.decodeInteger(forKey: "planetTypeID")
					planetTypeName = aDecoder.decodeObject(forKey: "planetTypeName") as? String ?? String()
					solarSystemID = aDecoder.decodeInteger(forKey: "solarSystemID")
					solarSystemName = aDecoder.decodeObject(forKey: "solarSystemName") as? String ?? String()
					upgradeLevel = aDecoder.decodeInteger(forKey: "upgradeLevel")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(lastUpdate, forKey: "lastUpdate")
					aCoder.encode(numberOfPins, forKey: "numberOfPins")
					aCoder.encode(ownerID, forKey: "ownerID")
					aCoder.encode(ownerName, forKey: "ownerName")
					aCoder.encode(planetID, forKey: "planetID")
					aCoder.encode(planetName, forKey: "planetName")
					aCoder.encode(planetTypeID, forKey: "planetTypeID")
					aCoder.encode(planetTypeName, forKey: "planetTypeName")
					aCoder.encode(solarSystemID, forKey: "solarSystemID")
					aCoder.encode(solarSystemName, forKey: "solarSystemName")
					aCoder.encode(upgradeLevel, forKey: "upgradeLevel")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: lastUpdate.hashValue)
					hashCombine(seed: &hash, value: numberOfPins.hashValue)
					hashCombine(seed: &hash, value: ownerID.hashValue)
					hashCombine(seed: &hash, value: ownerName.hashValue)
					hashCombine(seed: &hash, value: planetID.hashValue)
					hashCombine(seed: &hash, value: planetName.hashValue)
					hashCombine(seed: &hash, value: planetTypeID.hashValue)
					hashCombine(seed: &hash, value: planetTypeName.hashValue)
					hashCombine(seed: &hash, value: solarSystemID.hashValue)
					hashCombine(seed: &hash, value: solarSystemName.hashValue)
					hashCombine(seed: &hash, value: upgradeLevel.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let colonies = try dictionary.rowset(name: "colonies")?.map ({try EVE.Char.PlanetaryColonies.Colony(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.colonies = colonies
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				colonies = aDecoder.decodeObject(of: [EVE.Char.PlanetaryColonies.Colony.self], forKey: "colonies") as? [EVE.Char.PlanetaryColonies.Colony] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(colonies, forKey: "colonies")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["colonies"] = colonies.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				colonies.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class PlanetaryLinks: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Link: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var destinationPinID: Int64 = Int64()
				public var linkLevel: Int = Int()
				public var sourcePinID: Int64 = Int64()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let destinationPinID = dictionary["destinationPinID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.destinationPinID = destinationPinID
					guard let linkLevel = dictionary["linkLevel"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.linkLevel = linkLevel
					guard let sourcePinID = dictionary["sourcePinID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.sourcePinID = sourcePinID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					destinationPinID = aDecoder.decodeInt64(forKey: "destinationPinID")
					linkLevel = aDecoder.decodeInteger(forKey: "linkLevel")
					sourcePinID = aDecoder.decodeInt64(forKey: "sourcePinID")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(destinationPinID, forKey: "destinationPinID")
					aCoder.encode(linkLevel, forKey: "linkLevel")
					aCoder.encode(sourcePinID, forKey: "sourcePinID")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["destinationPinID"] = destinationPinID.json
					json["linkLevel"] = linkLevel.json
					json["sourcePinID"] = sourcePinID.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: destinationPinID.hashValue)
					hashCombine(seed: &hash, value: linkLevel.hashValue)
					hashCombine(seed: &hash, value: sourcePinID.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let links = try dictionary.rowset(name: "links")?.map ({try EVE.Char.PlanetaryLinks.Link(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.links = links
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				links = aDecoder.decodeObject(of: [EVE.Char.PlanetaryLinks.Link.self], forKey: "links") as? [EVE.Char.PlanetaryLinks.Link] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(links, forKey: "links")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["links"] = links.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				links.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class PlanetaryPins: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Pin: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let contentQuantity = dictionary["contentQuantity"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.contentQuantity = contentQuantity
					guard let contentTypeID = dictionary["contentTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.contentTypeID = contentTypeID
					guard let contentTypeName = dictionary["contentTypeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.contentTypeName = contentTypeName
					guard let cycleTime = dictionary["cycleTime"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.cycleTime = cycleTime
					expiryTime = DateFormatter.eveDateFormatter.date(from: dictionary["expiryTime"] as? String ?? "")
					installTime = DateFormatter.eveDateFormatter.date(from: dictionary["installTime"] as? String ?? "")
					lastLaunchTime = DateFormatter.eveDateFormatter.date(from: dictionary["lastLaunchTime"] as? String ?? "")
					guard let latitude = dictionary["latitude"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.latitude = latitude
					guard let longitude = dictionary["longitude"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.longitude = longitude
					guard let pinID = dictionary["pinID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.pinID = pinID
					guard let quantityPerCycle = dictionary["quantityPerCycle"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.quantityPerCycle = quantityPerCycle
					guard let schematicID = dictionary["schematicID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.schematicID = schematicID
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					contentQuantity = aDecoder.decodeInteger(forKey: "contentQuantity")
					contentTypeID = aDecoder.decodeInteger(forKey: "contentTypeID")
					contentTypeName = aDecoder.decodeObject(forKey: "contentTypeName") as? String ?? String()
					cycleTime = aDecoder.decodeInteger(forKey: "cycleTime")
					expiryTime = aDecoder.decodeObject(forKey: "expiryTime") as? Date
					installTime = aDecoder.decodeObject(forKey: "installTime") as? Date
					lastLaunchTime = aDecoder.decodeObject(forKey: "lastLaunchTime") as? Date
					latitude = aDecoder.decodeDouble(forKey: "latitude")
					longitude = aDecoder.decodeDouble(forKey: "longitude")
					pinID = aDecoder.decodeInt64(forKey: "pinID")
					quantityPerCycle = aDecoder.decodeInteger(forKey: "quantityPerCycle")
					schematicID = aDecoder.decodeInteger(forKey: "schematicID")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					typeName = aDecoder.decodeObject(forKey: "typeName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(contentQuantity, forKey: "contentQuantity")
					aCoder.encode(contentTypeID, forKey: "contentTypeID")
					aCoder.encode(contentTypeName, forKey: "contentTypeName")
					aCoder.encode(cycleTime, forKey: "cycleTime")
					if let v = expiryTime {
						aCoder.encode(v, forKey: "expiryTime")
					}
					if let v = installTime {
						aCoder.encode(v, forKey: "installTime")
					}
					if let v = lastLaunchTime {
						aCoder.encode(v, forKey: "lastLaunchTime")
					}
					aCoder.encode(latitude, forKey: "latitude")
					aCoder.encode(longitude, forKey: "longitude")
					aCoder.encode(pinID, forKey: "pinID")
					aCoder.encode(quantityPerCycle, forKey: "quantityPerCycle")
					aCoder.encode(schematicID, forKey: "schematicID")
					aCoder.encode(typeID, forKey: "typeID")
					aCoder.encode(typeName, forKey: "typeName")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: contentQuantity.hashValue)
					hashCombine(seed: &hash, value: contentTypeID.hashValue)
					hashCombine(seed: &hash, value: contentTypeName.hashValue)
					hashCombine(seed: &hash, value: cycleTime.hashValue)
					hashCombine(seed: &hash, value: expiryTime?.hashValue ?? 0)
					hashCombine(seed: &hash, value: installTime?.hashValue ?? 0)
					hashCombine(seed: &hash, value: lastLaunchTime?.hashValue ?? 0)
					hashCombine(seed: &hash, value: latitude.hashValue)
					hashCombine(seed: &hash, value: longitude.hashValue)
					hashCombine(seed: &hash, value: pinID.hashValue)
					hashCombine(seed: &hash, value: quantityPerCycle.hashValue)
					hashCombine(seed: &hash, value: schematicID.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					hashCombine(seed: &hash, value: typeName.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let pins = try dictionary.rowset(name: "pins")?.map ({try EVE.Char.PlanetaryPins.Pin(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.pins = pins
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				pins = aDecoder.decodeObject(of: [EVE.Char.PlanetaryPins.Pin.self], forKey: "pins") as? [EVE.Char.PlanetaryPins.Pin] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(pins, forKey: "pins")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["pins"] = pins.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				pins.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class PlanetaryRoutes: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Route: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let contentTypeID = dictionary["contentTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.contentTypeID = contentTypeID
					guard let contentTypeName = dictionary["contentTypeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.contentTypeName = contentTypeName
					guard let destinationPinID = dictionary["destinationPinID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.destinationPinID = destinationPinID
					guard let quantity = dictionary["quantity"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.quantity = quantity
					guard let routeID = dictionary["routeID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.routeID = routeID
					guard let sourcePinID = dictionary["sourcePinID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.sourcePinID = sourcePinID
					guard let waypoint1 = dictionary["waypoint1"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.waypoint1 = waypoint1
					guard let waypoint2 = dictionary["waypoint2"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.waypoint2 = waypoint2
					guard let waypoint3 = dictionary["waypoint3"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.waypoint3 = waypoint3
					guard let waypoint4 = dictionary["waypoint4"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.waypoint4 = waypoint4
					guard let waypoint5 = dictionary["waypoint5"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.waypoint5 = waypoint5
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					contentTypeID = aDecoder.decodeInteger(forKey: "contentTypeID")
					contentTypeName = aDecoder.decodeObject(forKey: "contentTypeName") as? String ?? String()
					destinationPinID = aDecoder.decodeInt64(forKey: "destinationPinID")
					quantity = aDecoder.decodeInteger(forKey: "quantity")
					routeID = aDecoder.decodeInt64(forKey: "routeID")
					sourcePinID = aDecoder.decodeInt64(forKey: "sourcePinID")
					waypoint1 = aDecoder.decodeInt64(forKey: "waypoint1")
					waypoint2 = aDecoder.decodeInt64(forKey: "waypoint2")
					waypoint3 = aDecoder.decodeInt64(forKey: "waypoint3")
					waypoint4 = aDecoder.decodeInt64(forKey: "waypoint4")
					waypoint5 = aDecoder.decodeInt64(forKey: "waypoint5")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(contentTypeID, forKey: "contentTypeID")
					aCoder.encode(contentTypeName, forKey: "contentTypeName")
					aCoder.encode(destinationPinID, forKey: "destinationPinID")
					aCoder.encode(quantity, forKey: "quantity")
					aCoder.encode(routeID, forKey: "routeID")
					aCoder.encode(sourcePinID, forKey: "sourcePinID")
					aCoder.encode(waypoint1, forKey: "waypoint1")
					aCoder.encode(waypoint2, forKey: "waypoint2")
					aCoder.encode(waypoint3, forKey: "waypoint3")
					aCoder.encode(waypoint4, forKey: "waypoint4")
					aCoder.encode(waypoint5, forKey: "waypoint5")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: contentTypeID.hashValue)
					hashCombine(seed: &hash, value: contentTypeName.hashValue)
					hashCombine(seed: &hash, value: destinationPinID.hashValue)
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: routeID.hashValue)
					hashCombine(seed: &hash, value: sourcePinID.hashValue)
					hashCombine(seed: &hash, value: waypoint1.hashValue)
					hashCombine(seed: &hash, value: waypoint2.hashValue)
					hashCombine(seed: &hash, value: waypoint3.hashValue)
					hashCombine(seed: &hash, value: waypoint4.hashValue)
					hashCombine(seed: &hash, value: waypoint5.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let routes = try dictionary.rowset(name: "routes")?.map ({try EVE.Char.PlanetaryRoutes.Route(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.routes = routes
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				routes = aDecoder.decodeObject(of: [EVE.Char.PlanetaryRoutes.Route.self], forKey: "routes") as? [EVE.Char.PlanetaryRoutes.Route] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(routes, forKey: "routes")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["routes"] = routes.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				routes.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Research: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Research: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var agentID: Int = Int()
				public var pointsPerDay: Float = Float()
				public var remainderPoints: Float = Float()
				public var researchStartDate: Date = Date()
				public var skillTypeID: Int = Int()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let agentID = dictionary["agentID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.agentID = agentID
					guard let pointsPerDay = dictionary["pointsPerDay"] as? Float else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.pointsPerDay = pointsPerDay
					guard let remainderPoints = dictionary["remainderPoints"] as? Float else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.remainderPoints = remainderPoints
					guard let researchStartDate = DateFormatter.eveDateFormatter.date(from: dictionary["researchStartDate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.researchStartDate = researchStartDate
					guard let skillTypeID = dictionary["skillTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.skillTypeID = skillTypeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					agentID = aDecoder.decodeInteger(forKey: "agentID")
					pointsPerDay = aDecoder.decodeFloat(forKey: "pointsPerDay")
					remainderPoints = aDecoder.decodeFloat(forKey: "remainderPoints")
					researchStartDate = aDecoder.decodeObject(forKey: "researchStartDate") as? Date ?? Date()
					skillTypeID = aDecoder.decodeInteger(forKey: "skillTypeID")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(agentID, forKey: "agentID")
					aCoder.encode(pointsPerDay, forKey: "pointsPerDay")
					aCoder.encode(remainderPoints, forKey: "remainderPoints")
					aCoder.encode(researchStartDate, forKey: "researchStartDate")
					aCoder.encode(skillTypeID, forKey: "skillTypeID")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["agentID"] = agentID.json
					json["pointsPerDay"] = pointsPerDay.json
					json["remainderPoints"] = remainderPoints.json
					json["researchStartDate"] = researchStartDate.json
					json["skillTypeID"] = skillTypeID.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: agentID.hashValue)
					hashCombine(seed: &hash, value: pointsPerDay.hashValue)
					hashCombine(seed: &hash, value: remainderPoints.hashValue)
					hashCombine(seed: &hash, value: researchStartDate.hashValue)
					hashCombine(seed: &hash, value: skillTypeID.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let research = try dictionary.rowset(name: "research")?.map ({try EVE.Char.Research(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.research = research
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				research = aDecoder.decodeObject(of: [EVE.Char.Research.self], forKey: "research") as? [EVE.Char.Research] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(research, forKey: "research")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["research"] = research.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				research.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class SkillQueue: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Skill: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let endSP = dictionary["endSP"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.endSP = endSP
					guard let endTime = DateFormatter.eveDateFormatter.date(from: dictionary["endTime"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.endTime = endTime
					guard let level = dictionary["level"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.level = level
					guard let queuePosition = dictionary["queuePosition"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.queuePosition = queuePosition
					guard let startSP = dictionary["startSP"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.startSP = startSP
					guard let startTime = DateFormatter.eveDateFormatter.date(from: dictionary["startTime"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.startTime = startTime
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					endSP = aDecoder.decodeInteger(forKey: "endSP")
					endTime = aDecoder.decodeObject(forKey: "endTime") as? Date ?? Date()
					level = aDecoder.decodeInteger(forKey: "level")
					queuePosition = aDecoder.decodeInteger(forKey: "queuePosition")
					startSP = aDecoder.decodeInteger(forKey: "startSP")
					startTime = aDecoder.decodeObject(forKey: "startTime") as? Date ?? Date()
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(endSP, forKey: "endSP")
					aCoder.encode(endTime, forKey: "endTime")
					aCoder.encode(level, forKey: "level")
					aCoder.encode(queuePosition, forKey: "queuePosition")
					aCoder.encode(startSP, forKey: "startSP")
					aCoder.encode(startTime, forKey: "startTime")
					aCoder.encode(typeID, forKey: "typeID")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: endSP.hashValue)
					hashCombine(seed: &hash, value: endTime.hashValue)
					hashCombine(seed: &hash, value: level.hashValue)
					hashCombine(seed: &hash, value: queuePosition.hashValue)
					hashCombine(seed: &hash, value: startSP.hashValue)
					hashCombine(seed: &hash, value: startTime.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let skillQueue = try dictionary.rowset(name: "skillqueue")?.map ({try EVE.Char.SkillQueue.Skill(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.skillQueue = skillQueue
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				skillQueue = aDecoder.decodeObject(of: [EVE.Char.SkillQueue.Skill.self], forKey: "skillqueue") as? [EVE.Char.SkillQueue.Skill] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(skillQueue, forKey: "skillqueue")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["skillQueue"] = skillQueue.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				skillQueue.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Skills: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Skill: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var level: Int = Int()
				public var published: Bool = Bool()
				public var skillpoints: Int = Int()
				public var typeID: Int = Int()
				public var typeName: String = String()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let level = dictionary["level"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.level = level
					guard let published = dictionary["published"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.published = published
					guard let skillpoints = dictionary["skillpoints"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.skillpoints = skillpoints
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					level = aDecoder.decodeInteger(forKey: "level")
					published = aDecoder.decodeBool(forKey: "published")
					skillpoints = aDecoder.decodeInteger(forKey: "skillpoints")
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					typeName = aDecoder.decodeObject(forKey: "typeName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(level, forKey: "level")
					aCoder.encode(published, forKey: "published")
					aCoder.encode(skillpoints, forKey: "skillpoints")
					aCoder.encode(typeID, forKey: "typeID")
					aCoder.encode(typeName, forKey: "typeName")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["level"] = level.json
					json["published"] = published.json
					json["skillpoints"] = skillpoints.json
					json["typeID"] = typeID.json
					json["typeName"] = typeName.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: level.hashValue)
					hashCombine(seed: &hash, value: published.hashValue)
					hashCombine(seed: &hash, value: skillpoints.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					hashCombine(seed: &hash, value: typeName.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let skills = try dictionary.rowset(name: "skills")?.map ({try EVE.Char.Skills.Skill(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.skills = skills
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				skills = aDecoder.decodeObject(of: [EVE.Char.Skills.Skill.self], forKey: "skills") as? [EVE.Char.Skills.Skill] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(skills, forKey: "skills")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["skills"] = skills.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				skills.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class Standings: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Standing: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
				public var fromID: Int64 = Int64()
				public var fromName: String = String()
				public var standing: Float = Float()
				
				public static var supportsSecureCoding: Bool {
					return true
				}
				
				public required init(json: Any) throws {
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let fromID = dictionary["fromID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.fromID = fromID
					guard let fromName = dictionary["fromName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.fromName = fromName
					guard let standing = dictionary["standing"] as? Float else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.standing = standing
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					fromID = aDecoder.decodeInt64(forKey: "fromID")
					fromName = aDecoder.decodeObject(forKey: "fromName") as? String ?? String()
					standing = aDecoder.decodeFloat(forKey: "standing")
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(fromID, forKey: "fromID")
					aCoder.encode(fromName, forKey: "fromName")
					aCoder.encode(standing, forKey: "standing")
				}
				
				public var json: Any {
					var json = [String: Any]()
					json["fromID"] = fromID.json
					json["fromName"] = fromName.json
					json["standing"] = standing.json
					return json
				}
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: fromID.hashValue)
					hashCombine(seed: &hash, value: fromName.hashValue)
					hashCombine(seed: &hash, value: standing.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				agents = try dictionary.rowset(name: "agents")?.map {try EVE.Char.Standings.Standing(json: $0)}
				factions = try dictionary.rowset(name: "factions")?.map {try EVE.Char.Standings.Standing(json: $0)}
				npcCorporations = try dictionary.rowset(name: "NPCCorporations")?.map {try EVE.Char.Standings.Standing(json: $0)}
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				agents = aDecoder.decodeObject(of: [EVE.Char.Standings.Standing.self], forKey: "agents") as? [EVE.Char.Standings.Standing]
				factions = aDecoder.decodeObject(of: [EVE.Char.Standings.Standing.self], forKey: "factions") as? [EVE.Char.Standings.Standing]
				npcCorporations = aDecoder.decodeObject(of: [EVE.Char.Standings.Standing.self], forKey: "NPCCorporations") as? [EVE.Char.Standings.Standing]
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				if let v = agents {
					aCoder.encode(v, forKey: "agents")
				}
				if let v = factions {
					aCoder.encode(v, forKey: "factions")
				}
				if let v = npcCorporations {
					aCoder.encode(v, forKey: "NPCCorporations")
				}
			}
			
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
			
			override public var hashValue: Int {
				var hash: Int = 0
				agents?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				factions?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				npcCorporations?.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class UpcomingCalendarEvents: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Event: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum Response: String, JSONCoding {
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
						guard let s = json as? String, let v = Response(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let duration = dictionary["duration"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.duration = duration
					guard let eventDate = DateFormatter.eveDateFormatter.date(from: dictionary["eventDate"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.eventDate = eventDate
					guard let eventID = dictionary["eventID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.eventID = eventID
					guard let eventText = dictionary["eventText"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.eventText = eventText
					guard let eventTitle = dictionary["eventTitle"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.eventTitle = eventTitle
					guard let importance = dictionary["importance"] as? Bool else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.importance = importance
					guard let ownerID = dictionary["ownerID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.ownerID = ownerID
					guard let ownerName = dictionary["ownerName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.ownerName = ownerName
					guard let response = EVE.Char.UpcomingCalendarEvents.Event.Response(rawValue: dictionary["response"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.response = response
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					duration = aDecoder.decodeInteger(forKey: "duration")
					eventDate = aDecoder.decodeObject(forKey: "eventDate") as? Date ?? Date()
					eventID = aDecoder.decodeInt64(forKey: "eventID")
					eventText = aDecoder.decodeObject(forKey: "eventText") as? String ?? String()
					eventTitle = aDecoder.decodeObject(forKey: "eventTitle") as? String ?? String()
					importance = aDecoder.decodeBool(forKey: "importance")
					ownerID = aDecoder.decodeInt64(forKey: "ownerID")
					ownerName = aDecoder.decodeObject(forKey: "ownerName") as? String ?? String()
					response = EVE.Char.UpcomingCalendarEvents.Event.Response(rawValue: aDecoder.decodeObject(forKey: "response") as? String ?? String()) ?? EVE.Char.UpcomingCalendarEvents.Event.Response()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(duration, forKey: "duration")
					aCoder.encode(eventDate, forKey: "eventDate")
					aCoder.encode(eventID, forKey: "eventID")
					aCoder.encode(eventText, forKey: "eventText")
					aCoder.encode(eventTitle, forKey: "eventTitle")
					aCoder.encode(importance, forKey: "importance")
					aCoder.encode(ownerID, forKey: "ownerID")
					aCoder.encode(ownerName, forKey: "ownerName")
					aCoder.encode(response.rawValue, forKey: "response")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: duration.hashValue)
					hashCombine(seed: &hash, value: eventDate.hashValue)
					hashCombine(seed: &hash, value: eventID.hashValue)
					hashCombine(seed: &hash, value: eventText.hashValue)
					hashCombine(seed: &hash, value: eventTitle.hashValue)
					hashCombine(seed: &hash, value: importance.hashValue)
					hashCombine(seed: &hash, value: ownerID.hashValue)
					hashCombine(seed: &hash, value: ownerName.hashValue)
					hashCombine(seed: &hash, value: response.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let upcomingEvents = try dictionary.rowset(name: "upcomingEvents")?.map ({try EVE.Char.UpcomingCalendarEvents.Event(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.upcomingEvents = upcomingEvents
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				upcomingEvents = aDecoder.decodeObject(of: [EVE.Char.UpcomingCalendarEvents.Event.self], forKey: "upcomingEvents") as? [EVE.Char.UpcomingCalendarEvents.Event] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(upcomingEvents, forKey: "upcomingEvents")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["upcomingEvents"] = upcomingEvents.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				upcomingEvents.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class WalletJournal: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Transaction: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let amount = dictionary["amount"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.amount = amount
					argID1 = dictionary["argID1"] as? Int
					argName1 = dictionary["argName1"] as? String
					guard let balance = dictionary["balance"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.balance = balance
					guard let date = DateFormatter.eveDateFormatter.date(from: dictionary["date"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.date = date
					owner1TypeID = dictionary["owner1TypeID"] as? Int
					owner2TypeID = dictionary["owner2TypeID"] as? Int
					ownerID1 = dictionary["ownerID1"] as? Int64
					ownerID2 = dictionary["ownerID2"] as? Int64
					ownerName1 = dictionary["ownerName1"] as? String
					ownerName2 = dictionary["ownerName2"] as? String
					reason = dictionary["reason"] as? String
					guard let refID = dictionary["refID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.refID = refID
					guard let refTypeID = dictionary["refTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.refTypeID = refTypeID
					taxAmount = dictionary["taxAmount"] as? Double
					taxReceiverID = dictionary["taxReceiverID"] as? Int64
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					amount = aDecoder.decodeDouble(forKey: "amount")
					argID1 = aDecoder.containsValue(forKey: "argID1") ? aDecoder.decodeInteger(forKey: "argID1") : nil
					argName1 = aDecoder.decodeObject(forKey: "argName1") as? String
					balance = aDecoder.decodeDouble(forKey: "balance")
					date = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
					owner1TypeID = aDecoder.containsValue(forKey: "owner1TypeID") ? aDecoder.decodeInteger(forKey: "owner1TypeID") : nil
					owner2TypeID = aDecoder.containsValue(forKey: "owner2TypeID") ? aDecoder.decodeInteger(forKey: "owner2TypeID") : nil
					ownerID1 = aDecoder.containsValue(forKey: "ownerID1") ? aDecoder.decodeInt64(forKey: "ownerID1") : nil
					ownerID2 = aDecoder.containsValue(forKey: "ownerID2") ? aDecoder.decodeInt64(forKey: "ownerID2") : nil
					ownerName1 = aDecoder.decodeObject(forKey: "ownerName1") as? String
					ownerName2 = aDecoder.decodeObject(forKey: "ownerName2") as? String
					reason = aDecoder.decodeObject(forKey: "reason") as? String
					refID = aDecoder.decodeInt64(forKey: "refID")
					refTypeID = aDecoder.decodeInteger(forKey: "refTypeID")
					taxAmount = aDecoder.containsValue(forKey: "taxAmount") ? aDecoder.decodeDouble(forKey: "taxAmount") : nil
					taxReceiverID = aDecoder.containsValue(forKey: "taxReceiverID") ? aDecoder.decodeInt64(forKey: "taxReceiverID") : nil
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(amount, forKey: "amount")
					if let v = argID1 {
						aCoder.encode(v, forKey: "argID1")
					}
					if let v = argName1 {
						aCoder.encode(v, forKey: "argName1")
					}
					aCoder.encode(balance, forKey: "balance")
					aCoder.encode(date, forKey: "date")
					if let v = owner1TypeID {
						aCoder.encode(v, forKey: "owner1TypeID")
					}
					if let v = owner2TypeID {
						aCoder.encode(v, forKey: "owner2TypeID")
					}
					if let v = ownerID1 {
						aCoder.encode(v, forKey: "ownerID1")
					}
					if let v = ownerID2 {
						aCoder.encode(v, forKey: "ownerID2")
					}
					if let v = ownerName1 {
						aCoder.encode(v, forKey: "ownerName1")
					}
					if let v = ownerName2 {
						aCoder.encode(v, forKey: "ownerName2")
					}
					if let v = reason {
						aCoder.encode(v, forKey: "reason")
					}
					aCoder.encode(refID, forKey: "refID")
					aCoder.encode(refTypeID, forKey: "refTypeID")
					if let v = taxAmount {
						aCoder.encode(v, forKey: "taxAmount")
					}
					if let v = taxReceiverID {
						aCoder.encode(v, forKey: "taxReceiverID")
					}
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: amount.hashValue)
					hashCombine(seed: &hash, value: argID1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: argName1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: balance.hashValue)
					hashCombine(seed: &hash, value: date.hashValue)
					hashCombine(seed: &hash, value: owner1TypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: owner2TypeID?.hashValue ?? 0)
					hashCombine(seed: &hash, value: ownerID1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: ownerID2?.hashValue ?? 0)
					hashCombine(seed: &hash, value: ownerName1?.hashValue ?? 0)
					hashCombine(seed: &hash, value: ownerName2?.hashValue ?? 0)
					hashCombine(seed: &hash, value: reason?.hashValue ?? 0)
					hashCombine(seed: &hash, value: refID.hashValue)
					hashCombine(seed: &hash, value: refTypeID.hashValue)
					hashCombine(seed: &hash, value: taxAmount?.hashValue ?? 0)
					hashCombine(seed: &hash, value: taxReceiverID?.hashValue ?? 0)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let transactions = try dictionary.rowset(name: "transactions")?.map ({try EVE.Char.WalletJournal.Transaction(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.transactions = transactions
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				transactions = aDecoder.decodeObject(of: [EVE.Char.WalletJournal.Transaction.self], forKey: "transactions") as? [EVE.Char.WalletJournal.Transaction] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(transactions, forKey: "transactions")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["transactions"] = transactions.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				transactions.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
		
		
		public class WalletTransactions: NSObject, NSSecureCoding, NSCopying, JSONCoding {
			
			public class Transaction: NSObject, NSSecureCoding, NSCopying, JSONCoding {
				
				public enum ClientType: String, JSONCoding {
					case corporate = "corporate"
					case personal = "personal"
					
					public init() {
						self = .corporate
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = ClientType(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
						self = v
					}
					
				}
				
				public enum TransactionType: String, JSONCoding {
					case buy = "buy"
					case sell = "sell"
					
					public init() {
						self = .buy
					}
					
					public var json: Any {
						return self.rawValue
					}
					
					public init(json: Any) throws {
						guard let s = json as? String, let v = TransactionType(rawValue: s) else {throw EVEError.invalidFormat(type(of: self), json)}
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
					guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
					
					guard let clientID = dictionary["clientID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.clientID = clientID
					guard let clientName = dictionary["clientName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.clientName = clientName
					guard let clientTypeID = dictionary["clientTypeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.clientTypeID = clientTypeID
					guard let journalTransactionID = dictionary["journalTransactionID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.journalTransactionID = journalTransactionID
					guard let price = dictionary["price"] as? Double else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.price = price
					guard let quantity = dictionary["quantity"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.quantity = quantity
					guard let stationID = dictionary["stationID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.stationID = stationID
					guard let stationName = dictionary["stationName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.stationName = stationName
					guard let transactionDateTime = DateFormatter.eveDateFormatter.date(from: dictionary["transactionDateTime"] as? String ?? "") else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.transactionDateTime = transactionDateTime
					guard let transactionFor = EVE.Char.WalletTransactions.Transaction.ClientType(rawValue: dictionary["transactionFor"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.transactionFor = transactionFor
					guard let transactionID = dictionary["transactionID"] as? Int64 else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.transactionID = transactionID
					guard let transactionType = EVE.Char.WalletTransactions.Transaction.TransactionType(rawValue: dictionary["transactionType"] as? String ?? String()) else {throw ESIError.invalidFormat(type(of: self), dictionary)}
					self.transactionType = transactionType
					guard let typeID = dictionary["typeID"] as? Int else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeID = typeID
					guard let typeName = dictionary["typeName"] as? String else {throw EVEError.invalidFormat(type(of: self), dictionary)}
					self.typeName = typeName
					
					super.init()
				}
				
				override public init() {
					super.init()
				}
				
				public required init?(coder aDecoder: NSCoder) {
					clientID = aDecoder.decodeInt64(forKey: "clientID")
					clientName = aDecoder.decodeObject(forKey: "clientName") as? String ?? String()
					clientTypeID = aDecoder.decodeInteger(forKey: "clientTypeID")
					journalTransactionID = aDecoder.decodeInt64(forKey: "journalTransactionID")
					price = aDecoder.decodeDouble(forKey: "price")
					quantity = aDecoder.decodeInt64(forKey: "quantity")
					stationID = aDecoder.decodeInteger(forKey: "stationID")
					stationName = aDecoder.decodeObject(forKey: "stationName") as? String ?? String()
					transactionDateTime = aDecoder.decodeObject(forKey: "transactionDateTime") as? Date ?? Date()
					transactionFor = EVE.Char.WalletTransactions.Transaction.ClientType(rawValue: aDecoder.decodeObject(forKey: "transactionFor") as? String ?? String()) ?? EVE.Char.WalletTransactions.Transaction.ClientType()
					transactionID = aDecoder.decodeInt64(forKey: "transactionID")
					transactionType = EVE.Char.WalletTransactions.Transaction.TransactionType(rawValue: aDecoder.decodeObject(forKey: "transactionType") as? String ?? String()) ?? EVE.Char.WalletTransactions.Transaction.TransactionType()
					typeID = aDecoder.decodeInteger(forKey: "typeID")
					typeName = aDecoder.decodeObject(forKey: "typeName") as? String ?? String()
					
					super.init()
				}
				
				public func encode(with aCoder: NSCoder) {
					aCoder.encode(clientID, forKey: "clientID")
					aCoder.encode(clientName, forKey: "clientName")
					aCoder.encode(clientTypeID, forKey: "clientTypeID")
					aCoder.encode(journalTransactionID, forKey: "journalTransactionID")
					aCoder.encode(price, forKey: "price")
					aCoder.encode(quantity, forKey: "quantity")
					aCoder.encode(stationID, forKey: "stationID")
					aCoder.encode(stationName, forKey: "stationName")
					aCoder.encode(transactionDateTime, forKey: "transactionDateTime")
					aCoder.encode(transactionFor.rawValue, forKey: "transactionFor")
					aCoder.encode(transactionID, forKey: "transactionID")
					aCoder.encode(transactionType.rawValue, forKey: "transactionType")
					aCoder.encode(typeID, forKey: "typeID")
					aCoder.encode(typeName, forKey: "typeName")
				}
				
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
				
				override public var hashValue: Int {
					var hash: Int = 0
					hashCombine(seed: &hash, value: clientID.hashValue)
					hashCombine(seed: &hash, value: clientName.hashValue)
					hashCombine(seed: &hash, value: clientTypeID.hashValue)
					hashCombine(seed: &hash, value: journalTransactionID.hashValue)
					hashCombine(seed: &hash, value: price.hashValue)
					hashCombine(seed: &hash, value: quantity.hashValue)
					hashCombine(seed: &hash, value: stationID.hashValue)
					hashCombine(seed: &hash, value: stationName.hashValue)
					hashCombine(seed: &hash, value: transactionDateTime.hashValue)
					hashCombine(seed: &hash, value: transactionFor.hashValue)
					hashCombine(seed: &hash, value: transactionID.hashValue)
					hashCombine(seed: &hash, value: transactionType.hashValue)
					hashCombine(seed: &hash, value: typeID.hashValue)
					hashCombine(seed: &hash, value: typeName.hashValue)
					return hash
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
				guard let dictionary = json as? [String: Any] else {throw ESIError.invalidFormat(type(of: self), json)}
				
				guard let transactions = try dictionary.rowset(name: "transactions")?.map ({try EVE.Char.WalletTransactions.Transaction(json: $0)}) else {throw EVEError.invalidFormat(type(of: self), dictionary)}
				self.transactions = transactions
				
				super.init()
			}
			
			override public init() {
				super.init()
			}
			
			public required init?(coder aDecoder: NSCoder) {
				transactions = aDecoder.decodeObject(of: [EVE.Char.WalletTransactions.Transaction.self], forKey: "transactions") as? [EVE.Char.WalletTransactions.Transaction] ?? []
				
				super.init()
			}
			
			public func encode(with aCoder: NSCoder) {
				aCoder.encode(transactions, forKey: "transactions")
			}
			
			public var json: Any {
				var json = [String: Any]()
				json["transactions"] = transactions.json
				return json
			}
			
			override public var hashValue: Int {
				var hash: Int = 0
				transactions.forEach {hashCombine(seed: &hash, value: $0.hashValue)}
				return hash
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
