//
//  main.swift
//  apidump
//
//  Created by Artem Shimanski on 28.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import Foundation

let host = "https://api.eveonline.com"
let charkey = "keyID=519&vcode=IiEPrrQTAdQtvWA2Aj805d0XBMtOyWBCc0zE57SGuqinJLKGTNrlinxc6v407Vmf"
let corpkey = "keyID=4942560&vcode=zz1vcAf3lVso5Ep1KjuOS3aJOlwNfcnjYDEHxaqE9VOKnti71ydVxNaQtixj5MvU"

let account = [
	"/account/AccountStatus.xml.aspx?",
	"/account/APIKeyInfo.xml.aspx?",
	"/account/Characters.xml.aspx?"
]

let api = [
	"/api/CallList.xml.aspx?"
]

let char = [
	"/char/AccountBalance.xml.aspx?",
	"/char/AssetList.xml.aspx?",
	"/char/Blueprints.xml.aspx?",
	"/char/Bookmarks.xml.aspx?",
	"/char/CalendarEventAttendees.xml.aspx?",
	"/char/CharacterSheet.xml.aspx?",
	"/char/ChatChannels.xml.aspx?",
	"/char/Clones.xml.aspx?",
	"/char/ContactList.xml.aspx?",
	"/char/ContactNotifications.xml.aspx?",
	"/char/ContractBids.xml.aspx?",
	"/char/ContractItems.xml.aspx?",
	"/char/Contracts.xml.aspx?",
	"/char/FacWarStats.xml.aspx?",
	"/char/IndustryJobs.xml.aspx?",
	"/char/IndustryJobsHistory.xml.aspx?",
	"/char/KillLog.xml.aspx?",
	"/char/KillMails.xml.aspx?",
	"/char/Locations.xml.aspx?",
	"/char/MailBodies.xml.aspx?ids=361018677&",
	"/char/MailingLists.xml.aspx?",
	"/char/MailMessages.xml.aspx?",
	"/char/MarketOrders.xml.aspx?",
	"/char/Medals.xml.aspx?",
	"/char/Notifications.xml.aspx?",
	"/char/NotificationTexts.xml.aspx?",
	"/char/PlanetaryColonies.xml.aspx?",
	"/char/PlanetaryLinks.xml.aspx?",
	"/char/PlanetaryPins.xml.aspx?",
	"/char/PlanetaryRoutes.xml.aspx?",
	"/char/Research.xml.aspx?",
	"/char/SkillInTraining.xml.aspx?",
	"/char/SkillQueue.xml.aspx?",
	"/char/Skills.xml.aspx?",
	"/char/Standings.xml.aspx?",
	"/char/UpcomingCalendarEvents.xml.aspx?",
	"/char/WalletJournal.xml.aspx?",
	"/char/WalletTransactions.xml.aspx?"
]

let corp = [
	"/corp/AccountBalance.xml.aspx?",
	"/corp/AssetList.xml.aspx?",
	"/corp/Blueprints.xml.aspx?",
	"/corp/Bookmarks.xml.aspx?",
	"/corp/ContactList.xml.aspx?",
	"/corp/ContainerLog.xml.aspx?",
	"/corp/ContractBids.xml.aspx?",
	"/corp/ContractItems.xml.aspx?",
	"/corp/Contracts.xml.aspx?",
	"/corp/CorporationSheet.xml.aspx?",
	"/corp/CustomsOffices.xml.aspx?",
	"/corp/Facilities.xml.aspx?",
	"/corp/FacWarStats.xml.aspx?",
	"/corp/IndustryJobs.xml.aspx?",
	"/corp/IndustryJobsHistory.xml.aspx?",
	"/corp/KillMails.xml.aspx?",
	"/corp/Locations.xml.aspx?",
	"/corp/MarketOrders.xml.aspx?",
	"/corp/Medals.xml.aspx?",
	"/corp/MemberMedals.xml.aspx?",
	"/corp/MemberSecurity.xml.aspx?",
	"/corp/MemberSecurityLog.xml.aspx?",
	"/corp/MemberTracking.xml.aspx?",
	"/corp/OutpostList.xml.aspx?",
	"/corp/OutpostServiceDetail.xml.aspx?",
	"/corp/Shareholders.xml.aspx?",
	"/corp/Standings.xml.aspx?",
	"/corp/StarbaseDetail.xml.aspx?",
	"/corp/StarbaseList.xml.aspx?",
	"/corp/Titles.xml.aspx?",
	"/corp/WalletJournal.xml.aspx?",
	"/corp/WalletTransactions.xml.aspx?"
]

let eve = [
	"/eve/AllianceList.xml.aspx?",
	"/eve/CharacterAffiliation.xml.aspx?ids=1554561480&",
	"/eve/CharacterID.xml.aspx?names=Artem+Valiant&",
	"/eve/CharacterInfo.xml.aspx?characterID=1554561480&",
	"/eve/CharacterName.xml.aspx?ids=1554561480&",
	"/eve/ConquerableStationList.xml.aspx?",
	"/eve/ErrorList.xml.aspx?",
	"/eve/RefTypes.xml.aspx?",
	"/eve/TypeName.xml.aspx?"
]

let map = [
	"/map/FacWarSystems.xml.aspx?",
	"/map/Jumps.xml.aspx?",
	"/map/Kills.xml.aspx?",
	"/map/Sovereignty.xml.aspx?"
]

let server = [
	"/server/ServerStatus.xml.aspx?"
]

let session = URLSession()

func download(url:URL, to:String) -> Void {
	let fileName = url.lastPathComponent
	if let data = try? Data(contentsOf: url) {
		let root = "/Users/shimanski/work/tmp/Calls/\(to)"
		try? FileManager.default.createDirectory(at: URL(fileURLWithPath:root), withIntermediateDirectories: true, attributes: nil)
		let path = "\(root)/\(fileName)"
		try? FileManager.default.removeItem(atPath: path)
		try? data.write(to: URL(fileURLWithPath:path))
	}
	else {
		print("Error: \(url)")
	}
}

/*let call = "/char/Locations.xml.aspx?ids=1002670966176&"
let url = URL(string:"\(host)\(call)\(charkey)")!
download(url:url, to:"char")*/


/*

for call in account {
	let url = URL(string:"\(host)\(call)\(charkey)")!
	download(url:url, to:"account")
}

for call in api {
	let url = URL(string:"\(host)\(call)\(charkey)")!
	download(url:url, to:"api")
}

for call in char {
	let url = URL(string:"\(host)\(call)\(charkey)")!
	download(url:url, to:"char")
}

for call in corp {
	let url = URL(string:"\(host)\(call)\(corpkey)")!
	download(url:url, to:"corp")
}*/

for call in eve {
	let url = URL(string:"\(host)\(call)\(charkey)")!
	download(url:url, to:"eve")
}

/*for call in map {
	let url = URL(string:"\(host)\(call)\(charkey)")!
	download(url:url, to:"map")
}

for call in server {
	let url = URL(string:"\(host)\(call)\(charkey)")!
	download(url:url, to:"server")
}*/
