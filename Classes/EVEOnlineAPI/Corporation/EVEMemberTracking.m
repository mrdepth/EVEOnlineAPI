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
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.name = [attributeDict valueForKey:@"name"];
		self.startDateTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"startDateTime"]];
		self.baseID = [[attributeDict valueForKey:@"baseID"] integerValue];
		self.base = [attributeDict valueForKey:@"base"];
		self.title = [attributeDict valueForKey:@"title"];
		
		if ([attributeDict valueForKey:@"logonDateTime"])
			self.logonDateTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"logonDateTime"]];
		if ([attributeDict valueForKey:@"logoffDateTime"])
			self.logoffDateTime = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"logoffDateTime"]];
		if ([attributeDict valueForKey:@"locationID"])
			self.locationID = [[attributeDict valueForKey:@"locationID"] longLongValue];
		if ([attributeDict valueForKey:@"location"])
			self.location = [attributeDict valueForKey:@"location"];
		if ([attributeDict valueForKey:@"shipTypeID"])
			self.shipTypeID = [[attributeDict valueForKey:@"shipTypeID"] integerValue];
		if ([attributeDict valueForKey:@"shipType"])
			self.shipType = [attributeDict valueForKey:@"shipType"];
		if ([attributeDict valueForKey:@"roles"])
			self.roles = [attributeDict valueForKey:@"roles"];
		if ([attributeDict valueForKey:@"grantableRoles"])
			self.grantableRoles = [attributeDict valueForKey:@"grantableRoles"];
	}
	return self;
}

@end


@implementation EVEMemberTracking

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) memberTrackingWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEMemberTracking alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberTracking.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
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

@end