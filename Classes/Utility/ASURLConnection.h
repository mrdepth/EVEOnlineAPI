//
//  ASURLConnection.h
//  ASURLConnection
//
//  Created by Artem Shimanski on 12.06.13.
//  Copyright (c) 2013 Artem Shimanski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASURLConnection : NSURLConnection

+ (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error progressHandler:(void(^)(CGFloat progress)) progressHandler;

@end
