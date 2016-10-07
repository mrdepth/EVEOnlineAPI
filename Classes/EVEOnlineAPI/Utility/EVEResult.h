//
//  EVEResult.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 07.08.15.
//
//

#import "EVEObject.h"
#import "EVEAPIObject.h"
#import "EVEGlobals.h"
#import "EVEHTTPSessionManager.h"

@interface EVEResult : EVEObject<EVEHTTPCachedContent>
@property (nonatomic, strong) EVEAPIObject* eveapi;
@end
