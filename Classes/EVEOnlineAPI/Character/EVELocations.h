//
//  EVELocations.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVELocationsItem : NSObject {
	long long itemID;
	NSString* itemName;
	float x;
	float y;
	float z;
}
@property (nonatomic) long long itemID;
@property (nonatomic, copy) NSString* itemName;
@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) float z;

+ (id) locationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVELocations : EVERequest {
	NSMutableArray *locations;
}
@property (nonatomic, retain) NSArray *locations;

+ (id) locationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids corporate: (BOOL) corporate error:(NSError **)errorPtr;
+ (id) locationsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids corporate: (BOOL) corporate error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;

@end
