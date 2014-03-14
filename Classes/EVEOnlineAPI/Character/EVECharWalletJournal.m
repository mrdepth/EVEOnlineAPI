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
		self.refID = [[attributeDict valueForKey:@"refID"] longLongValue];
		self.refTypeID = [[attributeDict valueForKey:@"refTypeID"] intValue];
		self.ownerName1 = [attributeDict valueForKey:@"ownerName1"];
		self.ownerID1 = [[attributeDict valueForKey:@"ownerID1"] intValue];
		self.ownerName2 = [attributeDict valueForKey:@"ownerName2"];
		self.ownerID2 = [[attributeDict valueForKey:@"ownerID2"] intValue];
		self.argName1 = [attributeDict valueForKey:@"argName1"];
		self.argID1 = [[attributeDict valueForKey:@"argID1"] intValue];
		self.amount = [[attributeDict valueForKey:@"amount"] floatValue];
		self.balance = [[attributeDict valueForKey:@"balance"] floatValue];
		self.reason = [attributeDict valueForKey:@"reason"];
		self.taxReceiverID = [[attributeDict valueForKey:@"taxReceiverID"] intValue];
		self.taxAmount = [[attributeDict valueForKey:@"taxAmount"] floatValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.date forKey:@"date"];
	[aCoder encodeInt64:self.refID forKey:@"refID"];
	[aCoder encodeInt32:self.refTypeID forKey:@"refTypeID"];
	[aCoder encodeObject:self.ownerName1 forKey:@"ownerName1"];
	[aCoder encodeInt32:self.ownerID1 forKey:@"ownerID1"];
	[aCoder encodeObject:self.ownerName2 forKey:@"ownerName2"];
	[aCoder encodeInt32:self.ownerID2 forKey:@"ownerID2"];
	[aCoder encodeObject:self.argName1 forKey:@"argName1"];
	[aCoder encodeInt32:self.argID1 forKey:@"argID1"];
	[aCoder encodeFloat:self.amount forKey:@"amount"];
	[aCoder encodeFloat:self.balance forKey:@"balance"];
	[aCoder encodeObject:self.reason forKey:@"reason"];
	[aCoder encodeInt32:self.taxReceiverID forKey:@"taxReceiverID"];
	[aCoder encodeFloat:self.taxAmount forKey:@"taxAmount"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.date = [aDecoder decodeObjectForKey:@"date"];
		self.refID = [aDecoder decodeInt64ForKey:@"refID"];
		self.refTypeID = [aDecoder decodeInt32ForKey:@"refTypeID"];
		self.ownerName1 = [aDecoder decodeObjectForKey:@"ownerName1"];
		self.ownerID1 = [aDecoder decodeInt32ForKey:@"ownerID1"];
		self.ownerName2 = [aDecoder decodeObjectForKey:@"ownerName2"];
		self.ownerID2 = [aDecoder decodeInt32ForKey:@"ownerID2"];
		self.argName1 = [aDecoder decodeObjectForKey:@"argName1"];
		self.argID1 = [aDecoder decodeInt32ForKey:@"argID1"];
		self.amount = [aDecoder decodeFloatForKey:@"amount"];
		self.balance = [aDecoder decodeFloatForKey:@"balance"];
		self.reason = [aDecoder decodeObjectForKey:@"reason"];
		self.taxReceiverID = [aDecoder decodeInt32ForKey:@"taxReceiverID"];
		self.taxAmount = [aDecoder decodeFloatForKey:@"taxAmount"];
	}
	return self;
}

@end


@implementation EVECharWalletJournal

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) charWalletJournalWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID fromID: (int64_t) fromID rowCount:(int32_t) rowCount error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECharWalletJournal alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID fromID:fromID rowCount:rowCount error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID fromID: (int64_t) fromID rowCount:(int32_t) rowCount error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/WalletJournal.xml.aspx?keyID=%d&vCode=%@&characterID=%d%@%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID,
														(fromID > 0 ? [NSString stringWithFormat:@"&fromID=%qi", fromID] : @""),
														(rowCount > 0 ? [NSString stringWithFormat:@"&rowCount=%d", rowCount] : @"")]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.charWalletJournal forKey:@"charWalletJournal"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.charWalletJournal = [aDecoder decodeObjectForKey:@"charWalletJournal"];
	}
	return self;
}

@end