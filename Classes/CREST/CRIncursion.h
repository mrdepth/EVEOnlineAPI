//
//  CRIncursion.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.01.16.
//
//

#import "EVEObject.h"

typedef NS_ENUM(NSInteger, CRIncursionState) {
	CRIncursionStateUnknown,
	CRIncursionStateMobilizing,
	CRIncursionStateEstablished,
	CRIncursionStateWithdrawing,
};

@interface CRIncursion : EVEObject
@property (nonatomic, assign) float influence;
@property (nonatomic, assign) BOOL hasBoss;
@property (nonatomic, assign) CRIncursionState state;
@property (nonatomic, assign) int32_t solarSystemID;
@property (nonatomic, strong) NSString* solarSystemName;
@property (nonatomic, assign) int32_t constellationID;
@property (nonatomic, strong) NSString* constellationName;
@end

@interface CRIncursionCollection : EVEObject
@property (nonatomic, strong) NSArray<CRIncursion*>* items;
+ (NSString*) contentType;
@end