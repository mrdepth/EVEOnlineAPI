//
//  RSSEnclosure.h
//  RSS
//
//  Created by Mr. Depth on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSSEnclosure : NSObject<NSCoding>
@property (nonatomic, strong) NSURL *url;
@property (nonatomic) int32_t length;
@property (nonatomic, copy) NSString *type;

@end
