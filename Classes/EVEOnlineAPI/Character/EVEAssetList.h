//
//  EVEAssetList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEAssetListItem : NSObject {
	long long itemID;
	long long locationID;
	NSInteger typeID;
	NSInteger quantity;
	EVEInventoryFlag flag;
	BOOL singleton;
	NSMutableArray *contents;
	EVEAssetListItem* parent;
}
@property (nonatomic) long long itemID;
@property (nonatomic) long long locationID;
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger quantity;
@property (nonatomic) EVEInventoryFlag flag;
@property (nonatomic) BOOL singleton;
@property (nonatomic, retain) NSMutableArray *contents;
@property (nonatomic, assign) EVEAssetListItem* parent;

+ (id) assetListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVEAssetList : EVERequest {
	NSMutableArray *assets;
}
@property (nonatomic, retain) NSArray *assets;

+ (id) assetListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
+ (id) assetListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;

@end
