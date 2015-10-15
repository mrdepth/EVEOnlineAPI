//
//  NAPISearch.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 18.06.13.
//
//

#import "NAPISearch.h"
#import "NeocomAPI.h"

@implementation NAPISearchItem

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"typeID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"groupID":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"flags":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   
				   @"canonicalName":@{@"type":@(EVEXMLSchemePropertyTypeString), @"elementName":@"loadout"},
				   @"typeName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   @"groupName":@{@"type":@(EVEXMLSchemePropertyTypeString)},
				   
				   @"ehp":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"tank":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"speed":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"totalDps":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"turretDps":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"droneDps":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"maxRange":@{@"type":@(EVEXMLSchemePropertyTypeScalar)},
				   @"falloff":@{@"type":@(EVEXMLSchemePropertyTypeScalar)}};
	return scheme;
}

@end

@implementation NAPISearch

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"loadouts":@{@"type":@(EVEXMLSchemePropertyTypeArray), @"class":[NAPISearchItem class]}};
	return scheme;
}

- (id) initWithArray:(NSArray*) array {
	if (self = [super init]) {
		NSMutableArray* result = [NSMutableArray new];
		for (NSDictionary* dic in array) {
			id obj = [[NAPISearchItem alloc] initWithDictionary:dic];
			if (obj)
				[result addObject:obj];
		}
		self.loadouts = result;
	}
	return self;
}


@end
