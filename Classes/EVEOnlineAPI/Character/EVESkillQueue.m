//
//  EVESkillQueue.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESkillQueue.h"


@implementation EVESkillQueueItem
@synthesize queuePosition;
@synthesize typeID;
@synthesize level;
@synthesize startSP;
@synthesize endSP;
@synthesize startTime;
@synthesize endTime;

+ (id) skillQueueItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVESkillQueueItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.queuePosition = [[attributeDict valueForKey:@"queuePosition"] integerValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.level = [[attributeDict valueForKey:@"level"] integerValue];
		self.startSP = [[attributeDict valueForKey:@"startSP"] integerValue];
		self.endSP = [[attributeDict valueForKey:@"endSP"] integerValue];
		self.startTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"startTime"]];
		self.endTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"endTime"]];
	}
	return self;
}

- (void) dealloc {
	[startTime release];
	[endTime release];
	[super dealloc];
}

@end


@implementation EVESkillQueue
@synthesize skillQueue;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) skillQueueWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVESkillQueue alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) skillQueueWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVESkillQueue alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/SkillQueue.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/SkillQueue.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[skillQueue release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"skillqueue"]) {
		skillQueue = [[NSMutableArray alloc] init];
		return skillQueue;
	}
	else
		return nil;
}


- (void) didEndRowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"skillqueue"]) {
		[skillQueue sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"queuePosition" ascending:YES]]];
	}
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"skillqueue"]) {
		EVESkillQueueItem *skillQueueItem = [EVESkillQueueItem skillQueueItemWithXMLAttributes:attributeDict];
		[skillQueue addObject:skillQueueItem];
		return skillQueueItem;
	}
	return nil;
}

@end