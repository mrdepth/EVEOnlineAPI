//
//  NSDateFormatter+EVEOnlineAPI.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 07.08.15.
//
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (EVEOnlineAPI)
+ (NSDateFormatter*) eveDateFormatter;
+ (NSDateFormatter*) crestDateFormatter;
+ (NSDateFormatter*) rfc822DateFormatter;

@end
