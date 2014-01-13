//
//  EVEImage.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEImage.h"
#import "EVEGlobals.h"

@interface EVEImage()
+ (NSInteger) imageDimensionWithSize:(EVEImageSize) size;
@end

@implementation EVEImage

+ (NSURL*) characterPortraitURLWithCharacterID: (NSInteger) characterID size: (EVEImageSize) size error:(NSError **)errorPtr {
	/*if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128 && size != EVEImageSize200 && size != EVEImageSize256 && size != EVEImageSize512 && size != EVEImageSize1024) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else*/
		return [NSURL URLWithString:[NSString stringWithFormat:@"http://image.eveonline.com/Character/%d_%d.jpg", characterID, [self imageDimensionWithSize:size]]];
}

+ (NSURL*) corporationLogoURLWithCorporationID: (NSInteger) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr {
	/*if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128 && size != EVEImageSize256) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else*/
		return [NSURL URLWithString:[NSString stringWithFormat:@"http://image.eveonline.com/Corporation/%d_%d.png", corporationID, [self imageDimensionWithSize:size]]];
}

+ (NSURL*) allianceLogoURLWithAllianceID: (NSInteger) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr {
	/*if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else*/
		return [NSURL URLWithString:[NSString stringWithFormat:@"http://image.eveonline.com/Alliance/%d_%d.png", allianceID, [self imageDimensionWithSize:size]]];
}

+ (id) characterPortraitImageWithCharacterID: (NSInteger) characterID size: (EVEImageSize) size error:(NSError **)errorPtr {
	NSData *data = [NSData dataWithContentsOfURL:[self characterPortraitURLWithCharacterID:characterID size:size error:errorPtr]];
	return [[EVEImage alloc] initWithData:data];
}

+ (id) corporationLogoImageWithCorporationID: (NSInteger) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr {
	NSData *data = [NSData dataWithContentsOfURL:[self corporationLogoURLWithCorporationID:corporationID size:size error:errorPtr]];
	return [[EVEImage alloc] initWithData:data];
}

+ (id) allianceLogoImageWithAllianceID: (NSInteger) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr {
	NSData *data = [NSData dataWithContentsOfURL:[self allianceLogoURLWithAllianceID:allianceID size:size error:errorPtr]];
	return [[EVEImage alloc] initWithData:data];
}

#pragma mark - Private

+ (NSInteger) imageDimensionWithSize:(EVEImageSize) size {
	static NSInteger scale = 0;
	if (scale == 0)
		scale = [[UIScreen mainScreen] scale];
	
	BOOL retina = (size & EVEImageSizeRetina) == EVEImageSizeRetina && scale == 2;
	
	NSInteger dimension = size & 0xfff;
	return retina ? dimension * 2 : dimension;
}

@end
