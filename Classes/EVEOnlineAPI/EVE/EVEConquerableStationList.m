//
//  EVEConquerableStationList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEConquerableStationList.h"


@implementation EVEConquerableStationListItem

+ (id) conquerableStationListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEConquerableStationListItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.stationID = [[attributeDict valueForKey:@"stationID"] intValue];
		self.stationName = [attributeDict valueForKey:@"stationName"];
		self.stationTypeID = [[attributeDict valueForKey:@"stationTypeID"] intValue];
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] intValue];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] intValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.stationID forKey:@"stationID"];
	[aCoder encodeObject:self.stationName forKey:@"stationName"];
	[aCoder encodeInt32:self.stationTypeID forKey:@"stationTypeID"];
	[aCoder encodeInt32:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeInt32:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.stationID = [aDecoder decodeInt32ForKey:@"stationID"];
		self.stationName = [aDecoder decodeObjectForKey:@"stationName"];
		self.stationTypeID = [aDecoder decodeInt32ForKey:@"stationTypeID"];
		self.solarSystemID = [aDecoder decodeInt32ForKey:@"solarSystemID"];
		self.corporationID = [aDecoder decodeInt32ForKey:@"corporationID"];
		self.corporationName = [aDecoder decodeObjectForKey:@"corporationName"];
	}
	return self;
}

@end


@implementation EVEConquerableStationList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) conquerableStationListWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEConquerableStationList alloc] initWithCachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ConquerableStationList.xml.aspx", EVEOnlineAPIHost]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"outposts"]) {
		self.outposts = [[NSMutableArray alloc] init];
		return self.outposts;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"outposts"]) {
		EVEConquerableStationListItem *conquerableStationListItem = [EVEConquerableStationListItem conquerableStationListItemWithXMLAttributes:attributeDict];
		[object addObject:conquerableStationListItem];
		return conquerableStationListItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.outposts forKey:@"outposts"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.outposts = [aDecoder decodeObjectForKey:@"outposts"];
	}
	return self;
}

@end