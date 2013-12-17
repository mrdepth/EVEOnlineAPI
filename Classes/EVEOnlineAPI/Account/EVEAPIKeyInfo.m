//
//  EVEAPIKeyInfo.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEAPIKeyInfo.h"


@implementation EVEAPIKeyInfoCharactersItem

+ (id) charactersItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEAPIKeyInfoCharactersItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.characterName = [attributeDict valueForKey:@"characterName"];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.characterName forKey:@"characterName"];
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.characterID = [aDecoder decodeIntegerForKey:@"characterID"];
		self.characterName = [aDecoder decodeObjectForKey:@"characterName"];
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
		self.corporationName = [aDecoder decodeObjectForKey:@"corporationName"];
	}
	return self;
}

@end


@implementation EVEAPIKeyInfoKey

+ (id) keyWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEAPIKeyInfoKey alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.accessMask = [[attributeDict valueForKey:@"accessMask"] integerValue];
		NSString *s = [attributeDict valueForKey:@"type"];
		self.type = [s isEqualToString:@"Corporation"] ? EVEAPIKeyTypeCorporation : ([s isEqualToString:@"Character"] ? EVEAPIKeyTypeCharacter : EVEAPIKeyTypeAccount);
		self.expires = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"expires"]];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.accessMask forKey:@"accessMask"];
	[aCoder encodeInteger:self.type forKey:@"type"];
	[aCoder encodeObject:self.expires forKey:@"expires"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.accessMask = [aDecoder decodeIntegerForKey:@"accessMask"];
		self.type = [aDecoder decodeIntegerForKey:@"type"];
		self.expires = [aDecoder decodeObjectForKey:@"expires"];
	}
	return self;
}

@end


@implementation EVEAPIKeyInfo

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}


+ (id) apiKeyInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEAPIKeyInfo alloc] initWithKeyID:keyID vCode:vCode error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/account/APIKeyInfo.xml.aspx?keyID=%d&vCode=%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"characters"]) {
		self.characters = [[NSMutableArray alloc] init];
		return self.characters;
	}
	return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"characters"]) {
		EVEAPIKeyInfoCharactersItem *character = [EVEAPIKeyInfoCharactersItem charactersItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.characters addObject:character];
		return character;
	}
	else
		return nil;
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	if ([elementName isEqualToString:@"key"]) {
		self.key = [EVEAPIKeyInfoKey keyWithXMLAttributes:attributeDict];
	}
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.key forKey:@"key"];
	[aCoder encodeObject:self.characters forKey:@"characters"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.key = [aDecoder decodeObjectForKey:@"key"];
		self.characters = [aDecoder decodeObjectForKey:@"characters"];
	}
	return self;
}

@end