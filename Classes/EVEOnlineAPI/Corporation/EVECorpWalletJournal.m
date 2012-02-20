//
//  EVECorpWalletJournal.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpWalletJournal.h"


@implementation EVECorpWalletJournalItem
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

+ (id) corpWalletJournalItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECorpWalletJournalItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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


@implementation EVECorpWalletJournal
@synthesize corpWalletJournal;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) corpWalletJournalWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeRefID: (long long) beforeRefID error:(NSError **)errorPtr {
	return [[[EVECorpWalletJournal alloc] initWithKeyID:keyID vCode:vCode characterID:characterID beforeRefID:beforeRefID error:errorPtr] autorelease];
}

+ (id) corpWalletJournalWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeRefID: (long long) beforeRefID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECorpWalletJournal alloc] initWithKeyID:keyID vCode:vCode characterID:characterID beforeRefID:beforeRefID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeRefID: (long long) beforeRefID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/WalletJournal.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@", EVEOnlineAPIHost, keyID, vCode, characterID,
														(beforeRefID > 0 ? [NSString stringWithFormat:@"&beforeRefID=%qi", beforeRefID] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeRefID: (long long) beforeRefID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/WalletJournal.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@", EVEOnlineAPIHost, keyID, vCode, characterID,
														(beforeRefID > 0 ? [NSString stringWithFormat:@"&beforeRefID=%qi", beforeRefID] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[corpWalletJournal release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"entries"]) {
		corpWalletJournal = [[NSMutableArray alloc] init];
		return corpWalletJournal;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"entries"]) {
		EVECorpWalletJournalItem *corpWalletJournalItem = [EVECorpWalletJournalItem corpWalletJournalItemWithXMLAttributes:attributeDict];
		[corpWalletJournal addObject:corpWalletJournalItem];
		return corpWalletJournalItem;
	}
	return nil;
}

@end