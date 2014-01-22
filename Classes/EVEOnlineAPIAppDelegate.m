//
//  EVEOnlineAPIAppDelegate.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "EVEOnlineAPIAppDelegate.h"
#import "EVEOnlineAPI.h"
#import "EVEDBAPI.h"
#import "EVECentralAPI.h"
#import "RSS.h"
#import "BattleClinicAPI.h"
#import "EVEKillNetAPI.h"

@implementation EVEOnlineAPIAppDelegate

@synthesize window;

#define KEY_ID 0
#define V_CODE @""

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	EVEDBInvType* dominix = [EVEDBInvType invTypeWithTypeID:645 error:nil];
	for (NSArray* masteries in dominix.masteries) {
		for (EVEDBCertMastery* mastery in masteries)
			NSLog(@"%@ %d", mastery.certificate.name, mastery.masteryLevel);
	}
	[window makeKeyAndVisible];
	return YES;
}


@end
