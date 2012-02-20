//
//  EVEOnlineAPIAppDelegate.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "EVEOnlineAPIAppDelegate.h"
#import "EVEOnlineAPI.h"
#import "EVEMetricsAPI.h"
#import "EVEDBAPI.h"
#import "EVECentralAPI.h"
#import "RSS.h"
#import "BattleClinicAPI.h"

@implementation EVEOnlineAPIAppDelegate

@synthesize window;

#define KEY_ID 0
#define V_CODE @""

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[window makeKeyAndVisible];
	
	NSError* error = nil;
	EVECharacters *list = [EVECharacters charactersWithKeyID:KEY_ID vCode:V_CODE error:&error];
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
