//
//  EVECharWalletJournal.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharWalletJournal.h"

@implementation EVECharWalletJournalItem

+ (id) charWalletJournalItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharWalletJournalItem alloc] initWithXMLAttributes:attributeDict];
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

@end


@implementation EVECharWalletJournal

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) charWalletJournalWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID fromID: (long long) fromID rowCount:(NSInteger) rowCount error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECharWalletJournal alloc] initWithKeyID:keyID vCode:vCode characterID:characterID fromID:fromID rowCount:rowCount error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID fromID: (long long) fromID rowCount:(NSInteger) rowCount error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/WalletJournal.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID,
														(fromID > 0 ? [NSString stringWithFormat:@"&fromID=%qi", fromID] : @""),
														(rowCount > 0 ? [NSString stringWithFormat:@"&rowCount=%d", rowCount] : @"")]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"transactions"]) {
		self.charWalletJournal = [[NSMutableArray alloc] init];
		return self.charWalletJournal;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"transactions"]) {
		EVECharWalletJournalItem *charWalletJournalItem = [EVECharWalletJournalItem charWalletJournalItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.charWalletJournal addObject:charWalletJournalItem];
		return charWalletJournalItem;
	}
	return nil;
}

@end