//
//  NSDictionary+EVEDBAPI.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 17.06.13.
//
//

#import "NSDictionary+EVEDBAPI.h"

@implementation NSDictionary (EVEDBAPI)

+ (NSDictionary*) dictionaryWithStatement:(sqlite3_stmt*) stmt {
	NSMutableDictionary* dic = [NSMutableDictionary dictionary];
	int n = sqlite3_column_count(stmt);
	for (int32_t i = 0; i < n; i++) {
		const char* text = (const char*) sqlite3_column_text(stmt, i);
		const char* column = (const char*) sqlite3_column_name(stmt, i);
		if (text && column) {
			NSString* key = [NSString stringWithCString:column encoding:NSUTF8StringEncoding];
			NSString* value = [NSString stringWithCString:text encoding:NSUTF8StringEncoding];
			[dic setValue:value forKey:key];
		}
	}
	return dic;
}

@end
