//
//  CRToken.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.11.15.
//
//

#import <Foundation/Foundation.h>

@interface CRToken : NSObject<NSCoding>
@property (nonatomic, strong) NSString* accessToken;
@property (nonatomic, strong) NSString* refreshToken;
@property (nonatomic, strong) NSString* tokenType;
@property (nonatomic, strong) NSDate* expiresOn;
@property (nonatomic, assign) int32_t characterID;
@property (nonatomic, strong) NSString* characterName;
@property (nonatomic, readonly, getter=isExpired) BOOL expired;

@end
