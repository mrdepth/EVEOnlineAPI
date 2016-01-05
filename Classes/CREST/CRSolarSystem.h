//
//  CRSolarSystem.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.01.16.
//
//

#import "EVEObject.h"

@interface CRSolarSystem : EVEObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) float securityStatus;
@property (nonatomic, strong) NSString* securityClass;
@property (nonatomic, assign) int32_t ownerID;
@property (nonatomic, strong) NSString* ownerName;
+ (NSString*) contentType;

@end

