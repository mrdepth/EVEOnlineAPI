//
//  EVECorporationSheet.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECorporationSheetDivisionItem : NSObject
@property (nonatomic) NSInteger accountKey;
@property (nonatomic, copy) NSString *description;

+ (id) corporationSheetDivisionItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECorporationSheetLogo : NSObject
@property (nonatomic) NSInteger graphicID;
@property (nonatomic) NSInteger shape1;
@property (nonatomic) NSInteger shape2;
@property (nonatomic) NSInteger shape3;
@property (nonatomic) NSInteger color1;
@property (nonatomic) NSInteger color2;
@property (nonatomic) NSInteger color3;

@end


@interface EVECorporationSheet : EVERequest
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic, copy) NSString *ticker;
@property (nonatomic) NSInteger ceoID;
@property (nonatomic, copy) NSString *ceoName;
@property (nonatomic) NSInteger stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *url;
@property (nonatomic) NSInteger allianceID;
@property (nonatomic, copy) NSString *allianceName;
@property (nonatomic) float taxRate;
@property (nonatomic) NSInteger memberCount;
@property (nonatomic) NSInteger memberLimit;
@property (nonatomic) NSInteger shares;
@property (nonatomic, strong) NSArray *divisions;
@property (nonatomic, strong) NSArray *walletDivisions;
@property (nonatomic, strong) EVECorporationSheetLogo *logo;

+ (id) corporationSheetWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporationID: (NSInteger) corporationID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporationID: (NSInteger) corporationID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end