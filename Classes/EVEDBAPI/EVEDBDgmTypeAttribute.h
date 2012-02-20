//
//  EVEDBDgmTypeAttribute.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBDgmAttributeType;
@interface EVEDBDgmTypeAttribute : NSObject {
	NSInteger typeID;
	NSInteger attributeID;
	EVEDBDgmAttributeType *attribute;
	float value;
	
}
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger attributeID;
@property (nonatomic, retain) EVEDBDgmAttributeType *attribute;
@property (nonatomic) float value;

+ (id) dgmTypeAttributeWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
