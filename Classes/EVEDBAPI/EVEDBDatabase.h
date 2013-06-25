//
//  EVEDBDatabase.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVEDBGlobals.h"
#import <sqlite3.h>

typedef enum {
	EVEDBTypeInt,
	EVEDBTypeLongLong,
	EVEDBTypeFloat,
	EVEDBTypeText
} EVEDBType;

@protocol EVEDBDatabaseRequestDelegate
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@interface EVEDBDatabase : NSObject

+ (id) sharedDatabase;
- (NSError*) execSQLRequest: (NSString*)sqlRequest resultBlock:(void (^)(sqlite3_stmt* stmt, BOOL *needsMore)) resultBlock;
@end
