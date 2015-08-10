//
//  EVEMailingLists.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEMailingListsItem : EVEObject
@property (nonatomic) int32_t listID;
@property (nonatomic, strong) NSString *displayName;
@end

@interface EVEMailingLists : EVEResult
@property (nonatomic, strong) NSArray *mailingLists;
@property (nonatomic, strong, readonly) NSDictionary *mailingListsMap;
@end
