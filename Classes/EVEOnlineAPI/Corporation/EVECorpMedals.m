//
//  EVECorpMedals.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpMedals.h"


@implementation EVECorpMedalsItem
@synthesize medalID;
@synthesize title;
@synthesize description;
@synthesize creatorID;
@synthesize created;

+ (id) corpMedalsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECorpMedalsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.medalID = [[attributeDict valueForKey:@"medalID"] integerValue];
		self.title = [attributeDict valueForKey:@"title"];
		self.description = [attributeDict valueForKey:@"description"];
		self.creatorID = [[attributeDict valueForKey:@"creatorID"] integerValue];
		self.created = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"created"]];
	}
	return self;
}

- (void) dealloc {
	[title release];
	[description release];
	[created release];
	[super dealloc];
}

@end


@implementation EVECorpMedals
@synthesize medals;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) corpMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVECorpMedals alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) corpMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVECorpMedals alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/Medals.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/Medals.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[medals release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"medals"]) {
		medals = [[NSMutableArray alloc] init];
		return medals;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"medals"]) {
		EVECorpMedalsItem *corpMedalsItem = [EVECorpMedalsItem corpMedalsItemWithXMLAttributes:attributeDict];
		[medals addObject:corpMedalsItem];
		return corpMedalsItem;
	}
	return nil;
}

@end