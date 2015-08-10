//
//  EVEAssetList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAssetList.h"

@implementation EVEAssetListItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"itemID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"locationID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"quantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"rawQuantity":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"flag":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"singleton":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"contents":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEAssetListItem class]}};
	return scheme;
}

- (id) initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super initWithDictionary:dictionary]) {
		for (EVEAssetListItem* item in self.contents)
			item.parent = self;
	}
	return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		for (EVEAssetListItem* item in self.contents)
			item.parent = self;
	}
	return self;
}

@end


@implementation EVEAssetList

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"assets":@{@"type":@(EVEXMLSchemePropertyTypeRowset), @"class":[EVEAssetListItem class]}};
	return scheme;
}

@end