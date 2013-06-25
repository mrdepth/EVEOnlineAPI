//
//  BCRequest.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVECachedURLRequest.h"

@interface BCRequest : EVECachedURLRequest<NSXMLParserDelegate>
@property (nonatomic, readonly) NSString *text;


@end
