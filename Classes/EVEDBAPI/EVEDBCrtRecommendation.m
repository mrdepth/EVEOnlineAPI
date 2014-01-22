//
//  EVEDBCrtRecommendation.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBCrtRecommendation.h"
#import "EVEDBCrtCertificate.h"
#import "EVEDBInvType.h"

@interface EVEDBCrtRecommendation()
@property (nonatomic, readwrite, strong) EVEDBInvType* shipType;
@property (nonatomic, readwrite, strong) EVEDBCrtCertificate* certificate;

@end

@implementation EVEDBCrtRecommendation

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"recommendationID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"recommendationID"},
		  @"shipTypeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"shipTypeID"},
		  @"certificateID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"certificateID"},
		  @"recommendationLevel" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"recommendationLevel"}
		  };
	return map;
}

+ (id) crtRecommendationWithRecommendationID: (NSInteger)recommendationID error:(NSError **)errorPtr {
	return [[EVEDBCrtRecommendation alloc] initWithRecommendationID:recommendationID error:errorPtr];
}

- (id) initWithRecommendationID: (NSInteger)recommendationID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from crtRecommendations WHERE recommendationID=%d;", recommendationID]
								   error:errorPtr]) {
	}
	return self;
}

- (EVEDBInvType*) shipType {
	if (self.shipTypeID == 0)
		return nil;
	if (!_shipType) {
		_shipType = [EVEDBInvType invTypeWithTypeID:self.shipTypeID error:nil];
		if (!_shipType)
			_shipType = (EVEDBInvType*) [NSNull null];
	}
	if ((NSNull*) _shipType == [NSNull null])
		return nil;
	else
		return _shipType;
}

- (EVEDBCrtCertificate*) certificate {
	if (self.certificateID == 0)
		return nil;
	if (!_certificate) {
		_certificate = [EVEDBCrtCertificate crtCertificateWithCertificateID:self.certificateID error:nil];
		if (!_certificate)
			_certificate = (EVEDBCrtCertificate*) [NSNull null];
	}
	if ((NSNull*) _certificate == [NSNull null])
		return nil;
	else
		return _certificate;
}

@end