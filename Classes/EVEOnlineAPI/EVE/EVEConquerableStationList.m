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
		self.stationID = [[attributeDict valueForKey:@"stationID"] integerValue];
		self.stationName = [attributeDict valueForKey:@"stationName"];
		self.stationTypeID = [[attributeDict valueForKey:@"stationTypeID"] integerValue];
		self.solarSystemID = [[attributeDict valueForKey:@"solarSystemID"] integerValue];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.stationID forKey:@"stationID"];
	[aCoder encodeObject:self.stationName forKey:@"stationName"];
	[aCoder encodeInteger:self.stationTypeID forKey:@"stationTypeID"];
	[aCoder encodeInteger:self.solarSystemID forKey:@"solarSystemID"];
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.stationID = [aDecoder decodeIntegerForKey:@"stationID"];
		self.stationName = [aDecoder decodeObjectForKey:@"stationName"];
		self.stationTypeID = [aDecoder decodeIntegerForKey:@"stationTypeID"];
		self.solarSystemID = [aDecoder decodeIntegerForKey:@"solarSystemID"];
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
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