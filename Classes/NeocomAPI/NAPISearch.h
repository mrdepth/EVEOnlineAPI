//
//  NAPISearch.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 18.06.13.
//
//

#import "EVEObject.h"

@interface NAPISearchItem : EVEObject
@property (nonatomic, strong) NSString* canonicalName;
@property (nonatomic, assign) int32_t typeID;
@property (nonatomic, strong) NSString* typeName;
@property (nonatomic, assign) int32_t groupID;
@property (nonatomic, strong) NSString* groupName;
@property (nonatomic, assign) int32_t flags;
@property (nonatomic, assign) float ehp;
@property (nonatomic, assign) float tank;
@property (nonatomic, assign) float speed;
@property (nonatomic, assign) float totalDps;
@property (nonatomic, assign) float turretDps;
@property (nonatomic, assign) float droneDps;
@property (nonatomic, assign) float maxRange;
@property (nonatomic, assign) float falloff;
@end

@interface NAPISearch : EVEObject
@property (nonatomic, strong) NSArray* loadouts;

- (id) initWithArray:(NSArray*) array;

@end
