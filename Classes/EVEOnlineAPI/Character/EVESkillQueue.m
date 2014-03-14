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
		self.queuePosition = [[attributeDict valueForKey:@"queuePosition"] intValue];
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
		self.level = [[attributeDict valueForKey:@"level"] intValue];
		self.startSP = [[attributeDict valueForKey:@"startSP"] intValue];
		self.endSP = [[attributeDict valueForKey:@"endSP"] intValue];
		self.startTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"startTime"]];
		self.endTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"endTime"]];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.queuePosition forKey:@"queuePosition"];
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeInt32:self.level forKey:@"level"];
	[aCoder encodeInt32:self.startSP forKey:@"startSP"];
	[aCoder encodeInt32:self.endSP forKey:@"endSP"];
	[aCoder encodeObject:self.startTime forKey:@"startTime"];
	[aCoder encodeObject:self.endTime forKey:@"endTime"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.queuePosition = [aDecoder decodeInt32ForKey:@"queuePosition"];
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.level = [aDecoder decodeInt32ForKey:@"level"];
		self.startSP = [aDecoder decodeInt32ForKey:@"startSP"];
		self.endSP = [aDecoder decodeInt32ForKey:@"endSP"];
		self.startTime = [aDecoder decodeObjectForKey:@"startTime"];
		self.endTime = [aDecoder decodeObjectForKey:@"endTime"];
	}
	return self;
}

@end

@interface EVESkillQueue()
@end


@implementation EVESkillQueue

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) skillQueueWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVESkillQueue alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/SkillQueue.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

- (NSTimeInterval) timeLeft {
	NSDate *endTime = [[self.skillQueue lastObject] endTime];
	return [endTime timeIntervalSinceDate:[self serverTimeWithLocalTime:[NSDate date]]];
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
		[(NSMutableArray*) self.skillQueue sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"queuePosition" ascending:YES]]];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.skillQueue forKey:@"skillQueue"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.skillQueue = [aDecoder decodeObjectForKey:@"skillQueue"];
	}
	return self;
}

@end