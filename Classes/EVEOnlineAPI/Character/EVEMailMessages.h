//
//  EVEMailMessages.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEMailMessagesItem : EVEObject
@property (nonatomic) int32_t messageID;
@property (nonatomic) int32_t senderID;
@property (nonatomic) NSString* senderName;
@property (nonatomic, strong) NSDate *sentDate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) int32_t toCorpOrAllianceID;
@property (nonatomic, strong) NSArray *toCharacterIDs;
@property (nonatomic, strong) NSArray *toListID;
@property (nonatomic, assign) int32_t senderTypeID;
@end

@interface EVEMailMessages : EVEResult
@property (nonatomic, strong) NSArray *messages;
@end
