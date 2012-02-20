//
//  EVEResearch.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEResearchItem : NSObject {
	NSInteger agentID;
	NSInteger skillTypeID;
	NSDate *researchStartDate;
	float pointsPerDay;
	float remainderPoints;
}
@property (nonatomic) NSInteger agentID;
@property (nonatomic) NSInteger skillTypeID;
@property (nonatomic, retain) NSDate *researchStartDate;
@property (nonatomic) float pointsPerDay;
@property (nonatomic) float remainderPoints;

+ (id) researchItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEResearch : EVERequest {
	NSMutableArray *research;
}
@property (nonatomic, retain) NSArray *research;

+ (id) researchWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) researchWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end
