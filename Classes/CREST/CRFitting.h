//
//  CRFitting.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.11.15.
//
//

#import "EVEObject.h"

@interface CRFittingType : EVEObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) int32_t typeID;
- (NSDictionary*) dictionary;
@end

@interface CRFittingItem : EVEObject
@property (nonatomic, strong) CRFittingType* type;
@property (nonatomic, assign) int32_t flag;
@property (nonatomic, assign) int32_t quantity;
- (NSDictionary*) dictionary;
@end

@interface CRFitting : EVEObject
@property (nonatomic, strong) NSString* fittingDescription;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) CRFittingType* ship;
@property (nonatomic, assign) int64_t fittingID;
@property (nonatomic, strong) NSArray<CRFittingItem*>* items;

- (NSDictionary*) dictionary;
@end

@interface CRFittingCollection : EVEObject
@property (nonatomic, strong) NSArray<CRFitting*>* items;
+ (NSString*) contentType;
@end
