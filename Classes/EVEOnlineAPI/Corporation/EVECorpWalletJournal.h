//
//  EVECorpWalletJournal.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECorpWalletJournalItem : NSObject {
	NSDate *date;
	NSInteger refID;
	NSInteger refTypeID;
	NSString *ownerName1;
	NSInteger ownerID1;
	NSString *ownerName2;
	NSInteger ownerID2;
	NSString *argName1;
	NSInteger argID1;
	float amount;
	float balance;
	NSString *reason;
}
@property (nonatomic, retain) NSDate *date;
@property (nonatomic) NSInteger refID;
@property (nonatomic) NSInteger refTypeID;
@property (nonatomic, copy) NSString *ownerName1;
@property (nonatomic) NSInteger ownerID1;
@property (nonatomic, copy) NSString *ownerName2;
@property (nonatomic) NSInteger ownerID2;
@property (nonatomic, copy) NSString *argName1;
@property (nonatomic) NSInteger argID1;
@property (nonatomic) float amount;
@property (nonatomic) float balance;
@property (nonatomic, copy) NSString *reason;

+ (id) corpWalletJournalItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECorpWalletJournal : EVERequest {
	NSMutableArray *corpWalletJournal;
}
@property (nonatomic, retain) NSArray *corpWalletJournal;

+ (id) corpWalletJournalWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeRefID: (long long) beforeRefID error:(NSError **)errorPtr;
+ (id) corpWalletJournalWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeRefID: (long long) beforeRefID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeRefID: (long long) beforeRefID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID beforeRefID: (long long) beforeRefID target:(id)target action:(SEL)action object:(id)object;

@end
