//
//  RSSFeed.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSFeed.h"


@implementation RSSFeed
@synthesize description = _description;

- (id) init {
	if (self = [super init]) {
		self.items = [NSMutableArray new];
	}
	return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.description = [aDecoder decodeObjectForKey:@"description"];
		self.copyright = [aDecoder decodeObjectForKey:@"copyright"];
		self.language = [aDecoder decodeObjectForKey:@"language"];
		self.link = [aDecoder decodeObjectForKey:@"link"];
		self.publisher = [aDecoder decodeObjectForKey:@"publisher"];
		self.updated = [aDecoder decodeObjectForKey:@"updated"];
		self.image = [aDecoder decodeObjectForKey:@"image"];
		self.items = [[aDecoder decodeObjectForKey:@"items"] mutableCopy];
	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	if (self.title)
		[aCoder encodeObject:self.title forKey:@"title"];
	if (self.description)
		[aCoder encodeObject:self.description forKey:@"description"];
	if (self.copyright)
		[aCoder encodeObject:self.copyright forKey:@"copyright"];
	if (self.language)
		[aCoder encodeObject:self.language forKey:@"language"];
	if (self.link)
		[aCoder encodeObject:self.link forKey:@"link"];
	if (self.publisher)
		[aCoder encodeObject:self.publisher forKey:@"publisher"];
	if (self.updated)
		[aCoder encodeObject:self.updated forKey:@"updated"];
	if (self.image)
		[aCoder encodeObject:self.image forKey:@"image"];
	if (self.items)
		[aCoder encodeObject:self.items forKey:@"items"];
}

@end
