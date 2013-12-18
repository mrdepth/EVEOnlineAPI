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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.shareholderID forKey:@"shareholderID"];
	[aCoder encodeObject:self.shareholderName forKey:@"shareholderName"];
	[aCoder encodeInteger:self.shareholderCorporationID forKey:@"shareholderCorporationID"];
	[aCoder encodeObject:self.shareholderCorporationName forKey:@"shareholderCorporationName"];
	[aCoder encodeInteger:self.shares forKey:@"shares"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.shareholderID = [aDecoder decodeIntegerForKey:@"shareholderID"];
		self.shareholderName = [aDecoder decodeObjectForKey:@"shareholderName"];
		self.shareholderCorporationID = [aDecoder decodeIntegerForKey:@"shareholderCorporationID"];
		self.shareholderCorporationName = [aDecoder decodeObjectForKey:@"shareholderCorporationName"];
		self.shares = [aDecoder decodeIntegerForKey:@"shares"];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.shareholderID forKey:@"shareholderID"];
	[aCoder encodeObject:self.shareholderName forKey:@"shareholderName"];
	[aCoder encodeInteger:self.shares forKey:@"shares"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.shareholderID = [aDecoder decodeIntegerForKey:@"shareholderID"];
		self.shareholderName = [aDecoder decodeObjectForKey:@"shareholderName"];
		self.shares = [aDecoder decodeIntegerForKey:@"shares"];
	}
	return self;
}

@end


@implementation EVEShareholders

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) shareholdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEShareholders alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/Shareholders.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.characters forKey:@"characters"];
	[aCoder encodeObject:self.corporations forKey:@"corporations"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.characters = [aDecoder decodeObjectForKey:@"characters"];
		self.corporations = [aDecoder decodeObjectForKey:@"corporations"];
	}
	return self;
}

@end