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
#import "EVEzKillBoardAPI.h"

@implementation EVEOnlineAPIAppDelegate

@synthesize window;

#define KEY_ID 0
#define V_CODE @""

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	EVEzKillBoardSearch* search = [[EVEzKillBoardSearch alloc] initWithFilter:@{@"characterID": @1554561480,
																				@"orderDirection": @"asc",
																				@"limit": @1}
																		error:Nil
															  progressHandler:nil];
	[window makeKeyAndVisible];
	return YES;
}


@end
