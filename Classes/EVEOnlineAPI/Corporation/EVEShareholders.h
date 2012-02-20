//
//  EVEShareholders.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEShareholdersCharactersItem : NSObject {
	NSInteger shareholderID;
	NSString *shareholderName;
	NSInteger shareholderCorporationID;
	NSString *shareholderCorporationName;
	NSInteger shares;
}
@property (nonatomic) NSInteger shareholderID;
@property (nonatomic, copy) NSString *shareholderName;
@property (nonatomic) NSInteger shareholderCorporationID;
@property (nonatomic, copy) NSString *shareholderCorporationName;
@property (nonatomic) NSInteger shares;

+ (id) shareholdersCharactersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEShareholdersCorporationsItem : NSObject {
	NSInteger shareholderID;
	NSString *shareholderName;
	NSInteger shares;
}
@property (nonatomic) NSInteger shareholderID;
@property (nonatomic, copy) NSString *shareholderName;
@property (nonatomic) NSInteger shares;

+ (id) shareholdersCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEShareholders : EVERequest {
	NSMutableArray *characters;
	NSMutableArray *corporations;
}
@property (nonatomic, retain) NSArray *characters;
@property (nonatomic, retain) NSArray *corporations;

+ (id) shareholdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
+ (id) shareholdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object;

@end