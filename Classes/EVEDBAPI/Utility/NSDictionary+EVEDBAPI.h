//
//  NSDictionary+EVEDBAPI.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 17.06.13.
//
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface NSDictionary (EVEDBAPI)

+ (NSDictionary*) dictionaryWithStatement:(sqlite3_stmt*) stmt;
@end
