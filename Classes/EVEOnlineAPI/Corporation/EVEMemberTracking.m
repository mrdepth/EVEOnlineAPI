//
//  EVEMemberTracking.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberTracking.h"


@implementation EVEMemberTrackingItem

+ (id) memberTrackingItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEMemberTrackingItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] intValue];
		self.name = [attributeDict valueForKey:@"name"];
		self.startDateTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"startDateTime"]];
		self.baseID = [[attributeDict valueForKey:@"baseID"] intValue];
		self.base = [attributeDict valueForKey:@"base"];
		self.title = [attributeDict valueForKey:@"title"];
		
		if ([attributeDict valueForKey:@"logonDateTime"])
			self.logonDateTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"logonDateTime"]];
		if ([attributeDict valueForKey:@"logoffDateTime"])
			self.logoffDateTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"logoffDateTime"]];
		if ([attributeDict valueForKey:@"locationID"])
			self.locationID = [[attributeDict valueForKey:@"locationID"] intValue];
		if ([attributeDict valueForKey:@"location"])
			self.location = [attributeDict valueForKey:@"location"];
		if ([attributeDict valueForKey:@"shipTypeID"])
			self.shipTypeID = [[attributeDict valueForKey:@"shipTypeID"] intValue];
		if ([attributeDict valueForKey:@"shipType"])
			self.shipType = [attributeDict valueForKey:@"shipType"];
		if ([attributeDict valueForKey:@"roles"])
			self.roles = [attributeDict valueForKey:@"roles"];
		if ([attributeDict valueForKey:@"grantableRoles"])
			self.grantableRoles = [attributeDict valueForKey:@"grantableRoles"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.name forKey:@"name"];
	[aCoder encodeObject:self.startDateTime forKey:@"startDateTime"];
	[aCoder encodeInt32:self.baseID forKey:@"baseID"];
	[aCoder encodeObject:self.base forKey:@"base"];
	[aCoder encodeObject:self.title forKey:@"title"];
	[aCoder encodeObject:self.logonDateTime forKey:@"logonDateTime"];
	[aCoder encodeObject:self.logoffDateTime forKey:@"logoffDateTime"];
	[aCoder encodeInt32:self.locationID forKey:@"locationID"];
	[aCoder encodeObject:self.location forKey:@"location"];
	[aCoder encodeInt32:self.shipTypeID forKey:@"shipTypeID"];
	[aCoder encodeObject:self.shipType forKey:@"shipType"];
	[aCoder encodeObject:self.roles forKey:@"roles"];
	[aCoder encodeObject:self.grantableRoles forKey:@"grantableRoles"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.characterID = [aDecoder decodeInt32ForKey:@"characterID"];
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.startDateTime = [aDecoder decodeObjectForKey:@"startDateTime"];
		self.baseID = [aDecoder decodeInt32ForKey:@"baseID"];
		self.base = [aDecoder decodeObjectForKey:@"base"];
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.logonDateTime = [aDecoder decodeObjectForKey:@"logonDateTime"];
		self.logoffDateTime = [aDecoder decodeObjectForKey:@"logoffDateTime"];
		self.locationID = [aDecoder decodeInt32ForKey:@"locationID"];
		self.location = [aDecoder decodeObjectForKey:@"location"];
		self.shipTypeID = [aDecoder decodeInt32ForKey:@"shipTypeID"];
		self.shipType = [aDecoder decodeObjectForKey:@"shipType"];
		self.roles = [aDecoder decodeObjectForKey:@"roles"];
		self.grantableRoles = [aDecoder decodeObjectForKey:@"grantableRoles"];
	}
	return self;
}

@end


@implementation EVEMemberTracking

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) memberTrackingWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEMemberTracking alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberTracking.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"members"]) {
		self.members = [[NSMutableArray alloc] init];
		return self.members;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"members"]) {
		EVEMemberTrackingItem *memberTrackingItem = [EVEMemberTrackingItem memberTrackingItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.members addObject:memberTrackingItem];
		return memberTrackingItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.members forKey:@"members"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.members = [aDecoder decodeObjectForKey:@"members"];
	}
	return self;
}

@end