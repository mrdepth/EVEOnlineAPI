//
//  EVECorpContactList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECorpContactListItem : NSObject {
	NSInteger contactID;
	NSString *contactName;
	float standing;
}
@property (nonatomic) NSInteger contactID;
@property (nonatomic, copy) NSString *contactName;
@property (nonatomic) float standing;

+ (id) corpContactListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECorpContactList : EVERequest {
	NSMutableArray *corporateContactList;
	NSMutableArray *allianceContactList;
}
@property (nonatomic, retain) NSArray *corporateContactList;
@property (nonatomic, retain) NSArray *allianceContactList;

+ (id) corpContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) corpContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
