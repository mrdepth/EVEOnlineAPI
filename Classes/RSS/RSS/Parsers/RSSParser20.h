//
//  RSSParser20.h
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSFeed.h"

@interface RSSParser20 : NSObject<NSXMLParserDelegate> {
	RSSFeed *feed;
@private
	NSMutableString *text;
	NSMutableArray *stack;
	NSDateFormatter *dateFormatter;
}
@property (nonatomic, retain) RSSFeed *feed;

@end