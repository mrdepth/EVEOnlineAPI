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
@property (nonatomic, assign) NSInteger npcGroupID;
@property (nonatomic, assign) NSInteger parentNpcGroupID;
@property (nonatomic, strong) NSString* npcGroupName;
@property (nonatomic, assign) NSInteger groupID;
@property (nonatomic, strong) NSString *iconName;



@end
