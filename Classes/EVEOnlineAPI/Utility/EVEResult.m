//
//  EVEResult.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 07.08.15.
//
//

#import "EVEResult.h"

@implementation EVEResult

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.eveapi = [aDecoder decodeObjectForKey:@"eveapi"];
	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.eveapi forKey:@"eveapi"];
}

@end
