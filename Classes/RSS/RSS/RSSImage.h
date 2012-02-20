//
//  RSSImage.h
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSSImage : NSObject {
	NSString *title;
    NSURL *link;
    NSURL *url;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSURL *link;
@property (nonatomic, retain) NSURL *url;

@end
