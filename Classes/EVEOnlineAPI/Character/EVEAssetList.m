//
//  EVEAssetList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEAssetList.h"

@implementation EVEAssetListItem
@synthesize itemID;
@synthesize locationID;
@synthesize typeID;
@synthesize quantity;
@synthesize flag;
@synthesize singleton;
@synthesize contents;
@synthesize parent;

+ (id) assetListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEAssetListItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.itemID = [[attributeDict valueForKey:@"itemID"] longLongValue];
		if ([attributeDict valueForKey:@"locationID"]) {
			self.locationID = [[attributeDict valueForKey:@"locationID"] longLongValue];
			if (66000000 < locationID && locationID < 66014933)
				locationID -= 6000001;
			else if (66014934 < locationID && locationID < 67999999)
				locationID -= 6000000;
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

- (void) dealloc {
	[contents release];
	[super dealloc];
}

@end


@implementation EVEAssetList
@synthesize assets;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) assetListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	return [[[EVEAssetList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate error:errorPtr] autorelease];
}

+ (id) assetListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEAssetList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID corporate:corporate target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/AssetList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID corporate: (BOOL) corporate target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/AssetList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, (corporate ? @"corp" : @"char") ,keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[assets release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"assets"]) {
		assets = [[NSMutableArray alloc] init];
		return assets;
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