//
//  EVEResearch.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResearch.h"


@implementation EVEResearchItem
@synthesize agentID;
@synthesize skillTypeID;
@synthesize researchStartDate;
@synthesize pointsPerDay;
@synthesize remainderPoints;

+ (id) researchItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEResearchItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.agentID = [[attributeDict valueForKey:@"agentID"] integerValue];
		self.skillTypeID = [[attributeDict valueForKey:@"skillTypeID"] integerValue];
		self.researchStartDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"researchStartDate"]];
		self.pointsPerDay = [[attributeDict valueForKey:@"pointsPerDay"] floatValue];
		self.remainderPoints = [[attributeDict valueForKey:@"remainderPoints"] floatValue];
	}
	return self;
}

- (void) dealloc {
	[researchStartDate release];
	[super dealloc];
}

@end


@implementation EVEResearch
@synthesize research;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) researchWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEResearch alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) researchWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEResearch alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/Research.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/Research.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[research release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"research"]) {
		research = [[NSMutableArray alloc] init];
		return research;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"research"]) {
		EVEResearchItem *researchItem = [EVEResearchItem researchItemWithXMLAttributes:attributeDict];
		[research addObject:researchItem];
		return researchItem;
	}
	return nil;
}

@end