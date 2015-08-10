//
//  EVEResult.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 07.08.15.
//
//

#import "EVEObject.h"
#import "EVEAPIObject.h"

@interface EVEResult : EVEObject
@property (nonatomic, strong) EVEAPIObject* eveapi;
@end