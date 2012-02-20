//
//  EVECharacters.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharactersItem : NSObject {
	NSString *name;
	NSInteger characterID;
	NSString *corporationName;
	NSInteger corporationID;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic) NSInteger corporationID;

+ (id) charactersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECharacters : EVERequest {
	NSMutableArray *characters;
}
@property (nonatomic, retain) NSArray *characters;

+ (id) charactersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr;
+ (id) charactersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)object;

@end
