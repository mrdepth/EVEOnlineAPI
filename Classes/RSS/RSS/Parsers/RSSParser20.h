//
//  RSSParser20.h
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSFeed.h"

@interface RSSParser20 : NSObject<NSXMLParserDelegate>
@property (nonatomic, strong) RSSFeed *feed;

@end