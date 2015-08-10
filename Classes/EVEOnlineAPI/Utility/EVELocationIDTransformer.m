//
//  EVELocationIDTransformer.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 10.08.15.
//
//

#import "EVELocationIDTransformer.h"

@implementation EVELocationIDTransformer

- (id)transformedValue:(id)value {
	int64_t locationID = [value longLongValue];
	if (66000000 < locationID && locationID < 66014933)
		locationID -= 6000001;
	else if (66014934 < locationID && locationID < 67999999)
		locationID -= 6000000;
	return @(locationID);
}

@end
