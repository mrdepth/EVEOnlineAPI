//
//  EVEShareholders.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEShareholdersCharactersItem : NSObject
@property (nonatomic) NSInteger shareholderID;
@property (nonatomic, copy) NSString *shareholderName;
@property (nonatomic) NSInteger shareholderCorporationID;
@property (nonatomic, copy) NSString *shareholderCorporationName;
@property (nonatomic) NSInteger shares;

+ (id) shareholdersCharactersItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEShareholdersCorporationsItem : NSObject
@property (nonatomic) NSInteger shareholderID;
@property (nonatomic, copy) NSString *shareholderName;
@property (nonatomic) NSInteger shares;

+ (id) shareholdersCorporationsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVEShareholders : EVERequest
@property (nonatomic, strong) NSArray *characters;
@property (nonatomic, strong) NSArray *corporations;

+ (id) shareholdersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end