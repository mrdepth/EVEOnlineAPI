//
//  RSSItem.h
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSSource.h"
#import "RSSEnclosure.h"

@interface RSSItem : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSURL *link;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *guid;
@property (nonatomic, strong) NSDate *updated;
@property (nonatomic, strong) RSSSource *source;
@property (nonatomic, strong) RSSEnclosure *enclosure;

@end
