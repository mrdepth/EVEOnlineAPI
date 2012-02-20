//
//  EVEImage.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	EVEImageSize32 = 32,
	EVEImageSize64 = 64,
	EVEImageSize128 = 128,
	EVEImageSize256 = 256
} EVEImageSize;

@interface EVEImage : UIImage {
}
+ (NSURL*) characterPortraitURLWithCharacterID: (NSInteger) characterID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (NSURL*) corporationLogoURLWithCorporationID: (NSInteger) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (NSURL*) allianceLogoURLWithAllianceID: (NSInteger) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr;

+ (id) characterPortraitImageWithCharacterID: (NSInteger) characterID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (id) corporationLogoImageWithCorporationID: (NSInteger) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (id) allianceLogoImageWithAllianceID: (NSInteger) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr;

@end
