//
//  EVECorporationSheet.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVECorporationSheetDivisionItem : EVEObject
@property (nonatomic) int32_t accountKey;
@property (nonatomic, copy) NSString *divisionDescription;
@end

@interface EVECorporationSheetLogo : EVEObject
@property (nonatomic) int32_t graphicID;
@property (nonatomic) int32_t shape1;
@property (nonatomic) int32_t shape2;
@property (nonatomic) int32_t shape3;
@property (nonatomic) int32_t color1;
@property (nonatomic) int32_t color2;
@property (nonatomic) int32_t color3;

@end


@interface EVECorporationSheet : EVEResult
@property (nonatomic) int32_t corporationID;
@property (nonatomic, strong) NSString *corporationName;
@property (nonatomic, strong) NSString *ticker;
@property (nonatomic) int32_t ceoID;
@property (nonatomic, strong) NSString *ceoName;
@property (nonatomic) int32_t stationID;
@property (nonatomic, strong) NSString *stationName;
@property (nonatomic, strong) NSString *corporationDescription;
@property (nonatomic, strong) NSString *url;
@property (nonatomic) int32_t allianceID;
@property (nonatomic, strong) NSString *allianceName;
@property (nonatomic) int32_t factionID;
@property (nonatomic, strong) NSString *factionName;
@property (nonatomic) float taxRate;
@property (nonatomic) int32_t memberCount;
@property (nonatomic) int32_t memberLimit;
@property (nonatomic) int32_t shares;
@property (nonatomic, strong) NSArray *divisions;
@property (nonatomic, strong) NSArray *walletDivisions;
@property (nonatomic, strong) EVECorporationSheetLogo *logo;
@end