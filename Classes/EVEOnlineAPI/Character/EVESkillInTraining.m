//
//  EVESkillInTraining.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESkillInTraining.h"


@implementation EVESkillInTraining

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) skillInTrainingWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVESkillInTraining alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/SkillInTraining.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	if ([elementName isEqualToString:@"currentTQTime"])
		self.currentTQTime = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"trainingEndTime"])
		self.trainingEndTime = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"trainingStartTime"])
		self.trainingStartTime = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"trainingTypeID"])
		self.trainingTypeID = [self.text intValue];
	else if ([elementName isEqualToString:@"trainingStartSP"])
		self.trainingStartSP = [self.text intValue];
	else if ([elementName isEqualToString:@"trainingDestinationSP"])
		self.trainingDestinationSP = [self.text intValue];
	else if ([elementName isEqualToString:@"trainingToLevel"])
		self.trainingToLevel = [self.text intValue];
	else if ([elementName isEqualToString:@"skillInTraining"])
		self.skillInTraining = [self.text intValue];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.currentTQTime forKey:@"currentTQTime"];
	[aCoder encodeObject:self.trainingEndTime forKey:@"trainingEndTime"];
	[aCoder encodeObject:self.trainingStartTime forKey:@"trainingStartTime"];

	[aCoder encodeInt32:self.trainingTypeID forKey:@"trainingTypeID"];
	[aCoder encodeInt32:self.trainingStartSP forKey:@"trainingStartSP"];
	[aCoder encodeInt32:self.trainingDestinationSP forKey:@"trainingDestinationSP"];
	[aCoder encodeInt32:self.trainingToLevel forKey:@"trainingToLevel"];
	[aCoder encodeInt32:self.skillInTraining forKey:@"skillInTraining"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.currentTQTime = [aDecoder decodeObjectForKey:@"currentTQTime"];
		self.trainingEndTime = [aDecoder decodeObjectForKey:@"trainingEndTime"];
		self.trainingStartTime = [aDecoder decodeObjectForKey:@"trainingStartTime"];

		self.trainingTypeID = [aDecoder decodeInt32ForKey:@"trainingTypeID"];
		self.trainingStartSP = [aDecoder decodeInt32ForKey:@"trainingStartSP"];
		self.trainingDestinationSP = [aDecoder decodeInt32ForKey:@"trainingDestinationSP"];
		self.trainingToLevel = [aDecoder decodeInt32ForKey:@"trainingToLevel"];
		self.skillInTraining = [aDecoder decodeInt32ForKey:@"skillInTraining"];
	}
	return self;
}

@end