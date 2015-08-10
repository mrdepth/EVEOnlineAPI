//
//  EVEAPIKeyInfo.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"
#import "EVEGlobals.h"

@interface EVEAPIKeyInfoCharactersItem : EVEObject
@property (nonatomic) int32_t characterID;
@property (nonatomic, strong) NSString *characterName;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, strong) NSString *corporationName;
@property (nonatomic) int32_t allianceID;
@property (nonatomic, strong) NSString *allianceName;
@property (nonatomic) int32_t factionID;
@property (nonatomic, copy) NSString *factionName;

@end

@interface EVEAPIKeyInfoKey : EVEObject
@property (nonatomic) int32_t accessMask;
@property (nonatomic) EVEAPIKeyType type;
@property (nonatomic, strong) NSDate *expires;
@property (nonatomic, strong) NSArray *characters;
@end



@interface EVEAPIKeyInfo : EVEResult
@property (nonatomic, strong) EVEAPIKeyInfoKey *key;

@end
