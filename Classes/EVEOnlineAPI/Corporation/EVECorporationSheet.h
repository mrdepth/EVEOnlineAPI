//
//  EVECorporationSheet.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECorporationSheetDivisionItem : NSObject {
	NSInteger accountKey;
	NSString *description;
}
@property (nonatomic) NSInteger accountKey;
@property (nonatomic, copy) NSString *description;

+ (id) corporationSheetDivisionItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end

@interface EVECorporationSheetLogo : NSObject {
	NSInteger graphicID;
	NSInteger shape1;
	NSInteger shape2;
	NSInteger shape3;
	NSInteger color1;
	NSInteger color2;
	NSInteger color3;
}
@property (nonatomic) NSInteger graphicID;
@property (nonatomic) NSInteger shape1;
@property (nonatomic) NSInteger shape2;
@property (nonatomic) NSInteger shape3;
@property (nonatomic) NSInteger color1;
@property (nonatomic) NSInteger color2;
@property (nonatomic) NSInteger color3;

@end


@interface EVECorporationSheet : EVERequest {
	NSInteger corporationID;
	NSString *corporationName;
	NSString *ticker;
	NSInteger ceoID;
	NSString *ceoName;
	NSInteger stationID;
	NSString *stationName;
	NSString *description;
	NSString *url;
	NSInteger allianceID;
	NSString *allianceName;
	float taxRate;
	NSInteger memberCount;
	NSInteger memberLimit;
	NSInteger shares;
	NSMutableArray *divisions;
	NSMutableArray *walletDivisions;
	EVECorporationSheetLogo *logo;
}
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *corporationName;
@property (nonatomic, copy) NSString *ticker;
@property (nonatomic) NSInteger ceoID;
@property (nonatomic, copy) NSString *ceoName;
@property (nonatomic) NSInteger stationID;
@property (nonatomic, copy) NSString *stationName;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *url;
@property (nonatomic) NSInteger allianceID;
@property (nonatomic, copy) NSString *allianceName;
@property (nonatomic) float taxRate;
@property (nonatomic) NSInteger memberCount;
@property (nonatomic) NSInteger memberLimit;
@property (nonatomic) NSInteger shares;
@property (nonatomic, retain) NSArray *divisions;
@property (nonatomic, retain) NSArray *walletDivisions;
@property (nonatomic, retain) EVECorporationSheetLogo *logo;

+ (id) corporationSheetWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporationID: (NSInteger) corporationID error:(NSError **)errorPtr;
+ (id) corporationSheetWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporationID: (NSInteger) corporationID target:(id)target action:(SEL)action object:(id)object;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporationID: (NSInteger) corporationID error:(NSError **)errorPtr;
- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporationID: (NSInteger) corporationID target:(id)target action:(SEL)action object:(id)object;

@end