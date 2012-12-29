//
//  EVECharacterName.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacterName.h"


@implementation EVECharacterNameItem
@synthesize characterID;
@synthesize name;

+ (id) characterNameItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharacterNameItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.name = [attributeDict valueForKey:@"name"];
	}
	return self;
}

- (void) dealloc {
	[name release];
	[super dealloc];
}

@end

@implementation EVECharacterName
@synthesize characters;


+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) characterNameWithIDs:(NSArray*) ids error:(NSError **)errorPtr {
	return [[[EVECharacterName alloc] initWithIDs:ids error:errorPtr] autorelease];
}

+ (id) characterNameWithIDs:(NSArray*) ids target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVECharacterName alloc] initWithIDs:ids target:target action:action object:aObject] autorelease];
}

- (id) initWithIDs:(NSArray*) ids error:(NSError **)errorPtr {
/*	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CharacterName.xml.aspx?ids=%@", EVEOnlineAPIHost,
														[[ids componentsJoinedByString:@","] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;*/
	
	NSString* body = [NSString stringWithFormat:@"ids=%@", [ids componentsJoinedByString:@","]];
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CharacterName.xml.aspx",
														EVEOnlineAPIHost]]
						 bodyData:[body dataUsingEncoding:NSUTF8StringEncoding]
					  contentType:nil
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
		
	}
	return self;

}

- (id) initWithIDs:(NSArray*) ids target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CharacterName.xml.aspx?ids=%@", EVEOnlineAPIHost,
														[[ids componentsJoinedByString:@","] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]
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
		characters = [[NSMutableDictionary alloc] init];
		return characters;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"characters"]) {
		[characters setValue:[attributeDict valueForKey:@"name"] forKey:[attributeDict valueForKey:@"characterID"]];
		return nil;
	}
	return nil;
}
@end