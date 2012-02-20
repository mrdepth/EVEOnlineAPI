//
//  EVEContainerLog.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEContainerLogItem : NSObject {
	NSDate *logTime;
	long long itemID;
	NSInteger itemTypeID;
	NSInteger actorID;
	NSString *actorName;
	EVEInventoryFlag flag;
	long long locationID;
	NSString *action;
	NSString *passwordType;
	NSInteger typeID;
	NSInteger quantity;
	NSString *oldConfiguration;
	NSString *newConfiguration;
}
@property (nonatomic, retain) NSDate *logTime;
@property (nonatomic) long long itemID;
@property (nonatomic) NSInteger itemTypeID;
@property (nonatomic) NSInteger actorID;
@property (nonatomic, copy) NSString *actorName;
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) long long locationID;
@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *passwordType;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger quantity;
@property (nonatomic, copy) NSString *oldConfiguration;
@property (nonatomic, copy) NSString *newConfiguration;

+ (id) containerLogItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEContainerLog : EVERequest {
	NSMutableArray *containerLog;
}
@property (nonatomic, retain) NSArray *containerLog;

+ (id) containerLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) containerLogWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
