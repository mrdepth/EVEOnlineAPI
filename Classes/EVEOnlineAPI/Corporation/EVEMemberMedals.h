//
//  EVEMemberMedals.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEMemberMedalsItem : NSObject {
	NSInteger medalID;
	NSInteger characterID;
	NSString *reason;
	NSString *status;
	NSInteger issuerID;
	NSDate *issued;
}
@property (nonatomic) NSInteger medalID;
@property (nonatomic) NSInteger characterID;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) NSString *status;
@property (nonatomic) NSInteger issuerID;
@property (nonatomic, retain) NSDate *issued;

+ (id) memberMedalsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVEMemberMedals : EVERequest {
	NSMutableArray *issuedMedals;
}
@property (nonatomic, retain) NSArray *issuedMedals;

+ (id) memberMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) memberMedalsWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end