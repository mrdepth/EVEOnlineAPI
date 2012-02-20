//
//  EVEDBEveUnit.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EVEDBEveUnit : NSObject {
	NSInteger unitID;
	NSString *unitName;
	NSString *displayName;
	NSString *description;
}
@property (nonatomic) NSInteger unitID;
@property (nonatomic, retain) NSString *unitName;
@property (nonatomic, retain) NSString *displayName;
@property (nonatomic, retain) NSString *description;

+ (id) eveUnitWithUnitID: (NSInteger)aUnitID error:(NSError **)errorPtr;
+ (id) eveUnitWithDictionary: (NSDictionary*) dictionary;
- (id) initWithUnitID: (NSInteger)aUnitID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
