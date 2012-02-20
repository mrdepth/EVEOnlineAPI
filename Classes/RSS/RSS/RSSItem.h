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

@interface RSSItem : NSObject {
	NSString *title;
    NSURL *link;
    NSString *description;
    NSString *author;
    NSString *category;
    NSString *guid;
	NSDate *updated;
	RSSSource *source;
	RSSEnclosure *enclosure;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSURL *link;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *guid;
@property (nonatomic, retain) NSDate *updated;
@property (nonatomic, retain) RSSSource *source;
@property (nonatomic, retain) RSSEnclosure *enclosure;

@end
