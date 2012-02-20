//
//  EVEMetricsRequest.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVECachedURLRequest.h"
#import "EVEMetricsGlobals.h"


@interface EVEMetricsRequest : EVECachedURLRequest {
}
@end

@interface EVEMetricsRequest(Protected)
- (void) didParseObject: (id) object;
@end

@interface NSDateFormatter(EVEMetricsRequest)
+ (NSDateFormatter*) eveMetricsDateFormatter;
@end