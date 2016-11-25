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
		return [NSURL URLWithString:[NSString stringWithFormat:@"https://imageserver.eveonline.com/Character/%d_%d.jpg", characterID, size]];
}

+ (NSURL*) corporationLogoURLWithCorporationID: (int32_t) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr {
	/*if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128 && size != EVEImageSize256) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else*/
		return [NSURL URLWithString:[NSString stringWithFormat:@"https://imageserver.eveonline.com/Corporation/%d_%d.png", corporationID, size]];
}

+ (NSURL*) allianceLogoURLWithAllianceID: (int32_t) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr {
	/*if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else*/
		return [NSURL URLWithString:[NSString stringWithFormat:@"https://imageserver.eveonline.com/Alliance/%d_%d.png", allianceID, size]];
}

+ (NSURL*) renderImageURLWithTypeID: (int32_t) typeID size: (EVEImageSize) size error:(NSError **)errorPtr {
	return [NSURL URLWithString:[NSString stringWithFormat:@"https://imageserver.eveonline.com/Render/%d_%d.png", typeID, size]];
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


@end
