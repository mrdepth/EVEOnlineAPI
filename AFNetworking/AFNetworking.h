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




#ifndef _AFNETWORKING_
#define _AFNETWORKING_

#import <AFNetworking/AFURLRequestSerialization.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import <AFNetworking/AFSecurityPolicy.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>

#import <AFNetworking/AFURLConnectionOperation.h>
#import <AFNetworking/AFHTTPRequestOperation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>

#if ( ( defined(__MAC_OS_X_VERSION_MAX_ALLOWED) && __MAC_OS_X_VERSION_MAX_ALLOWED >= 1090) || \
( defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000 ) )
#import <AFNetworking/AFURLSessionManager.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#endif

#endif /* _AFNETWORKING_ */
