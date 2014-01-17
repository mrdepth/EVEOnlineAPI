//
//  EVECentralRequest.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVECachedURLRequest.h"
#import "EVECentralGlobals.h"

@interface EVECentralRequest : EVECachedURLRequest<NSXMLParserDelegate, NSCoding>

@property (nonatomic, readonly, strong) NSString *text;
@property (nonatomic, readonly) NSString *validText;

@end