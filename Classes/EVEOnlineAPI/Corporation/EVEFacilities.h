//
//  EVEFacilities.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 10.08.15.
//
//

#import "EVEResult.h"

@interface EVEFacilitiesItem : EVEObject
@property (nonatomic) int64_t facilityID;
@property (nonatomic) int32_t typeID;
@property (nonatomic, strong) NSString* typeName;
@property (nonatomic) int32_t solarSystemID;
@property (nonatomic, strong) NSString* solarSystemName;
@property (nonatomic) int32_t regionID;
@property (nonatomic, strong) NSString* regionName;
@property (nonatomic) int32_t starbaseModifier;
@property (nonatomic) float tax;
@end


@interface EVEFacilities : EVEResult
@property (nonatomic, strong) NSArray *facilities;

@end
