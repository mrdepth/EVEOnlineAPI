//
//  EVEDBInvTypeMaterial.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 13.08.12.
//
//

#import <Foundation/Foundation.h>

@class EVEDBInvType;
@interface EVEDBInvTypeMaterial : NSObject {
	NSInteger typeID;
	EVEDBInvType* type;
	NSInteger materialTypeID;
	EVEDBInvType* materialType;
	NSInteger quantity;
}
@property (nonatomic) NSInteger typeID;
@property (nonatomic, retain) EVEDBInvType* type;
@property (nonatomic) NSInteger materialTypeID;
@property (nonatomic, retain) EVEDBInvType* materialType;
@property (nonatomic) NSInteger quantity;

+ (id) invTypeMaterialWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
