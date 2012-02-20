//
//  EVESkillInTraining.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVESkillInTraining.h"


@implementation EVESkillInTraining
@synthesize currentTQTime;
@synthesize trainingEndTime;
@synthesize trainingStartTime;
@synthesize trainingTypeID;
@synthesize trainingStartSP;
@synthesize trainingDestinationSP;
@synthesize trainingToLevel;
@synthesize skillInTraining;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) skillInTrainingWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVESkillInTraining alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) skillInTrainingWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVESkillInTraining alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/SkillInTraining.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/SkillInTraining.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[currentTQTime release];
	[trainingEndTime release];
	[trainingStartTime release];
	[super dealloc];
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
		self.trainingTypeID = [self.text integerValue];
	else if ([elementName isEqualToString:@"trainingStartSP"])
		self.trainingStartSP = [self.text integerValue];
	else if ([elementName isEqualToString:@"trainingDestinationSP"])
		self.trainingDestinationSP = [self.text integerValue];
	else if ([elementName isEqualToString:@"trainingToLevel"])
		self.trainingToLevel = [self.text integerValue];
	else if ([elementName isEqualToString:@"skillInTraining"])
		self.skillInTraining = [self.text integerValue];
}

@end