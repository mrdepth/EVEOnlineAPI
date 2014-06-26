//
//  EVEDBInvMetaGroup.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 17.06.13.
//
//

#import "EVEDBObject.h"

@class EVEDBEveIcon;
@interface EVEDBInvMetaGroup : EVEDBObject
@property (nonatomic) int32_t metaGroupID;
@property (nonatomic, strong) NSString *metaGroupName;
@property (nonatomic, strong) NSString *description;
@property (nonatomic) int32_t iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;

@end
