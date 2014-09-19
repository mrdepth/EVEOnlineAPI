//
//  RSSItem.m
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RSSItem.h"


@implementation RSSItem
@synthesize description = _description;

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.link = [aDecoder decodeObjectForKey:@"link"];
		self.description = [aDecoder decodeObjectForKey:@"description"];
		self.author = [aDecoder decodeObjectForKey:@"author"];
		self.category = [aDecoder decodeObjectForKey:@"category"];
		self.guid = [aDecoder decodeObjectForKey:@"guid"];
		self.updated = [aDecoder decodeObjectForKey:@"updated"];
		self.source = [aDecoder decodeObjectForKey:@"source"];
		self.enclosure = [aDecoder decodeObjectForKey:@"enclosure"];
	}
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	if (self.title)
		[aCoder encodeObject:self.title forKey:@"title"];
	if (self.link)
		[aCoder encodeObject:self.link forKey:@"link"];
	if (self.description)
		[aCoder encodeObject:self.description forKey:@"description"];
	if (self.author)
		[aCoder encodeObject:self.author forKey:@"author"];
	if (self.category)
		[aCoder encodeObject:self.category forKey:@"category"];
	if (self.guid)
		[aCoder encodeObject:self.guid forKey:@"guid"];
	if (self.updated)
		[aCoder encodeObject:self.updated forKey:@"updated"];
	if (self.source)
		[aCoder encodeObject:self.source forKey:@"source"];
	if (self.enclosure)
		[aCoder encodeObject:self.enclosure forKey:@"enclosure"];
}

@end
