//
//  RSSEnclosure.h
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSSEnclosure : NSObject {
	NSURL *url;
	NSInteger length;
	NSString *type;
}
@property (nonatomic, retain) NSURL *url;
@property (nonatomic) NSInteger length;
@property (nonatomic, copy) NSString *type;

@end
