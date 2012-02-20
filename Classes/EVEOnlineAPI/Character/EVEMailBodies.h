//
//  EVEMailBodies.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMailBodiesItem : NSObject {
	NSInteger messageID;
	NSString *text;
}
@property (nonatomic) NSInteger messageID;
@property (nonatomic, copy) NSString *text;

+ (id) mailBodiesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMailBodies : EVERequest {
	NSMutableArray *messages;
}
@property (nonatomic, retain) NSArray *messages;

+ (id) mailBodiesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids error:(NSError **)errorPtr;
+ (id) mailBodiesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID ids: (NSArray*) ids target:(id)target action:(SEL)action object:(id)object;

@end