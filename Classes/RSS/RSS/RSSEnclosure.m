//
//  RSSEnclosure.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSEnclosure.h"


@implementation RSSEnclosure

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.url = [aDecoder decodeObjectForKey:@"url"];
		self.length = [aDecoder decodeInt32ForKey:@"length"];
		self.type = [aDecoder decodeObjectForKey:@"type"];
	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	if (self.url)
		[aCoder encodeObject:self.url forKey:@"url"];
	[aCoder encodeInt32:self.length forKey:@"length"];
	if (self.type)
		[aCoder encodeObject:self.type forKey:@"type"];
}

@end
