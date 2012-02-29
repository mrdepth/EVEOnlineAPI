//
//  EVECharWalletJournal.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharWalletJournal.h"

@implementation EVECharWalletJournalItem
@synthesize date;
@synthesize refID;
@synthesize refTypeID;
@synthesize ownerName1;
@synthesize ownerID1;
@synthesize ownerName2;
@synthesize ownerID2;
@synthesize argName1;
@synthesize argID1;
@synthesize amount;
@synthesize balance;
@synthesize reason;
@synthesize taxReceiverID;
@synthesize taxAmount;

+ (id) charWalletJournalItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharWalletJournalItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.date = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"date"]];
		self.refID = [[attributeDict valueForKey:@"refID"] integerValue];
		self.refTypeID = [[attributeDict valueForKey:@"refTypeID"] integerValue];
		self.ownerName1 = [attributeDict valueForKey:@"ownerName1"];
		self.ownerID1 = [[attributeDict valueForKey:@"ownerID1"] integerValue];
		self.ownerName2 = [attributeDict valueForKey:@"ownerName2"];
		self.ownerID2 = [[attributeDict valueForKey:@"ownerID2"] integerValue];
		self.argName1 = [attributeDict valueForKey:@"argName1"];
		self.argID1 = [[attributeDict valueForKey:@"argID1"] integerValue];
		self.amount = [[attributeDict valueForKey:@"amount"] floatValue];
		self.balance = [[attributeDict valueForKey:@"balance"] floatValue];
		self.reason = [attributeDict valueForKey:@"reason"];
		self.taxReceiverID = [[attributeDict valueForKey:@"taxReceiverID"] integerValue];
		self.taxAmount = [[attributeDict valueForKey:@"taxAmount"] floatValue];
	}
	return self;
}

- (void) dealloc {
	[date release];
	[ownerName1 release];
	[ownerName2 release];
	[argName1 release];
	[reason release];
	[super dealloc];
}

@end


@implementation EVECharWalletJournal
@synthesize charWalletJournal;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) charWalletJournalWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID fromID: (long long) fromID rowCount:(NSInteger) rowCount error:(NSError **)errorPtr {
	return [[[EVECharWalletJournal alloc] initWithKeyID:keyID vCode:vCode characterID:characterID fromID:fromID rowCount:rowCount error:errorPtr] autorelease];
}

+ (id) charWalletJournalWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID fromID: (long long) fromID rowCount:(NSInteger) rowCount target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECharWalletJournal alloc] initWithKeyID:keyID vCode:vCode characterID:characterID fromID:fromID rowCount:rowCount target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID fromID: (long long) fromID rowCount:(NSInteger) rowCount error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/WalletJournal.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@%@", EVEOnlineAPIHost, keyID, vCode, characterID,
														(fromID > 0 ? [NSString stringWithFormat:@"&fromID=%qi", fromID] : @""),
														(rowCount > 0 ? [NSString stringWithFormat:@"&rowCount=%d", rowCount] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID fromID: (long long) fromID rowCount:(NSInteger) rowCount target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/WalletJournal.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@%@", EVEOnlineAPIHost, keyID, vCode, characterID,
														(fromID > 0 ? [NSString stringWithFormat:@"&fromID=%qi", fromID] : @""),
														(rowCount > 0 ? [NSString stringWithFormat:@"&rowCount=%d", rowCount] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[charWalletJournal release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"transactions"]) {
		charWalletJournal = [[NSMutableArray alloc] init];
		return charWalletJournal;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"transactions"]) {
		EVECharWalletJournalItem *charWalletJournalItem = [EVECharWalletJournalItem charWalletJournalItemWithXMLAttributes:attributeDict];
		[charWalletJournal addObject:charWalletJournalItem];
		return charWalletJournalItem;
	}
	return nil;
}

@end