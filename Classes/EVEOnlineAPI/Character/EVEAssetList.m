//
//  EVEAssetList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAssetList.h"

@implementation EVEAssetListItem

+ (id) assetListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEAssetListItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.itemID = [[attributeDict valueForKey:@"itemID"] longLongValue];
		if ([attributeDict valueForKey:@"locationID"]) {
			self.locationID = [[attributeDict valueForKey:@"locationID"] longLongValue];
			if (66000000 < _locationID && _locationID < 66014933)
				_locationID -= 6000001;
			else if (66014934 < _locationID && _locationID < 67999999)
				_locationID -= 6000000;
		}
		else
			self.locationID = 0;
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.quantity = [[attributeDict valueForKey:@"quantity"] integerValue];
		self.flag = [[attributeDict valueForKey:@"flag"] integerValue];
		self.singleton = [[attributeDict valueForKey:@"singleton"] boolValue];
		self.contents = [NSMutableArray array];
	}
	return self;
}

@end


@implementation EVEAssetList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) assetListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEAssetList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/AssetList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"assets"]) {
		self.assets = [[NSMutableArray alloc] init];
		return self.assets;
	}
	else if ([rowset isEqualToString:@"contents"]) {
		return [[self currentRow] contents];
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"assets"] || [rowset isEqualToString:@"contents"]) {
		EVEAssetListItem *asset = [EVEAssetListItem assetListItemWithXMLAttributes:attributeDict];
		[object addObject:asset];
		asset.parent = self.currentRow;
		return asset;
	}
	return nil;
}

@end