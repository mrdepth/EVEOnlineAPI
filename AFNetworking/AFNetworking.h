//
//  AFNetworking.h
//  AFNetworking
//
//  Created by Артем Шиманский on 05.08.15.
//
//

//#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Availability.h>

//! Project version number for AFNetworking.
FOUNDATION_EXPORT double AFNetworkingVersionNumber;

//! Project version string for AFNetworking.
FOUNDATION_EXPORT const unsigned char AFNetworkingVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <AFNetworking/PublicHeader.h>




#import <Foundation/Foundation.h>
#import <Availability.h>

#ifndef _AFNETWORKING_
#define _AFNETWORKING_

#import "AFURLRequestSerialization.h"
#import "AFURLResponseSerialization.h"
#import "AFSecurityPolicy.h"
#if !TARGET_OS_WATCH
#import "AFNetworkReachabilityManager.h"
#import "AFURLConnectionOperation.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#endif

#if ( ( defined(__MAC_OS_X_VERSION_MAX_ALLOWED) && __MAC_OS_X_VERSION_MAX_ALLOWED >= 1090) || \
( defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000 ) || \
TARGET_OS_WATCH )
#import "AFURLSessionManager.h"
#import "AFHTTPSessionManager.h"
#endif

#endif /* _AFNETWORKING_ */
