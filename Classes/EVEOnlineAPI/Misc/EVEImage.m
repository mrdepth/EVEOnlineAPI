//
//  EVEImage.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEImage.h"

@interface EVEImage()
+ (int32_t) imageDimensionWithSize:(EVEImageSize) size;
@end

@implementation EVEImage

+ (NSURL*) characterPortraitURLWithCharacterID: (int32_t) characterID size: (EVEImageSize) size error:(NSError **)errorPtr {
	/*if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128 && size != EVEImageSize200 && size != EVEImageSize256 && size != EVEImageSize512 && size != EVEImageSize1024) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else*/
		return [NSURL URLWithString:[NSString stringWithFormat:@"http://image.eveonline.com/Character/%d_%d.jpg", characterID, [self imageDimensionWithSize:size]]];
}

+ (NSURL*) corporationLogoURLWithCorporationID: (int32_t) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr {
	/*if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128 && size != EVEImageSize256) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else*/
		return [NSURL URLWithString:[NSString stringWithFormat:@"http://image.eveonline.com/Corporation/%d_%d.png", corporationID, [self imageDimensionWithSize:size]]];
}

+ (NSURL*) allianceLogoURLWithAllianceID: (int32_t) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr {
	/*if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else*/
		return [NSURL URLWithString:[NSString stringWithFormat:@"http://image.eveonline.com/Alliance/%d_%d.png", allianceID, [self imageDimensionWithSize:size]]];
}

+ (id) characterPortraitImageWithCharacterID: (int32_t) characterID size: (EVEImageSize) size error:(NSError **)errorPtr {
	NSData *data = [NSData dataWithContentsOfURL:[self characterPortraitURLWithCharacterID:characterID size:size error:errorPtr]];
	return [[EVEImage alloc] initWithData:data];
}

+ (id) corporationLogoImageWithCorporationID: (int32_t) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr {
	NSData *data = [NSData dataWithContentsOfURL:[self corporationLogoURLWithCorporationID:corporationID size:size error:errorPtr]];
	return [[EVEImage alloc] initWithData:data];
}

+ (id) allianceLogoImageWithAllianceID: (int32_t) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr {
	NSData *data = [NSData dataWithContentsOfURL:[self allianceLogoURLWithAllianceID:allianceID size:size error:errorPtr]];
	return [[EVEImage alloc] initWithData:data];
}

#pragma mark - Private

+ (int32_t) imageDimensionWithSize:(EVEImageSize) size {
	static int32_t scale = 0;
	if (scale == 0)
		scale = [[UIScreen mainScreen] scale];
	
	BOOL retina = (size & EVEImageSizeRetina) == EVEImageSizeRetina && scale == 2;
	
	int32_t dimension = size & 0xfff;
	return retina ? dimension * 2 : dimension;
}

@end
