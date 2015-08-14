//
//  EVEImage.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(int32_t, EVEImageSize) {
	EVEImageSize32 = 32,
	EVEImageSize64 = 64,
	EVEImageSize128 = 128,
	EVEImageSize200 = 200,
	EVEImageSize256 = 256,
	EVEImageSize512 = 512,
	EVEImageSize1024 = 1024,
	
	EVEImageSizeRetina = 0x1000,
	
	EVEImageSizeRetina32 = EVEImageSize32 | EVEImageSizeRetina,
	EVEImageSizeRetina64 = EVEImageSize64 | EVEImageSizeRetina,
	EVEImageSizeRetina128 = EVEImageSize128 | EVEImageSizeRetina,
	EVEImageSizeRetina200 = EVEImageSize200 | EVEImageSizeRetina,
	EVEImageSizeRetina256 = EVEImageSize256 | EVEImageSizeRetina,
	EVEImageSizeRetina512 = EVEImageSize512 | EVEImageSizeRetina,
	EVEImageSizeRetina1024 = EVEImageSize1024 | EVEImageSizeRetina,
	
};

@interface EVEImage : UIImage {
}
+ (NSURL*) characterPortraitURLWithCharacterID: (int32_t) characterID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (NSURL*) corporationLogoURLWithCorporationID: (int32_t) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (NSURL*) allianceLogoURLWithAllianceID: (int32_t) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr;

+ (id) characterPortraitImageWithCharacterID: (int32_t) characterID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (id) corporationLogoImageWithCorporationID: (int32_t) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (id) allianceLogoImageWithAllianceID: (int32_t) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr;

@end
