//
//  EVEDBDatabase.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDatabase.h"

static EVEDBDatabase *singleton;

@interface EVEDBDatabase()
@property (nonatomic, assign) sqlite3 *db;
@end

@implementation EVEDBDatabase

+ (id) sharedDatabase {
	if (!singleton)
		singleton = [[EVEDBDatabase alloc] init];
	return singleton;
}

+ (void) setSharedDatabase:(EVEDBDatabase*) database {
	singleton = database;
}

- (id) init {
	NSString *databasePath = [[NSBundle mainBundle] pathForResource:@"evedb" ofType:@"sqlite"];
	if (self = [self initWithDatabasePath:databasePath]) {
	}
	return self;
}

- (id) initWithDatabasePath:(NSString*) path {
	if (self = [super init]) {
		_db = NULL;
		sqlite3_open([path cStringUsingEncoding:NSUTF8StringEncoding], &_db);
		if (!_db) {
			return nil;
		}
	}
	return self;
}

- (NSError*) execSQLRequest: (NSString*)sqlRequest resultBlock:(void (^)(sqlite3_stmt* stmt, BOOL *needsMore)) resultBlock {
	@synchronized(self) {
		sqlite3_stmt* stmt = NULL;
		int result = sqlite3_prepare_v2(_db, [sqlRequest cStringUsingEncoding:NSUTF8StringEncoding], (int) [sqlRequest lengthOfBytesUsingEncoding:NSUTF8StringEncoding], &stmt, NULL);
		
		if (!stmt) {
			const char* text = sqlite3_errmsg(_db);
			NSString* description = text ? [NSString stringWithCString:text encoding:NSUTF8StringEncoding] : nil;
			NSError* error = [NSError errorWithDomain:EVEDBErrorDomain code:result userInfo:description ? @{NSLocalizedDescriptionKey : description} : nil];
			return error;
		}
		
		BOOL needsMore = YES;
		int n = 0;
		while (sqlite3_step(stmt) == SQLITE_ROW && needsMore) {
			n++;
			resultBlock(stmt, &needsMore);
		}
		
		sqlite3_finalize(stmt);
		return n == 0 ? [NSError errorWithDomain:EVEDBErrorDomain code:EVEDBErrorNothingFound userInfo:@{NSLocalizedDescriptionKey : EVEDBErrorNothingFoundText}] : nil;
	}
}

- (void) dealloc {
	@synchronized(self) {
		sqlite3_close(_db);
	}
	singleton = nil;
}

@end

