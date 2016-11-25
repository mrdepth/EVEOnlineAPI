//
//  EVEImage.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

typedef NS_ENUM(int32_t, EVEImageSize) {
	EVEImageSize32 = 32,
	EVEImageSize64 = 64,
	EVEImageSize128 = 128,
	EVEImageSize200 = 200,
	EVEImageSize256 = 256,
	EVEImageSize512 = 512,
	EVEImageSize1024 = 1024,
	
	EVEImageSizeRetina = 0x1000,
	
	EVEImageSizeRetina32 = EVEImageSize64,
	EVEImageSizeRetina64 = EVEImageSize128,
	EVEImageSizeRetina128 = EVEImageSize256,
	EVEImageSizeRetina200 =EVEImageSize512,
	EVEImageSizeRetina256 = EVEImageSize512,
	EVEImageSizeRetina512 = EVEImageSize1024,
	EVEImageSizeRetina1024 = EVEImageSize1024
	
};

#if TARGET_OS_IOS
@interface EVEImage : UIImage
#else
@interface EVEImage : NSImage
#endif
+ (NSURL*) characterPortraitURLWithCharacterID: (int32_t) characterID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (NSURL*) corporationLogoURLWithCorporationID: (int32_t) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (NSURL*) allianceLogoURLWithAllianceID: (int32_t) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (NSURL*) renderImageURLWithTypeID: (int32_t) typeID size: (EVEImageSize) size error:(NSError **)errorPtr;

+ (id) characterPortraitImageWithCharacterID: (int32_t) characterID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (id) corporationLogoImageWithCorporationID: (int32_t) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr;
+ (id) allianceLogoImageWithAllianceID: (int32_t) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr;

@end
