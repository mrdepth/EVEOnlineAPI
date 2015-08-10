//
//  EVEShareholders.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEResult.h"

@interface EVEShareholdersItem : EVEObject
@property (nonatomic) int32_t shareholderID;
@property (nonatomic, copy) NSString *shareholderName;
@property (nonatomic) int32_t shares;
@end

@interface EVEShareholdersCharactersItem : EVEShareholdersItem
@property (nonatomic) int32_t shareholderCorporationID;
@property (nonatomic, copy) NSString *shareholderCorporationName;
@end

@interface EVEShareholders : EVEResult
@property (nonatomic, strong) NSArray *characters;
@property (nonatomic, strong) NSArray *corporations;
@end