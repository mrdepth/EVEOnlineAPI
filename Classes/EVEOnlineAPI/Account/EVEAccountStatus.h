//
//  EVEAccountStatus.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVEAccountStatus : EVERequest {
	NSDate *paidUntil;
	NSDate *createDate;
	NSInteger logonCount;
	NSInteger logonMinutes;
}
@property (nonatomic, retain) NSDate *paidUntil;
@property (nonatomic, retain) NSDate *createDate;
@property (nonatomic) NSInteger logonCount;
@property (nonatomic) NSInteger logonMinutes;

+ (id) accountStatusWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr;
+ (id) accountStatusWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode target:(id)target action:(SEL)action object:(id)object;


@end
