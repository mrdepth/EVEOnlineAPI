//
//  RSSImage.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSImage.h"


@implementation RSSImage

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.link = [aDecoder decodeObjectForKey:@"link"];
		self.url = [aDecoder decodeObjectForKey:@"url"];
	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	if (self.title)
		[aCoder encodeObject:self.title forKey:@"title"];
	if (self.link)
		[aCoder encodeObject:self.link forKey:@"link"];
	if (self.url)
		[aCoder encodeObject:self.url forKey:@"url"];
}

@end
