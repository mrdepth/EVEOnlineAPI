//
//  EVEDBRamActivity.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EVEDBRamActivity : NSObject {
	NSInteger activityID;
	NSString *activityName;
	NSString *iconNo;
	NSString *description;
	BOOL published;
}
@property (nonatomic) NSInteger activityID;
@property (nonatomic, retain) NSString *activityName;
@property (nonatomic, retain) NSString *iconNo;
@property (nonatomic, retain) NSString *description;
@property (nonatomic) BOOL published;
@property(nonatomic, retain, readonly) NSString *iconImageName;

+ (id) ramActivityWithActivityID: (NSInteger)aActivityID error:(NSError **)errorPtr;
+ (id) ramActivityWithDictionary: (NSDictionary*) dictionary;
- (id) initWithActivityID: (NSInteger)aActivityID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end