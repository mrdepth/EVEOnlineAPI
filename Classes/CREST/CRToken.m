//
//  CRToken.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.11.15.
//
//

#import "CRToken.h"

@implementation CRToken

- (BOOL) isExpired {
	return !self.expiresOn || [self.expiresOn compare:[NSDate date]] == NSOrderedAscending;
}

#pragma mark - NSCoding

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.accessToken = [aDecoder decodeObjectForKey:@"accessToken"];
		self.refreshToken = [aDecoder decodeObjectForKey:@"refreshToken"];
		self.tokenType = [aDecoder decodeObjectForKey:@"tokenType"];
		self.expiresOn = [aDecoder decodeObjectForKey:@"expiresOn"];
		self.characterID = [aDecoder decodeInt32ForKey:@"characterID"];
		self.characterName = [aDecoder decodeObjectForKey:@"characterName"];
	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.accessToken forKey:@"accessToken"];
	[aCoder encodeObject:self.refreshToken forKey:@"refreshToken"];
	[aCoder encodeObject:self.tokenType forKey:@"tokenType"];
	[aCoder encodeObject:self.expiresOn forKey:@"expiresOn"];
	[aCoder encodeInt32:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.characterName forKey:@"characterName"];
}

@end
