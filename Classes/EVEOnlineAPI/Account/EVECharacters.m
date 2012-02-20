//
//  EVECharacters.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacters.h"

@implementation EVECharactersItem
@synthesize name;
@synthesize characterID;
@synthesize corporationName;
@synthesize corporationID;

+ (id) charactersItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharactersItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.name = [attributeDict valueForKey:@"name"];
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[name release];
	[corporationName release];
	[super dealloc];
}

@end


@implementation EVECharacters
@synthesize characters;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) charactersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr {
	return [[[EVECharacters alloc] initWithKeyID:keyID vCode:vCode error:errorPtr] autorelease];
}

+ (id) charactersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECharacters alloc] initWithKeyID:keyID vCode:vCode target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/account/Characters.xml.aspx?keyID=%d&vCode=%@", EVEOnlineAPIHost, keyID, vCode]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/account/Characters.xml.aspx?keyID=%d&vCode=%@", EVEOnlineAPIHost, keyID, vCode]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
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
		EVECharactersItem *character = [EVECharactersItem charactersItemWithXMLAttributes:attributeDict];
		[characters addObject:character];
		return character;
	}
	else
		return nil;
}

@end
