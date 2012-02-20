//
//  EVEDBInvControlTowerResourcePurpose.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EVEDBInvControlTowerResourcePurpose : NSObject {
	NSInteger purposeID;
	NSString *purposeText;
}
@property (nonatomic) NSInteger purposeID;
@property (nonatomic, retain) NSString *purposeText;

+ (id) invControlTowerResourcePurposeWithPurposeID: (NSInteger)aPurposeID error:(NSError **)errorPtr;
+ (id) invControlTowerResourcePurposeWithDictionary: (NSDictionary*) dictionary;
- (id) initWithPurposeID: (NSInteger)aPurposeID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
