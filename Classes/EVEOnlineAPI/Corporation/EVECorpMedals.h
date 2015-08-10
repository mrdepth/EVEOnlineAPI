//
//  EVECorpMedals.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEResult.h"

@interface EVECorpMedalsItem : EVEObject
@property (nonatomic) int32_t medalID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *medalDescription;
@property (nonatomic) int32_t creatorID;
@property (nonatomic, strong) NSDate *created;
@end

@interface EVECorpMedals : EVEResult
@property (nonatomic, strong) NSArray *medals;
@end