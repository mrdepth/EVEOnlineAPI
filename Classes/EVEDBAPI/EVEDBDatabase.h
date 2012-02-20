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

@protocol EVEDBDatabaseRequestDelegate
- (void) didReceiveRecord: (NSDictionary*) record;
@end

typedef void (^EVEDBDatabaseResultBlock)(NSDictionary *record, BOOL *needsMore);

typedef struct {
	id delegate;
	SEL selector;
	IMP method;
	int numRecords;
	EVEDBDatabaseResultBlock resultBlock;
} RequestArgument;

@interface EVEDBDatabase : NSObject {
	sqlite3 *pDB;
}

+ (id) sharedDatabase;
- (NSError*) execWithSQLRequest: (NSString*)sqlRequest target:(id) target action:(SEL) action;
- (NSError*) execWithSQLRequest: (NSString*)sqlRequest resultBlock:(EVEDBDatabaseResultBlock) block;
- (NSError*) execWithSQLRequest: (NSString*)sqlRequest argument:(RequestArgument*) argument;
@end
