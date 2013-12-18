//
//  EVECorpMedals.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpMedals.h"


@implementation EVECorpMedalsItem

+ (id) corpMedalsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECorpMedalsItem alloc] initWithXMLAttributes:attributeDict];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.medalID forKey:@"medalID"];
	[aCoder encodeObject:self.title forKey:@"title"];
	[aCoder encodeObject:self.description forKey:@"description"];
	[aCoder encodeInteger:self.creatorID forKey:@"creatorID"];
	[aCoder encodeObject:self.created forKey:@"created"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.medalID = [aDecoder decodeIntegerForKey:@"medalID"];
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.description = [aDecoder decodeObjectForKey:@"description"];
		self.creatorID = [aDecoder decodeIntegerForKey:@"creatorID"];
		self.created = [aDecoder decodeObjectForKey:@"created"];
	}
	return self;
}

@end


@implementation EVECorpMedals

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) corpMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECorpMedals alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/Medals.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"medals"]) {
		self.medals = [[NSMutableArray alloc] init];
		return self.medals;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"medals"]) {
		EVECorpMedalsItem *corpMedalsItem = [EVECorpMedalsItem corpMedalsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.medals addObject:corpMedalsItem];
		return corpMedalsItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.medals forKey:@"medals"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.medals = [aDecoder decodeObjectForKey:@"medals"];
	}
	return self;
}

@end