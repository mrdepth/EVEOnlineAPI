//
//  EVEMailingLists.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMailingListsItem : NSObject {
	NSInteger listID;
	NSString *displayName;
}
@property (nonatomic) NSInteger listID;
@property (nonatomic, copy) NSString *displayName;

+ (id) mailingListsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMailingLists : EVERequest {
	NSMutableArray *mailingLists;
	NSMutableDictionary *mailingListsMap;
}
@property (nonatomic, retain) NSArray *mailingLists;
@property (nonatomic, retain) NSDictionary *mailingListsMap;

+ (id) mailingListsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) mailingListsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
