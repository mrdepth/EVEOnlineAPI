//
//  EVEMemberMedals.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberMedals.h"


@implementation EVEMemberMedalsItem

+ (id) memberMedalsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEMemberMedalsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.medalID = [[attributeDict valueForKey:@"medalID"] intValue];
		self.characterID = [[attributeDict valueForKey:@"characterID"] intValue];
		self.reason = [attributeDict valueForKey:@"reason"];
		self.status = [attributeDict valueForKey:@"status"];
		self.issuerID = [[attributeDict valueForKey:@"issuerID"] intValue];
		self.issued = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"issued"]];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.medalID forKey:@"medalID"];
	[aCoder encodeInt32:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.reason forKey:@"reason"];
	[aCoder encodeObject:self.status forKey:@"status"];
	[aCoder encodeInt32:self.issuerID forKey:@"issuerID"];
	[aCoder encodeObject:self.issued forKey:@"issued"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.medalID = [aDecoder decodeInt32ForKey:@"medalID"];
		self.characterID = [aDecoder decodeInt32ForKey:@"characterID"];
		self.reason = [aDecoder decodeObjectForKey:@"reason"];
		self.status = [aDecoder decodeObjectForKey:@"status"];
		self.issuerID = [aDecoder decodeInt32ForKey:@"issuerID"];
		self.issued = [aDecoder decodeObjectForKey:@"issued"];
	}
	return self;
}

@end


@implementation EVEMemberMedals

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) memberMedalsWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEMemberMedals alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberMedals.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"issuedMedals"]) {
		self.issuedMedals = [[NSMutableArray alloc] init];
		return self.issuedMedals;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"issuedMedals"]) {
		EVEMemberMedalsItem *memberMedalsItem = [EVEMemberMedalsItem memberMedalsItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.issuedMedals addObject:memberMedalsItem];
		return memberMedalsItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.issuedMedals forKey:@"issuedMedals"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.issuedMedals = [aDecoder decodeObjectForKey:@"issuedMedals"];
	}
	return self;
}

@end