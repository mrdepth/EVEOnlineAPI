//
//  EVECharacterID.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacterID.h"


@implementation EVECharacterIDItem
@synthesize characterID;
@synthesize name;

+ (id) characterIDItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECharacterIDItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

@implementation EVECharacterID
@synthesize characters;


+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) characterIDWithNames:(NSArray*) names error:(NSError **)errorPtr {
	return [[[EVECharacterID alloc] initWithNames:names error:errorPtr] autorelease];
}

+ (id) characterIDWithNames:(NSArray*) names target:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVECharacterID alloc] initWithNames:names target:target action:action object:aObject] autorelease];
}

- (id) initWithNames:(NSArray*) names error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CharacterID.xml.aspx?names=%@", EVEOnlineAPIHost,
														[[names componentsJoinedByString:@","] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithNames:(NSArray*) names target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CharacterID.xml.aspx?names=%@", EVEOnlineAPIHost,
														[[names componentsJoinedByString:@","] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]
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
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"characters"]) {
		EVECharacterIDItem *characterIDItem = [EVECharacterIDItem characterIDItemWithXMLAttributes:attributeDict];
		[object addObject:characterIDItem];
		return characterIDItem;
	}
	return nil;
}
@end