//
//  EVEDBCrtClass.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVEDBCrtClass : NSObject {
	NSInteger classID;
	NSString *description;
	NSString *className;
}
@property (nonatomic) NSInteger classID;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *className;

+ (id) crtClassWithClassID: (NSInteger)aClassID error:(NSError **)errorPtr;
+ (id) crtClassWithDictionary: (NSDictionary*) dictionary;
- (id) initWithClassID: (NSInteger)aClassID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end