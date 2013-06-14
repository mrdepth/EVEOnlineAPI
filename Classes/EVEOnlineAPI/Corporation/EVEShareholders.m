//
//  EVEShareholders.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEShareholders.h"


@implementation EVEShareholdersCharactersItem

+ (id) shareholdersCharactersItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEShareholdersCharactersItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.shareholderID = [[attributeDict valueForKey:@"shareholderID"] integerValue];
		self.shareholderName = [attributeDict valueForKey:@"shareholderName"];
		self.shareholderCorporationID = [[attributeDict valueForKey:@"shareholderCorporationID"] integerValue];
		self.shareholderCorporationName = [attributeDict valueForKey:@"shareholderCorporationName"];
		self.shares = [[attributeDict valueForKey:@"shares"] integerValue];
	}
	return self;
}

@end


@implementation EVEShareholdersCorporationsItem

+ (id) shareholdersCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEShareholdersCorporationsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.shareholderID = [[attributeDict valueForKey:@"shareholderID"] integerValue];
		self.shareholderName = [attributeDict valueForKey:@"shareholderName"];
		self.shares = [[attributeDict valueForKey:@"shares"] integerValue];
	}
	return self;
}

@end


@implementation EVEShareholders

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) shareholdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEShareholders alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/Shareholders.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"characters"]) {
		self.characters = [[NSMutableArray alloc] init];
		return self.characters;
	}
	else if ([rowset isEqualToString:@"corporations"]) {
		self.corporations = [[NSMutableArray alloc] init];
		return self.corporations;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"characters"]) {
		EVEShareholdersCharactersItem *shareholdersCharactersItem = [EVEShareholdersCharactersItem shareholdersCharactersItemWithXMLAttributes:attributeDict];
		[object addObject:shareholdersCharactersItem];
		return shareholdersCharactersItem;
	}
	else if ([rowset isEqualToString:@"corporations"]) {
		EVEShareholdersCorporationsItem *shareholdersCorporationsItem = [EVEShareholdersCorporationsItem shareholdersCorporationsItemWithXMLAttributes:attributeDict];
		[object addObject:shareholdersCorporationsItem];
		return shareholdersCorporationsItem;
	}
	return nil;
}

@end