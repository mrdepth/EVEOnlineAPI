//
//  EVEDBNpcGroup.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 27.01.14.
//
//

#import "EVEDBObject.h"

@class EVEDBEveIcon;
@interface EVEDBNpcGroup : EVEDBObject
@property (nonatomic, assign) int32_t npcGroupID;
@property (nonatomic, assign) int32_t parentNpcGroupID;
@property (nonatomic, strong) NSString* npcGroupName;
@property (nonatomic, assign) int32_t groupID;
@property (nonatomic, strong) NSString *iconName;



@end
