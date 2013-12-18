//
//  EVEOutpostList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVEOutpostList.h"


@implementation EVEOutpostListItem

+ (id) outpostListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEOutpostListItem alloc] initWithXMLAttributes:attributeDict];
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.stationID forKey:@"stationID"];
	[aCoder encodeInteger:self.ownerID forKey:@"ownerID"];
	[aCoder encodeObject:self.stationName forKey:@"stationName"];
	[aCoder encodeInteger:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeFloat:self.officeRentalCost forKey:@"dockingCostPerShipVolume"];
	[aCoder encodeFloat:self.dockingCostPerShipVolume forKey:@"officeRentalCost"];
	[aCoder encodeInteger:self.stationTypeID forKey:@"stationTypeID"];
	[aCoder encodeFloat:self.reprocessingEfficiency forKey:@"reprocessingEfficiency"];
	[aCoder encodeFloat:self.reprocessingStationTake forKey:@"reprocessingStationTake"];
	[aCoder encodeInteger:self.standingOwnerID	forKey:@"standingOwnerID"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.stationID = [aDecoder decodeIntegerForKey:@"stationID"];
		self.ownerID = [aDecoder decodeIntegerForKey:@"ownerID"];
		self.stationName = [aDecoder decodeObjectForKey:@"stationName"];
		self.solarSystemID = [aDecoder decodeIntegerForKey:@"solarSystemID"];
		self.dockingCostPerShipVolume = [aDecoder decodeFloatForKey:@"dockingCostPerShipVolume"];
		self.officeRentalCost = [aDecoder decodeFloatForKey:@"officeRentalCost"];
		self.stationTypeID = [aDecoder decodeIntegerForKey:@"stationTypeID"];
		self.reprocessingEfficiency = [aDecoder decodeFloatForKey:@"reprocessingEfficiency"];
		self.reprocessingStationTake = [aDecoder decodeFloatForKey:@"reprocessingStationTake"];
		self.standingOwnerID = [aDecoder decodeIntegerForKey:@"standingOwnerID"];
	}
	return self;
}

@end


@implementation EVEOutpostList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) outpostListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEOutpostList alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/OutpostList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}


#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"corporationStarbases"]) {
		self.corporationStarbases = [[NSMutableArray alloc] init];
		return self.corporationStarbases;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"corporationStarbases"]) {
		EVEOutpostListItem *outpostListItem = [EVEOutpostListItem outpostListItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.corporationStarbases addObject:outpostListItem];
		return outpostListItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.corporationStarbases forKey:@"corporationStarbases"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.corporationStarbases = [aDecoder decodeObjectForKey:@"corporationStarbases"];
	}
	return self;
}

@end