//
//  EVEStandings.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"


@interface EVEStandingsItem : NSObject {
	NSInteger fromID;
	NSString *fromName;
	float standing;
}
@property (nonatomic) NSInteger fromID;
@property (nonatomic, copy) NSString *fromName;
@property (nonatomic) float standing;

+ (id) standingsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;
@end


@interface EVEStandingsNPCStandings : NSObject {
	NSMutableArray *agents;
	NSMutableArray *NPCCorporations;
	NSMutableArray *factions;
}
@property (nonatomic, retain) NSMutableArray *agents;
@property (nonatomic, retain) NSMutableArray *NPCCorporations;
@property (nonatomic, retain) NSMutableArray *factions;

@end


@interface EVEStandings : EVERequest {
	EVEStandingsNPCStandings *standings;
}
@property (nonatomic, retain) EVEStandingsNPCStandings *standings;

+ (id) standingsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
+ (id) standingsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object;

@end
