//
//  EVEMemberTracking.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMemberTrackingItem : NSObject {
	NSInteger characterID;
	NSString *name;
	NSDate *startDateTime;
	NSInteger baseID;
	NSString *base;
	NSString *title;
	NSDate *logonDateTime;
	NSDate *logoffDateTime;
	long long locationID;
	NSString *location;
	NSInteger shipTypeID;
	NSString *shipType;
	NSString *roles;
	NSString *grantableRoles;
}
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSDate *startDateTime;
@property (nonatomic) NSInteger baseID;
@property (nonatomic, copy) NSString *base;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSDate *logonDateTime;
@property (nonatomic, retain) NSDate *logoffDateTime;
@property (nonatomic) long long locationID;
@property (nonatomic, copy) NSString *location;
@property (nonatomic) NSInteger shipTypeID;
@property (nonatomic, copy) NSString *shipType;
@property (nonatomic, copy) NSString *roles;
@property (nonatomic, copy) NSString *grantableRoles;

+ (id) memberTrackingItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMemberTracking : EVERequest {
	NSMutableArray *members;
}
@property (nonatomic, retain) NSArray *members;

+ (id) memberTrackingWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) memberTrackingWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end