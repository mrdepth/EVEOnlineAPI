//
//  RSSFeed.h
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSImage.h"
#import "RSSItem.h"

@interface RSSFeed : NSObject {
	NSString *title;
	NSString *description;
	NSString *copyright;
	NSString *language;
	NSString *link;
	NSString *publisher;
	NSDate *updated;
	RSSImage *image;
	NSMutableArray *items;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *copyright;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *publisher;
@property (nonatomic, retain) NSDate *updated;
@property (nonatomic, retain) RSSImage *image;
@property (nonatomic, retain) NSMutableArray *items;

@end
