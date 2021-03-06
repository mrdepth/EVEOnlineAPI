import Foundation
import Alamofire

public extension EVE {
	
	class func loadClassess() {
		_ = Corp.ContractItems.Item.classForCoder()
		_ = Char.CharacterSheet.JumpClone.classForCoder()
		_ = Char.UpcomingCalendarEvents.Event.classForCoder()
		_ = Char.Bookmarks.Folder.classForCoder()
		_ = Account.AccountStatus.classForCoder()
		_ = Char.Research.classForCoder()
		_ = Corp.KillMails.classForCoder()
		_ = Char.CharacterSheet.Attributes.classForCoder()
		_ = Char.AccountBalance.classForCoder()
		_ = Char.WalletJournal.classForCoder()
		_ = Char.AccountBalance.Account.classForCoder()
		_ = Corp.ContactList.Contact.classForCoder()
		_ = Char.ContactList.classForCoder()
		_ = Char.MarketOrders.classForCoder()
		_ = Corp.AssetList.classForCoder()
		_ = Char.PlanetaryLinks.Link.classForCoder()
		_ = Char.Contracts.Contract.classForCoder()
		_ = Char.MailingLists.MailingList.classForCoder()
		_ = Corp.Standings.classForCoder()
		_ = Corp.Bookmarks.Folder.classForCoder()
		_ = Api.CallList.Call.classForCoder()
		_ = Char.CharacterSheet.Role.classForCoder()
		_ = Char.MailingLists.classForCoder()
		_ = Char.KillMails.Kill.classForCoder()
		_ = Char.WalletTransactions.classForCoder()
		_ = Char.WalletJournal.Transaction.classForCoder()
		_ = Char.PlanetaryPins.Pin.classForCoder()
		_ = Char.ContactNotifications.Notification.classForCoder()
		_ = Corp.IndustryJobs.classForCoder()
		_ = Char.MailBodies.Message.classForCoder()
		_ = Corp.Medals.classForCoder()
		_ = Corp.AccountBalance.Account.classForCoder()
		_ = Char.ContractBids.classForCoder()
		_ = Eve.RefTypes.classForCoder()
		_ = Corp.WalletJournal.classForCoder()
		_ = Char.CharacterSheet.Skill.classForCoder()
		_ = Char.Clones.classForCoder()
		_ = Char.CalendarEventAttendees.classForCoder()
		_ = Char.Clones.JumpCloneImplant.classForCoder()
		_ = Corp.ContractItems.classForCoder()
		_ = Corp.AccountBalance.classForCoder()
		_ = Char.MailBodies.classForCoder()
		_ = Char.ChatChannels.Channel.classForCoder()
		_ = Char.AssetList.Asset.classForCoder()
		_ = Char.KillMails.Kill.Attacker.classForCoder()
		_ = Char.NotificationTexts.Notification.classForCoder()
		_ = Eve.RefTypes.RefType.classForCoder()
		_ = Corp.Contracts.Contract.classForCoder()
		_ = Corp.Blueprints.Blueprint.classForCoder()
		_ = Char.FacWarStats.classForCoder()
		_ = Char.ContactList.Label.classForCoder()
		_ = Char.IndustryJobs.Job.classForCoder()
		_ = Corp.Locations.Location.classForCoder()
		_ = Corp.KillMails.Kill.Item.classForCoder()
		_ = Char.PlanetaryRoutes.Route.classForCoder()
		_ = Char.Messages.Message.classForCoder()
		_ = Account.AccountStatus.MultiCharacterTraining.classForCoder()
		_ = Char.ContractBids.Bid.classForCoder()
		_ = Char.CharacterSheet.Certificate.classForCoder()
		_ = Corp.MarketOrders.Order.classForCoder()
		_ = Corp.Bookmarks.classForCoder()
		_ = Char.Notifications.classForCoder()
		_ = Char.ContactNotifications.classForCoder()
		_ = Api.CallList.CallGroup.classForCoder()
		_ = Char.Blueprints.classForCoder()
		_ = Corp.Bookmarks.Folder.Bookmark.classForCoder()
		_ = Char.ContractItems.Item.classForCoder()
		_ = Char.Contracts.classForCoder()
		_ = Char.ChatChannels.Channel.Accessor.classForCoder()
		_ = Char.Clones.Attributes.classForCoder()
		_ = Account.APIKeyInfo.APIKey.classForCoder()
		_ = Corp.ContactList.classForCoder()
		_ = Char.MarketOrders.Order.classForCoder()
		_ = Char.Locations.classForCoder()
		_ = Corp.WalletTransactions.classForCoder()
		_ = Corp.WalletTransactions.Transaction.classForCoder()
		_ = Char.Standings.Standing.classForCoder()
		_ = Char.Messages.classForCoder()
		_ = Corp.ContractBids.classForCoder()
		_ = Account.Characters.Character.classForCoder()
		_ = Char.CharacterSheet.classForCoder()
		_ = Char.CalendarEventAttendees.Attendee.classForCoder()
		_ = Char.PlanetaryColonies.Colony.classForCoder()
		_ = Char.Standings.classForCoder()
		_ = Char.Notifications.Notification.classForCoder()
		_ = Corp.Medals.Medal.classForCoder()
		_ = Char.Medals.Medal.classForCoder()
		_ = Char.SkillQueue.Skill.classForCoder()
		_ = Corp.Locations.classForCoder()
		_ = Corp.KillMails.Kill.Attacker.classForCoder()
		_ = Account.APIKeyInfo.classForCoder()
		_ = Char.PlanetaryRoutes.classForCoder()
		_ = Char.Locations.Location.classForCoder()
		_ = Char.PlanetaryPins.classForCoder()
		_ = Char.KillMails.Kill.Item.classForCoder()
		_ = Char.Skills.Skill.classForCoder()
		_ = Corp.KillMails.Kill.Victim.classForCoder()
		_ = Account.APIKeyInfo.APIKey.Character.classForCoder()
		_ = Char.PlanetaryLinks.classForCoder()
		_ = Char.KillMails.classForCoder()
		_ = Api.CallList.classForCoder()
		_ = Char.WalletTransactions.Transaction.classForCoder()
		_ = Char.SkillQueue.classForCoder()
		_ = Corp.Blueprints.classForCoder()
		_ = Char.CharacterSheet.Implant.classForCoder()
		_ = Char.CharacterSheet.JumpCloneImplant.classForCoder()
		_ = Char.ContactList.Contact.classForCoder()
		_ = Corp.ContractBids.Bid.classForCoder()
		_ = Char.Skills.classForCoder()
		_ = Char.NotificationTexts.classForCoder()
		_ = Corp.Standings.Standing.classForCoder()
		_ = Corp.IndustryJobs.Job.classForCoder()
		_ = Corp.FacWarStats.classForCoder()
		_ = Corp.MarketOrders.classForCoder()
		_ = Char.Clones.Implant.classForCoder()
		_ = Char.Bookmarks.classForCoder()
		_ = Char.UpcomingCalendarEvents.classForCoder()
		_ = Char.IndustryJobs.classForCoder()
		_ = Corp.Contracts.classForCoder()
		_ = Char.PlanetaryColonies.classForCoder()
		_ = Char.Clones.JumpClone.classForCoder()
		_ = Account.Characters.classForCoder()
		_ = Corp.AssetList.Asset.classForCoder()
		_ = Char.Research.Research.classForCoder()
		_ = Char.ContractItems.classForCoder()
		_ = Char.Bookmarks.Folder.Bookmark.classForCoder()
		_ = Corp.WalletJournal.Transaction.classForCoder()
		_ = Char.Medals.classForCoder()
		_ = Char.ChatChannels.classForCoder()
		_ = Char.Blueprints.Blueprint.classForCoder()
		_ = Char.AssetList.classForCoder()
		_ = Corp.ContactList.Label.classForCoder()
		_ = Corp.KillMails.Kill.classForCoder()
		_ = Char.KillMails.Kill.Victim.classForCoder()
	}
}

