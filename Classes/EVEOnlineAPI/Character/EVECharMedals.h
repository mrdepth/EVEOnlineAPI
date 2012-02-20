//
//  EVECharMedals.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharCurrentCorporationMedal : NSObject {
	NSInteger medalID;
	NSString *reason;
	NSString *status;
	NSInteger issuerID;
	NSDate *issued;
}
@property (nonatomic) NSInteger medalID;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) NSString *status;
@property (nonatomic) NSInteger issuerID;
@property (nonatomic, retain) NSDate *issued;

+ (id) charCurrentCorporationMedalWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECharOtherCorporationsMedal : NSObject {
	NSInteger medalID;
	NSString *reason;
	NSString *status;
	NSInteger issuerID;
	NSDate *issued;
	NSInteger corporationID;
	NSString *title;
	NSString *description;
}
@property (nonatomic) NSInteger medalID;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) NSString *status;
@property (nonatomic) NSInteger issuerID;
@property (nonatomic, retain) NSDate *issued;
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;

+ (id) charOtherCorporationsMedalWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECharMedals : EVERequest {
	NSMutableArray *currentCorporation;
	NSMutableArray *otherCorporations;
}
@property (nonatomic, retain) NSArray *currentCorporation;
@property (nonatomic, retain) NSArray *otherCorporations;

+ (id) charMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) charMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end

