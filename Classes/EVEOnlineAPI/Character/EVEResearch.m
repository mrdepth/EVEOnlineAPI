//
//  EVEResearch.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResearch.h"


@implementation EVEResearchItem

+ (id) researchItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEResearchItem alloc] initWithXMLAttributes:attributeDict];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.agentID forKey:@"agentID"];
	[aCoder encodeInteger:self.skillTypeID forKey:@"skillTypeID"];
	[aCoder encodeObject:self.researchStartDate forKey:@"researchStartDate"];
	[aCoder encodeFloat:self.pointsPerDay forKey:@"pointsPerDay"];
	[aCoder encodeFloat:self.remainderPoints forKey:@"remainderPoints"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.agentID = [aDecoder decodeIntegerForKey:@"agentID"];
		self.skillTypeID = [aDecoder decodeIntegerForKey:@"skillTypeID"];
		self.researchStartDate = [aDecoder decodeObjectForKey:@"researchStartDate"];
		self.pointsPerDay = [aDecoder decodeFloatForKey:@"pointsPerDay"];
		self.remainderPoints = [aDecoder decodeFloatForKey:@"remainderPoints"];
	}
	return self;
}

@end


@implementation EVEResearch

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) researchWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEResearch alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/Research.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"research"]) {
		self.research = [[NSMutableArray alloc] init];
		return self.research;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"research"]) {
		EVEResearchItem *researchItem = [EVEResearchItem researchItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.research addObject:researchItem];
		return researchItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.research forKey:@"research"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.research = [aDecoder decodeObjectForKey:@"research"];
	}
	return self;
}

@end