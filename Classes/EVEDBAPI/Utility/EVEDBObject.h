//
//  EVEDBObject.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 14.06.13.
//
//

#import <Foundation/Foundation.h>
#import "EVEDBDatabase.h"

@interface EVEDBObject : NSObject
+ (NSDictionary*) columnsMap;
- (id) initWithSQLRequest:(NSString*) request error:(NSError **)errorPtr;
- (id) initWithStatement:(sqlite3_stmt*) stmt;
- (void) setValuesWithStatement: (sqlite3_stmt*) stmt;
@end
