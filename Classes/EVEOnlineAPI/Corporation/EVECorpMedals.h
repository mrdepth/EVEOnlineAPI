//
//  EVECorpMedals.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECorpMedalsItem : NSObject {
	NSInteger medalID;
	NSString *title;
	NSString *description;
	NSInteger creatorID;
	NSDate *created;
}
@property (nonatomic) NSInteger medalID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic) NSInteger creatorID;
@property (nonatomic, retain) NSDate *created;

+ (id) corpMedalsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECorpMedals : EVERequest {
	NSMutableArray *medals;
}
@property (nonatomic, retain) NSArray *medals;

+ (id) corpMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) corpMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end