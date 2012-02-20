//
//  EVEAllianceList.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEAllianceListItem : NSObject {
	NSString *name;
	NSString *shortName;
	NSInteger allianceID;
	NSInteger executorCorpID;
	NSInteger memberCount;
	NSDate *startDate;
	NSMutableArray *memberCorporations;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *shortName;
@property (nonatomic) NSInteger allianceID;
@property (nonatomic) NSInteger executorCorpID;
@property (nonatomic) NSInteger memberCount;
@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, retain) NSArray *memberCorporations;

+ (id) allianceListItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEAllianceListMemberCorporationsItem : NSObject {
	NSInteger corporationID;
	NSDate *startDate;
}
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, retain) NSDate *startDate;

+ (id) allianceListMemberCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEAllianceList : EVERequest {
	NSMutableArray *alliances;
	NSMutableDictionary* alliancesMap;
}
@property (nonatomic, retain) NSArray *alliances;
@property (nonatomic, retain) NSDictionary* alliancesMap;

+ (id) allianceListWithError:(NSError **)errorPtr;
+ (id) allianceListWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end
