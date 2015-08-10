//
//  EVEMemberMedals.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEMemberMedalsItem : EVEObject
@property (nonatomic) int32_t medalID;
@property (nonatomic) int32_t characterID;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, strong) NSString *status;
@property (nonatomic) int32_t issuerID;
@property (nonatomic, strong) NSDate *issued;
@end

@interface EVEMemberMedals : EVEResult
@property (nonatomic, strong) NSArray *issuedMedals;
@end