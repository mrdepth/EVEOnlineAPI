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

@end


@implementation EVEConquerableStationList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) conquerableStationListWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEConquerableStationList alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ConquerableStationList.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
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
@end