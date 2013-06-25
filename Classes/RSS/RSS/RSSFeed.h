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

@interface RSSFeed : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *copyright;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *publisher;
@property (nonatomic, strong) NSDate *updated;
@property (nonatomic, strong) RSSImage *image;
@property (nonatomic, strong) NSMutableArray *items;

@end
