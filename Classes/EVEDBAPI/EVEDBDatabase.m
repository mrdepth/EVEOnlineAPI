//
//  EVEDBDatabase.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEDBDatabase.h"

static EVEDBDatabase *singleton;

static int callback(void *pArg, int argc, char **argv, char **azColName){
	RequestArgument *requestArg = (RequestArgument*) pArg;
	NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
	for (int i = 0; i < argc; i++) {
		if (argv[i] && azColName[i]) {
			NSString *value = [[NSString alloc] initWithCString:argv[i] encoding:NSUTF8StringEncoding];
			NSString *key = [[NSString alloc] initWithCString:azColName[i] encoding:NSUTF8StringEncoding];
			[dic setValue:value
				   forKey:key];
			[value release];
			[key release];
		}
	}
	BOOL needsMore = YES;
	if (requestArg->delegate)
		requestArg->method(requestArg->delegate, requestArg->selector, dic, &needsMore);
	else if (requestArg->resultBlock)
		requestArg->resultBlock(dic, &needsMore);
	requestArg->numRecords++;
	[dic release];

	return needsMore ? SQLITE_OK : SQLITE_DONE;
}

@implementation EVEDBDatabase

+ (id) sharedDatabase {
	if (!singleton)
		singleton = [[EVEDBDatabase alloc] init];
	return singleton;
}

- (id) init {
	if (self = [super init]) {
		pDB = NULL;
		NSString *databasePath = [[NSBundle mainBundle] pathForResource:@"evedb" ofType:@"sqlite"];
		sqlite3_open([databasePath cStringUsingEncoding:NSUTF8StringEncoding], &pDB);
		if (!pDB) {
			[self release];
			return nil;
		}
	}
	return self;
}

- (NSError*) execWithSQLRequest: (NSString*)sqlRequest target:(id) target action:(SEL) action {
	RequestArgument arg;
	arg.delegate = target;
	arg.selector = action;
	arg.method = [target methodForSelector:action];
	arg.numRecords = 0;
	arg.resultBlock = nil;
	return [self execWithSQLRequest:sqlRequest argument:&arg];
}

- (NSError*) execWithSQLRequest: (NSString*)sqlRequest resultBlock:(EVEDBDatabaseResultBlock) block {
	RequestArgument arg;
	arg.delegate = nil;
	arg.selector = nil;
	arg.method = nil;
	arg.numRecords = 0;
	arg.resultBlock = block;
	return [self execWithSQLRequest:sqlRequest argument:&arg];
}

- (NSError*) execWithSQLRequest: (NSString*)sqlRequest argument:(RequestArgument*) argument {
	char *errmsg = NULL;
	int rc;
	@synchronized(self) {
		rc = sqlite3_exec(pDB, [sqlRequest cStringUsingEncoding:NSUTF8StringEncoding], callback, argument, &errmsg);
	}
	if( rc!=SQLITE_OK ){
		NSString *errorString = [NSString stringWithCString:errmsg encoding:NSUTF8StringEncoding];
		NSError *error = [NSError errorWithDomain:EVEDBErrorDomain code:rc userInfo:[NSDictionary dictionaryWithObject:errorString forKey:NSLocalizedDescriptionKey]];
		sqlite3_free(errmsg);
		return error;
	}
	else if (argument->numRecords == 0)
		return [NSError errorWithDomain:EVEDBErrorDomain code:EVEDBErrorNothingFound userInfo:[NSDictionary dictionaryWithObject:EVEDBErrorNothingFoundText forKey:NSLocalizedDescriptionKey]];
	
	return nil;
}

- (void) dealloc {
	@synchronized(self) {
		sqlite3_close(pDB);
	}
	singleton = nil;
	[super dealloc];
}

@end

