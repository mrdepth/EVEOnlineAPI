//
//  EVECharContactList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECharContactListItem : NSObject {
	NSInteger contactID;
	NSString *contactName;
	BOOL inWatchlist;
	float standing;
}
@property (nonatomic) NSInteger contactID;
@property (nonatomic, copy) NSString *contactName;
@property (nonatomic) BOOL inWatchlist;
@property (nonatomic) float standing;

+ (id) charContactListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECharContactList : EVERequest {
	NSMutableArray *contactList;
}
@property (nonatomic, retain) NSArray *contactList;

+ (id) charContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) charContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
