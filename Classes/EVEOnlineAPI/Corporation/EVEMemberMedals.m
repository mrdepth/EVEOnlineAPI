//
//  EVEMemberMedals.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMemberMedals.h"


@implementation EVEMemberMedalsItem
@synthesize medalID;
@synthesize characterID;
@synthesize reason;
@synthesize status;
@synthesize issuerID;
@synthesize issued;


+ (id) memberMedalsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEMemberMedalsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.medalID = [[attributeDict valueForKey:@"medalID"] integerValue];
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.reason = [attributeDict valueForKey:@"reason"];
		self.status = [attributeDict valueForKey:@"status"];
		self.issuerID = [[attributeDict valueForKey:@"issuerID"] integerValue];
		self.issued = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"issued"]];
	}
	return self;
}

- (void) dealloc {
	[reason release];
	[status release];
	[issued release];
	[super dealloc];
}

@end


@implementation EVEMemberMedals
@synthesize issuedMedals;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) memberMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEMemberMedals alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) memberMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEMemberMedals alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberMedals.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/MemberMedals.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[issuedMedals release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"issuedMedals"]) {
		issuedMedals = [[NSMutableArray alloc] init];
		return issuedMedals;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"issuedMedals"]) {
		EVEMemberMedalsItem *memberMedalsItem = [EVEMemberMedalsItem memberMedalsItemWithXMLAttributes:attributeDict];
		[issuedMedals addObject:memberMedalsItem];
		return memberMedalsItem;
	}
	return nil;
}

@end