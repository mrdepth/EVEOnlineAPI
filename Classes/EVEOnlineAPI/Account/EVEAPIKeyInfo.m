//
//  EVEAPIKeyInfo.m
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEAPIKeyInfo.h"


@implementation EVEAPIKeyInfoCharactersItem
@synthesize characterID;
@synthesize characterName;
@synthesize corporationID;
@synthesize corporationName;

+ (id) charactersItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEAPIKeyInfoCharactersItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[characterName release];
	[corporationName release];
	[super dealloc];
}

@end


@implementation EVEAPIKeyInfoKey
@synthesize accessMask;
@synthesize type;
@synthesize expires;

+ (id) keyWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEAPIKeyInfoKey alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[expires release];
	[super dealloc];
}

@end


@implementation EVEAPIKeyInfo
@synthesize key;
@synthesize characters;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}


+ (id) apiKeyInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr {
	return [[[EVEAPIKeyInfo alloc] initWithKeyID:keyID vCode:vCode error:errorPtr] autorelease];
}

+ (id) apiKeyInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVEAPIKeyInfo alloc] initWithKeyID:keyID vCode:vCode target:target action:action object:aObject] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/account/APIKeyInfo.xml.aspx?keyID=%d&vCode=%@", EVEOnlineAPIHost, keyID, vCode]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/account/APIKeyInfo.xml.aspx?keyID=%d&vCode=%@", EVEOnlineAPIHost, keyID, vCode]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[key release];
	[characters release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"characters"]) {
		characters = [[NSMutableArray alloc] init];
		return characters;
	}
	return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"characters"]) {
		EVEAPIKeyInfoCharactersItem *character = [EVEAPIKeyInfoCharactersItem charactersItemWithXMLAttributes:attributeDict];
		[characters addObject:character];
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

@end