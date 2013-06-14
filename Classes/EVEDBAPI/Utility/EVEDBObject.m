//
//  EVEDBObject.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 14.06.13.
//
//

#import "EVEDBObject.h"

@implementation EVEDBObject

+ (NSDictionary*) columnsMap {
	return nil;
}

- (id) initWithSQLRequest:(NSString*) request error:(NSError **)errorPtr {
	if (self = [super init]) {
		EVEDBDatabase *database = [EVEDBDatabase sharedDatabase];
		if (!database)
			return nil;
		
		NSError* error = [database execSQLRequest:request resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
			[self setValuesWithStatement:stmt];
			*needsMore = NO;
		}];
		if (error) {
			if (errorPtr)
				*errorPtr = error;
			return nil;
		}
	}
	return self;
}

- (id) initWithStatement:(sqlite3_stmt*) stmt {
	if (self = [super init]) {
		[self setValuesWithStatement:stmt];
	}
	return self;
}

- (void) setValuesWithStatement: (sqlite3_stmt*) stmt {
	NSDictionary* map = [[self class] columnsMap];
	
	int n = sqlite3_column_count(stmt);
	for (int i = 0; i < n; i++) {
		const char* columnName = sqlite3_column_name(stmt, i);
		if (!columnName)
			continue;
		NSString* key = [NSString stringWithCString:columnName encoding:NSUTF8StringEncoding];
		NSDictionary* record = map[key];
		if (record) {
			EVEDBType type = [record[@"type"] integerValue];
			NSString* keyPath = record[@"keyPath"];
			switch (type) {
				case EVEDBTypeInt: {
					int value = sqlite3_column_int(stmt, i);
					[self setValue:@(value) forKeyPath:keyPath];
					break;
				}
				case EVEDBTypeLongLong: {
					long long value = sqlite3_column_int64(stmt, i);
					[self setValue:@(value) forKeyPath:keyPath];
					break;
				}
				case EVEDBTypeFloat: {
					float value = sqlite3_column_double(stmt, i);
					[self setValue:@(value) forKeyPath:keyPath];
					break;
				}
				case EVEDBTypeText: {
					const char* text = (const char*) sqlite3_column_text(stmt, i);
					if (text)
						[self setValue:[NSString stringWithCString:text encoding:NSUTF8StringEncoding] forKeyPath:keyPath];
					break;
				}
				default:
					break;
			}
		}
	}
}


@end
