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
			self.locationID = [[attributeDict valueForKey:@"locationID"] intValue];
			if (66000000 < _locationID && _locationID < 66014933)
				_locationID -= 6000001;
			else if (66014934 < _locationID && _locationID < 67999999)
				_locationID -= 6000000;
		}
		else
			self.locationID = 0;
		self.typeID = [[attributeDict valueForKey:@"typeID"] intValue];
		self.quantity = [[attributeDict valueForKey:@"quantity"] intValue];
		self.flag = [[attributeDict valueForKey:@"flag"] intValue];
		self.singleton = [[attributeDict valueForKey:@"singleton"] boolValue];
		self.contents = [NSMutableArray array];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt64:self.itemID forKey:@"itemID"];
	[aCoder encodeInt32:self.locationID forKey:@"locationID"];
	[aCoder encodeInt32:self.typeID forKey:@"typeID"];
	[aCoder encodeInt32:self.quantity forKey:@"quantity"];
	[aCoder encodeInt32:self.flag forKey:@"flag"];
	[aCoder encodeBool:self.singleton forKey:@"singleton"];
	[aCoder encodeObject:self.contents forKey:@"contents"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.itemID = [aDecoder decodeInt64ForKey:@"itemID"];
		self.locationID = [aDecoder decodeInt32ForKey:@"locationID"];
		self.typeID = [aDecoder decodeInt32ForKey:@"typeID"];
		self.quantity = [aDecoder decodeInt32ForKey:@"quantity"];
		self.flag = [aDecoder decodeInt32ForKey:@"flag"];
		self.singleton = [aDecoder decodeBoolForKey:@"singleton"];
		self.contents = [aDecoder decodeObjectForKey:@"contents"];
		for (EVEAssetListItem* asset in self.contents)
			asset.parent = self;
	}
	return self;
}

@end


@implementation EVEAssetList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) assetListWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEAssetList alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID corporate:corporate error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (int32_t) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (int32_t) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/AssetList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.assets forKey:@"assets"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.assets = [aDecoder decodeObjectForKey:@"assets"];
	}
	return self;
}

@end