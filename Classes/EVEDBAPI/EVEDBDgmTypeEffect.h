//
//  EVEDBDgmTypeEffect.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 4/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBInvType;
@class EVEDBDgmEffect;
@interface EVEDBDgmTypeEffect : NSObject {
	NSInteger typeID;
//	EVEDBInvType *type;
	NSInteger effectID;
	EVEDBDgmEffect *effect;
	BOOL isDefault;
}
@property(nonatomic) NSInteger typeID;
//@property(nonatomic, assign) EVEDBInvType *type;
@property(nonatomic) NSInteger effectID;
@property(nonatomic, retain) EVEDBDgmEffect *effect;
@property(nonatomic) BOOL isDefault;

+ (id) dgmTypeEffectWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end
