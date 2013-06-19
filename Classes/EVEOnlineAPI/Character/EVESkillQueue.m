//
//  EVESkillQueue.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESkillQueue.h"


@implementation EVESkillQueueItem

+ (id) skillQueueItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVESkillQueueItem alloc] initWithXMLAttributes:attributeDict];
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

@end


@implementation EVESkillQueue

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) skillQueueWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVESkillQueue alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/SkillQueue.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"skillqueue"]) {
		self.skillQueue = [[NSMutableArray alloc] init];
		return self.skillQueue;
	}
	else
		return nil;
}


- (void) didEndRowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"skillqueue"]) {
		[(NSMutableArray*) self.skillQueue sortUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"queuePosition" ascending:YES]]];
	}
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"skillqueue"]) {
		EVESkillQueueItem *skillQueueItem = [EVESkillQueueItem skillQueueItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.skillQueue addObject:skillQueueItem];
		return skillQueueItem;
	}
	return nil;
}

@end