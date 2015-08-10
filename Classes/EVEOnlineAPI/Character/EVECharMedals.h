//
//  EVECharMedals.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVECharMedal : EVEObject
@property (nonatomic) int32_t medalID;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, strong) NSString *status;
@property (nonatomic) int32_t issuerID;
@property (nonatomic, strong) NSDate *issued;
@end

@interface EVECharOtherCorporationsMedal : EVECharMedal
@property (nonatomic) int32_t corporationID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *medalDescription;
@end

@interface EVECharMedals : EVEResult
@property (nonatomic, strong) NSArray *currentCorporation;
@property (nonatomic, strong) NSArray *otherCorporations;
@end

