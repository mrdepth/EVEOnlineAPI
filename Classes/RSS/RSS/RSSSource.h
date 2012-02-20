//
//  RSSSource.h
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSSSource : NSObject {
	NSString *title;
	NSURL *url;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSURL *url;

@end
