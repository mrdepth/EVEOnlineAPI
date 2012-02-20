//
//  RSSParser.h
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSFeed.h"

@interface RSSParser : NSObject<NSXMLParserDelegate> {
	RSSFeed *feed;
	NSError *error;
@private
	id parser;
}
@property (nonatomic, retain) RSSFeed *feed;
@property (nonatomic, retain) NSError *error;

- (BOOL) parseXMLData:(NSData*) data;
- (BOOL) parseXMLString:(NSString*) string;

@end
