//
//  EVEMailMessages.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMailMessagesItem : NSObject {
	NSInteger messageID;
	NSInteger senderID;
	NSDate *sentDate;
	NSString *title;
	NSInteger toCorpOrAllianceID;
	NSArray *toCharacterIDs;
	NSArray *toListIDs;
	BOOL read;
}
@property (nonatomic) NSInteger messageID;
@property (nonatomic) NSInteger senderID;
@property (nonatomic, retain) NSDate *sentDate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) NSInteger toCorpOrAllianceID;
@property (nonatomic, retain) NSArray *toCharacterIDs;
@property (nonatomic, retain) NSArray *toListIDs;
@property (nonatomic) BOOL read;

+ (id) mailMessagesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMailMessages : EVERequest {
	NSMutableArray *mailMessages;
}
@property (nonatomic, retain) NSArray *mailMessages;

+ (id) mailMessagesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) mailMessagesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
