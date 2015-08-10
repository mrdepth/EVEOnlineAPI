//
//  EVECharacters.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVECharactersItem : EVEObject
@property (nonatomic) int32_t characterID;
@property (nonatomic, strong) NSString *characterName;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, strong) NSString *corporationName;
@property (nonatomic) int32_t allianceID;
@property (nonatomic, strong) NSString *allianceName;
@property (nonatomic) int32_t factionID;
@property (nonatomic, strong) NSString *factionName;

@end


@interface EVECharacters : EVEResult
@property (nonatomic, strong) NSArray *characters;
@end
