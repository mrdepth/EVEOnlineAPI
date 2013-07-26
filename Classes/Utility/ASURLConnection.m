//
//  ASURLConnection.m
//  ASURLConnection
//
//  Created by Artem Shimanski on 12.06.13.
//  Copyright (c) 2013 Artem Shimanski. All rights reserved.
//

#import "ASURLConnection.h"

@interface ASURLConnection()<NSURLConnectionDataDelegate>
@property (nonatomic, copy) void (^progressHandler)(CGFloat progress);
@property (nonatomic, strong) NSHTTPURLResponse* response;
@property (nonatomic, strong) NSError* error;
@property (nonatomic, assign) BOOL finished;
@property (nonatomic, strong) NSMutableData* data;
@property (nonatomic, assign) NSInteger contentLength;
@end

@interface ASURLConnectionDelegate: NSObject<NSURLConnectionDataDelegate>

@end

@implementation ASURLConnection

+ (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error progressHandler:(void(^)(CGFloat progress)) progressHandler {
	ASURLConnectionDelegate* delegate = [[ASURLConnectionDelegate alloc] init];
	ASURLConnection* connection = [[ASURLConnection alloc] initWithRequest:request delegate:delegate startImmediately:NO];

	NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
	NSString* mode = NSDefaultRunLoopMode;
	connection.progressHandler = progressHandler;
	[connection scheduleInRunLoop:runLoop forMode:mode];
	[connection start];
	
	while (!connection.finished && [runLoop runMode:mode beforeDate:[NSDate distantFuture]]);
	
	if (response)
		*response = connection.response;
	if (error)
		*error = connection.error;
	return !connection.error ? connection.data : nil;
}

@end

@implementation ASURLConnectionDelegate

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(ASURLConnection *)connection didFailWithError:(NSError *)error {
	connection.error = error;
	connection.finished = YES;
}

- (BOOL)connection:(ASURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
	return YES;
}


- (void)connection:(ASURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	NSURLProtectionSpace *protectionSpace = [challenge protectionSpace];
	NSURLCredential *credential = [NSURLCredential credentialForTrust:[protectionSpace serverTrust]];
	[[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
}

- (void)connection:(ASURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response {
	connection.contentLength = [response expectedContentLength];
	if (connection.contentLength > 0)
		connection.data = [NSMutableData dataWithCapacity:connection.contentLength];
	else
		connection.data = [NSMutableData data];
	connection.response = response;
	if (response.statusCode >= 400)
		connection.error = [NSError errorWithDomain:@"HTTP"
											   code:response.statusCode
										   userInfo:@{NSLocalizedDescriptionKey:[NSHTTPURLResponse localizedStringForStatusCode:response.statusCode]}];
}

- (void)connection:(ASURLConnection *)connection didReceiveData:(NSData *)data {
	[connection.data  appendBytes:[data bytes] length:data.length];
	if (connection.progressHandler && connection.contentLength > 0)
		connection.progressHandler((float) connection.data.length / (float) connection.contentLength);
}

- (void)connectionDidFinishLoading:(ASURLConnection *)connection {
	connection.finished = YES;
}

@end
