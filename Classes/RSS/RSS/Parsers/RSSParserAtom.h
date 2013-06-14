//
//  RSSParserAtom.h
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSFeed.h"

@interface RSSParserAtom : NSObject<NSXMLParserDelegate>
@property (nonatomic, strong) RSSFeed *feed;

@end
