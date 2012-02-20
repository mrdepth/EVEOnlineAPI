//
//  EVEMailBodies.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEMailBodies.h"


@implementation EVEMailBodiesItem
@synthesize messageID;
@synthesize text;

+ (id) mailBodiesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEMailBodiesItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.messageID = [[attributeDict valueForKey:@"messageID"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[text release];
	[super dealloc];
}

@end


@implementation EVEMailBodies
@synthesize messages;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) mailBodiesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids error:(NSError **)errorPtr {
	return [[[EVEMailBodies alloc] initWithKeyID:keyID vCode:vCode characterID:characterID ids:ids error:errorPtr] autorelease];
}

+ (id) mailBodiesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEMailBodies alloc] initWithKeyID:keyID vCode:vCode characterID:characterID ids:ids target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/MailBodies.xml.aspx?keyID=%d&vCode=%@&characterID=%d&ids=%@", EVEOnlineAPIHost, keyID, vCode, characterID, [ids componentsJoinedByString:@","]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/MailBodies.xml.aspx?keyID=%d&vCode=%@&characterID=%d&ids=%@", EVEOnlineAPIHost, keyID, vCode, characterID, [ids componentsJoinedByString:@","]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[messages release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"messages"]) {
		messages = [[NSMutableArray alloc] init];
		return messages;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"messages"]) {
		EVEMailBodiesItem *mailBodiesItem = [EVEMailBodiesItem mailBodiesItemWithXMLAttributes:attributeDict];
		[messages addObject:mailBodiesItem];
		return mailBodiesItem;
	}
	return nil;
}

- (void) didEndRow: (id) row rowset: (NSString*) rowset {
	[super didEndRow:row rowset:rowset];
	if ([rowset isEqualToString:@"messages"]) {
		[row setText:[[text copy] autorelease]];
	}
}

@end
