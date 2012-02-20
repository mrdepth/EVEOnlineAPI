//
//  EVEOutpostList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEOutpostList.h"


@implementation EVEOutpostListItem
@synthesize stationID;
@synthesize ownerID;
@synthesize stationName;
@synthesize solarSystemID;
@synthesize dockingCostPerShipVolume;
@synthesize officeRentalCost;
@synthesize stationTypeID;
@synthesize reprocessingEfficiency;
@synthesize reprocessingStationTake;
@synthesize standingOwnerID;


+ (id) outpostListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEOutpostListItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.stationID = [[attributeDict valueForKey:@"stationID"] integerValue];
		self.ownerID = [[attributeDict valueForKey:@"ownerID"] integerValue];
		self.stationName = [attributeDict valueForKey:@"stationName"];
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.dockingCostPerShipVolume = [[attributeDict valueForKey:@"dockingCostPerShipVolume"] floatValue];
		self.officeRentalCost = [[attributeDict valueForKey:@"officeRentalCost"] floatValue];
		self.stationTypeID = [[attributeDict valueForKey:@"stationTypeID"] integerValue];
		self.reprocessingEfficiency = [[attributeDict valueForKey:@"reprocessingEfficiency"] floatValue];
		self.reprocessingStationTake = [[attributeDict valueForKey:@"reprocessingStationTake"] floatValue];
		self.standingOwnerID = [[attributeDict valueForKey:@"standingOwnerID"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[stationName release];
	[super dealloc];
}

@end


@implementation EVEOutpostList
@synthesize corporationStarbases;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) outpostListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEOutpostList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) outpostListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEOutpostList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/OutpostList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/OutpostList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[corporationStarbases release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"corporationStarbases"]) {
		corporationStarbases = [[NSMutableArray alloc] init];
		return corporationStarbases;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"corporationStarbases"]) {
		EVEOutpostListItem *outpostListItem = [EVEOutpostListItem outpostListItemWithXMLAttributes:attributeDict];
		[corporationStarbases addObject:outpostListItem];
		return outpostListItem;
	}
	return nil;
}

@end