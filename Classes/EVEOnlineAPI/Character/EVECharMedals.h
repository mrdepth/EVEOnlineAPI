//
//  EVECharMedals.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharCurrentCorporationMedal : NSObject<NSCoding>
@property (nonatomic) NSInteger medalID;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) NSString *status;
@property (nonatomic) NSInteger issuerID;
@property (nonatomic, strong) NSDate *issued;

+ (id) charCurrentCorporationMedalWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECharOtherCorporationsMedal : NSObject<NSCoding>
@property (nonatomic) NSInteger medalID;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) NSString *status;
@property (nonatomic) NSInteger issuerID;
@property (nonatomic, strong) NSDate *issued;
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;

+ (id) charOtherCorporationsMedalWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECharMedals : EVERequest
@property (nonatomic, strong) NSArray *currentCorporation;
@property (nonatomic, strong) NSArray *otherCorporations;

+ (id) charMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end

