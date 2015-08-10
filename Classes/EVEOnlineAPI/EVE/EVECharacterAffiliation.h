//
//  EVECharacterAffiliation.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 11.08.15.
//
//

#import "EVEAPIKeyInfo.h"

@interface EVECharacterAffiliation : EVEResult
@property (nonatomic, strong) NSArray *characters;
@end
