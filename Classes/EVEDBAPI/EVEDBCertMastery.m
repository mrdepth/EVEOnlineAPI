//
//  EVEDBCertMastery.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 22.01.14.
//
//

#import "EVEDBCertMastery.h"
#import "EVEDBDatabase.h"
#import "EVEDBCertCertificate.h"

@interface EVEDBCertMastery()
@property (nonatomic, strong, readwrite) EVEDBCertCertificate* certificate;
@end


@implementation EVEDBCertMastery

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"typeID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"typeID"},
				@"masteryLevel" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"masteryLevel"},
				@"certID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"certificateID"}
				};
	
	return map;
}

- (EVEDBCertCertificate*) certificate {
	if (self.certificateID == 0)
		return nil;
	if (!_certificate) {
		_certificate = [EVEDBCertCertificate certCertificateWithCertificateID:self.certificateID error:nil];
		if (!_certificate)
			_certificate = (EVEDBCertCertificate*) [NSNull null];
	}
	if ((NSNull*) _certificate == [NSNull null])
		return nil;
	else
		return _certificate;
}

@end