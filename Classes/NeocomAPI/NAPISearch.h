//
//  NAPISearch.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 18.06.13.
//
//

#import "EVECachedURLRequest.h"

@interface NAPISearchItem : NSObject
@property (nonatomic, strong) NSString* canonicalName;
@property (nonatomic, assign) NSInteger typeID;
@property (nonatomic, strong) NSString* typeName;
@property (nonatomic, assign) NSInteger groupID;
@property (nonatomic, strong) NSString* groupName;
@property (nonatomic, assign) NSInteger flags;
@property (nonatomic, assign) float ehp;
@property (nonatomic, assign) float tank;
@property (nonatomic, assign) float speed;
@property (nonatomic, assign) float totalDps;
@property (nonatomic, assign) float turretDps;
@property (nonatomic, assign) float droneDps;
@property (nonatomic, assign) float maxRange;
@property (nonatomic, assign) float falloff;
@end

@interface NAPISearch : EVECachedURLRequest
@property (nonatomic, strong) NSArray* loadouts;

+ (id) searchWithCriteria:(NSDictionary*) criteria error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithCriteria:(NSDictionary*) criteria error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end
