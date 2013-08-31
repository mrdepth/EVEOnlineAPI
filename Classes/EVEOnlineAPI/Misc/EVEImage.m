//
//  EVEImage.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEImage.h"
#import "EVEGlobals.h"


@implementation EVEImage

+ (NSURL*) characterPortraitURLWithCharacterID: (NSInteger) characterID size: (EVEImageSize) size error:(NSError **)errorPtr {
	if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128 && size != EVEImageSize200 && size != EVEImageSize256 && size != EVEImageSize512 && size != EVEImageSize1024) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else
		return [NSURL URLWithString:[NSString stringWithFormat:@"http://image.eveonline.com/Character/%d_%d.jpg", characterID, size]];
}

+ (NSURL*) corporationLogoURLWithCorporationID: (NSInteger) corporationID size: (EVEImageSize) size error:(NSError **)errorPtr {
	if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128 && size != EVEImageSize256) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else
		return [NSURL URLWithString:[NSString stringWithFormat:@"http://image.eveonline.com/Corporation/%d_%d.png", corporationID, size]];
}

+ (NSURL*) allianceLogoURLWithAllianceID: (NSInteger) allianceID size: (EVEImageSize) size error:(NSError **)errorPtr {
	if (size != EVEImageSize32 && size != EVEImageSize64 && size != EVEImageSize128) {
		if (errorPtr)
			*errorPtr = [NSError errorWithDomain:EVEOnlineErrorDomain code:EVEErrorCodeInvalidImageSize userInfo:[NSDictionary dictionaryWithObject:EVEErrorCodeInvalidImageSizeText forKey:NSLocalizedDescriptionKey]];
		return nil;
	}
	else
		return [NSURL URLWithString:[NSString stringWithFormat:@"http://image.eveonline.com/Alliance/%d_%d.png", allianceID, size]];
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

@end
