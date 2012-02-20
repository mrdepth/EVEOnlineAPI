//
//  EVEDBEveIcon.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EVEDBEveIcon : NSObject {
	NSInteger iconID;
	NSString *iconFile;
	NSString *description;
	NSString *iconImageName;
}
@property(nonatomic) NSInteger iconID;
@property(nonatomic, retain) NSString *iconFile;
@property(nonatomic, retain) NSString *description;
@property(nonatomic, retain, readonly) NSString *iconImageName;

+ (id) eveIconWithIconID: (NSInteger)aIconID error:(NSError **)errorPtr;
+ (id) eveIconWithWithDictionary: (NSDictionary*) dictionary;
- (id) initWithIconID: (NSInteger)aIconID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;
@end