//
//  CRKillMail.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 09.11.15.
//
//

#import "EVEOnlineAPI.h"

@interface CRKillMailAttacker : EVEKillMailsAttacker
@end

@interface CRKillMailVictim : EVEKillMailsVictim
@end

@interface CRKillMailItem : EVEKillMailsItem
@end

@interface CRKillMail : EVEKillMailsKill

+ (NSString*) contentType;

@end
