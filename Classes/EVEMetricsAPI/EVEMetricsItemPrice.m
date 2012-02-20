//
//  EVEMetricsItemPrice.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMetricsItemPrice.h"


@implementation EVEMetricsItemPrice
@synthesize avg;
@synthesize median;
@synthesize min;
@synthesize max;
@synthesize kurtosis;
@synthesize skew;
@synthesize variance;
@synthesize standard_deviation;
@synthesize simulated;

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		avg = [[dictionary valueForKey:@"avg"] floatValue];
		median = [[dictionary valueForKey:@"median"] floatValue];
		min = [[dictionary valueForKey:@"min"] floatValue];
		max = [[dictionary valueForKey:@"max"] floatValue];
		kurtosis = [[dictionary valueForKey:@"kurtosis"] floatValue];
		skew = [[dictionary valueForKey:@"skew"] floatValue];
		variance = [[dictionary valueForKey:@"variance"] floatValue];
		standard_deviation = [[dictionary valueForKey:@"standard_deviation"] floatValue];
		simulated = [[dictionary valueForKey:@"simulated"] floatValue];
	}
	return self;
}

@end