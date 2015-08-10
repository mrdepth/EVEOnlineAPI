//
//  EVEContactList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEContactListContact : EVEObject
@property (nonatomic) int32_t contactID;
@property (nonatomic, strong) NSString *contactName;
@property (nonatomic) float standing;
@property (nonatomic) int32_t contactTypeID;
@property (nonatomic) int32_t labelMask;
@property (nonatomic) BOOL inWatchlist;
@end

@interface EVEContactListLabel : EVEObject
@property (nonatomic) int32_t labelID;
@property (nonatomic, strong) NSString *name;
@end

@interface EVEContactList : EVEResult
@property (nonatomic, strong) NSArray *contactList;
@property (nonatomic, strong) NSArray *contactLabels;
@property (nonatomic, strong) NSArray *corporateContactList;
@property (nonatomic, strong) NSArray *corporateContactLabels;
@property (nonatomic, strong) NSArray *allianceContactList;
@property (nonatomic, strong) NSArray *allianceContactLabels;
@end
