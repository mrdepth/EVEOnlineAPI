//
//  EVECorpWalletJournal.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpWalletJournal.h"


@implementation EVECorpWalletJournalItem

+ (id) corpWalletJournalItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECorpWalletJournalItem alloc] initWithXMLAttributes:attributeDict];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.date forKey:@"date"];
	[aCoder encodeInteger:self.refID forKey:@"refID"];
	[aCoder encodeInteger:self.refTypeID forKey:@"refTypeID"];
	[aCoder encodeObject:self.ownerName1 forKey:@"ownerName1"];
	[aCoder encodeInteger:self.ownerID1 forKey:@"ownerID1"];
	[aCoder encodeObject:self.ownerName2 forKey:@"ownerName2"];
	[aCoder encodeInteger:self.ownerID2 forKey:@"ownerID2"];
	[aCoder encodeObject:self.argName1 forKey:@"argName1"];
	[aCoder encodeInteger:self.argID1 forKey:@"argID1"];
	[aCoder encodeFloat:self.amount forKey:@"amount"];
	[aCoder encodeFloat:self.balance forKey:@"balance"];
	[aCoder encodeObject:self.reason forKey:@"reason"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.date = [aDecoder decodeObjectForKey:@"date"];
		self.refID = [aDecoder decodeIntegerForKey:@"refID"];
		self.refTypeID = [aDecoder decodeIntegerForKey:@"refTypeID"];
		self.ownerName1 = [aDecoder decodeObjectForKey:@"ownerName1"];
		self.ownerID1 = [aDecoder decodeIntegerForKey:@"ownerID1"];
		self.ownerName2 = [aDecoder decodeObjectForKey:@"ownerName2"];
		self.ownerID2 = [aDecoder decodeIntegerForKey:@"ownerID2"];
		self.argName1 = [aDecoder decodeObjectForKey:@"argName1"];
		self.argID1 = [aDecoder decodeIntegerForKey:@"argID1"];
		self.amount = [aDecoder decodeFloatForKey:@"amount"];
		self.balance = [aDecoder decodeFloatForKey:@"balance"];
		self.reason = [aDecoder decodeObjectForKey:@"reason"];
	}
	return self;
}

@end


@implementation EVECorpWalletJournal

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) corpWalletJournalWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID accountKey: (NSInteger) accountKey fromID: (long long) fromID rowCount:(NSInteger) rowCount error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECorpWalletJournal alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID accountKey:accountKey fromID:fromID rowCount:rowCount error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID accountKey: (NSInteger) accountKey fromID: (long long) fromID rowCount:(NSInteger) rowCount error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/WalletJournal.xml.aspx?keyID=%d&vCode=%@&characterID=%d&accountKey=%d%@%@",
														EVEOnlineAPIHost,
														keyID,
														vCode,
														characterID,
														accountKey,
														(fromID > 0 ? [NSString stringWithFormat:@"&fromID=%qi", fromID] : @""),
														(rowCount > 0 ? [NSString stringWithFormat:@"&rowCount=%d", rowCount] : @"")]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"entries"]) {
		self.corpWalletJournal = [[NSMutableArray alloc] init];
		return self.corpWalletJournal;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"entries"]) {
		EVECorpWalletJournalItem *corpWalletJournalItem = [EVECorpWalletJournalItem corpWalletJournalItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.corpWalletJournal addObject:corpWalletJournalItem];
		return corpWalletJournalItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.corpWalletJournal forKey:@"corpWalletJournal"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.corpWalletJournal = [aDecoder decodeObjectForKey:@"corpWalletJournal"];
	}
	return self;
}

@end