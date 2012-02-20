//
//  EVEAPIKeyInfo.h
//  EVEOnlineAPI
//
//  Created by Shimanski on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEAPIKeyInfoCharactersItem : NSObject {
	NSInteger characterID;
	NSString *characterName;
	NSInteger corporationID;
	NSString *corporationName;
}
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *characterName;
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *corporationName;

+ (id) charactersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEAPIKeyInfoKey : NSObject {
	NSInteger accessMask;
	EVEAPIKeyType type;
	NSDate *expires;
}
@property (nonatomic) NSInteger accessMask;
@property (nonatomic) EVEAPIKeyType type;
@property (nonatomic, retain) NSDate *expires;

+ (id) keyWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end



@interface EVEAPIKeyInfo : EVERequest {
	EVEAPIKeyInfoKey *key;
	NSMutableArray *characters;
}
@property (nonatomic, retain) EVEAPIKeyInfoKey *key;
@property (nonatomic, retain) NSArray *characters;

+ (id) apiKeyInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr;
+ (id) apiKeyInfoWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)object;

@end
