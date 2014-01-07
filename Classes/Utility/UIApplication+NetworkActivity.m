//
//  UIApplication+NetworkActivity.m
//  Neocom
//
//  Created by Admin on 03.01.14.
//  Copyright (c) 2014 Artem Shimanski. All rights reserved.
//

#import "UIApplication+NetworkActivity.h"
#import <libkern/OSAtomic.h>

static int32_t activitiesCount = 0;

@implementation UIApplication (NetworkActivity)

- (void) beginNetworkActivity {
    OSAtomicIncrement32Barrier(&activitiesCount);
    [self performSelectorOnMainThread:@selector(update) withObject:nil waitUntilDone:NO];
}

- (void) endNetworkActivity {
    OSAtomicDecrement32Barrier(&activitiesCount);
    [self performSelectorOnMainThread:@selector(update) withObject:nil waitUntilDone:NO];
}
    
- (void) update {
    self.networkActivityIndicatorVisible = activitiesCount > 0;
}

@end
