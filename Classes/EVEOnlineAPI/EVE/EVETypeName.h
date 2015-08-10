//
//  EVETypeName.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 11.08.15.
//
//

#import "EVEResult.h"

@interface EVETypeNameItem : EVEObject
@property (nonatomic) int32_t typeID;
@property (nonatomic, copy) NSString *typeName;
@end

@interface EVETypeName : EVEResult
@property (nonatomic, strong) NSArray *types;
@end
