//
//  EVEAPIObject.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 07.08.15.
//
//

#import "EVEObject.h"

@interface EVEAPIObject : EVEObject
@property (nonatomic, strong) NSDate *currentTime;
@property (nonatomic, strong) NSDate *cachedUntil;
@property (nonatomic, strong) NSDate *cacheDate;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, strong) NSError* error;

- (NSDate*) currentServerTime;
- (NSDate*) serverTimeWithLocalTime:(NSDate*) localTime;
- (NSDate*) localTimeWithServerTime:(NSDate*) serverTime;

@end