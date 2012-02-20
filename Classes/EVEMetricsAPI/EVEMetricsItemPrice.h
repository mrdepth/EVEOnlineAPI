//
//  EVEMetricsItemPrice.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EVEMetricsItemPrice: NSObject {
	float avg;
	float median;
	float min;
	float max;
	float kurtosis;
	float skew;
	float variance;
	float standard_deviation;
	float simulated;
}
@property (nonatomic) float avg;
@property (nonatomic) float median;
@property (nonatomic) float min;
@property (nonatomic) float max;
@property (nonatomic) float kurtosis;
@property (nonatomic) float skew;
@property (nonatomic) float variance;
@property (nonatomic) float standard_deviation;
@property (nonatomic) float simulated;

- (id) initWithDictionary: (NSDictionary*) dictionary;

@end