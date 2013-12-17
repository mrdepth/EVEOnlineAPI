//
//  EVEStandings.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"


@interface EVEStandingsItem : NSObject<NSCoding>
@property (nonatomic) NSInteger fromID;
@property (nonatomic, copy) NSString *fromName;
@property (nonatomic) float standing;

+ (id) standingsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;
@end


@interface EVEStandingsNPCStandings : NSObject<NSCoding>
@property (nonatomic, strong) NSMutableArray *agents;
@property (nonatomic, strong) NSMutableArray *NPCCorporations;
@property (nonatomic, strong) NSMutableArray *factions;

@end


@interface EVEStandings : EVERequest
@property (nonatomic, strong) EVEStandingsNPCStandings *standings;

+ (id) standingsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
