//
//  EVECachedURLRequest.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECachedURLRequest.h"
#import "EVERequestsCache.h"
#import "NSData+MD5.h"

#define DEFAULT_CACHE_TIME 60*60
@implementation EVECachedURLRequest(Protected)

- (NSError*) parseData: (NSData*) data {
	return nil;
}

- (void) didCompleteWithError: (NSError*) aError {
	EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
	cacheDate = [[cache cacheDateForDataWithURL:requestUrl] retain];
	if (delegate)
		method(delegate, selector, self, targetObject, aError);
	[targetObject release];
	[delegate release];
	[scheduleThread release];
	scheduleThread = nil;
	delegate = nil;
	isFinishedLoading = YES;
	error = [aError retain];
}

- (NSURL*) requestUrl {
	return requestUrl;
}

- (void) setRequestUrl: (NSURL*) value {
	[value retain];
	[requestUrl release];
	requestUrl = value;
}

- (void) cacheData {
	EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
	NSDate *date = [NSDate dateWithTimeIntervalSinceNow:DEFAULT_CACHE_TIME];
	if (hash)
		[cache cacheData:data withHash:hash cachedUntil:date];
	else
		[cache cacheData:data withURL:requestUrl cachedUntil:date];
}

- (void) backgroundProcessResults {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSError *parserError = [self parseData:data];
	//[self performSelectorOnMainThread:@selector(didCompleteWithError:) withObject:parserError waitUntilDone:YES];
	[self performSelector:@selector(didCompleteWithError:) onThread:scheduleThread withObject:parserError waitUntilDone:YES];
	[data release];
	data = nil;
	[pool release];
}

@end



@implementation EVECachedURLRequest
@synthesize isCached;
@synthesize cacheDate;

- (id) initWithURL: (NSURL*) aUrl cacheStyle:(EVERequestCacheStyle) aCacheStyle error:(NSError **)errorPtr {
	if (self = [super init]) {
		//NSLog(@"%@", aUrl);
		scheduleThread = [[NSThread currentThread] retain];
		self.requestUrl = aUrl;
		cacheStyle = aCacheStyle;
		EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
		
		data = [cache cachedDataWithURL:requestUrl date:[NSDate date]];
		connection = nil;
		if (!data) {
			isCached = NO;
			data = [[NSMutableData data] retain];
			[self retain];
			NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:requestUrl];
			[request setTimeoutInterval:15];
			//connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:requestUrl] delegate:self];
			connection = [NSURLConnection connectionWithRequest:request delegate:self];
			while (!isFinishedLoading && [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
			if (error) {
				if (errorPtr)
					*errorPtr = error;
			}
		}
		else {
			[scheduleThread release];
			scheduleThread = nil;
			isCached = YES;
			NSError *parserError = [self parseData:data];
			if (parserError || error) {
				if (errorPtr)
					*errorPtr = parserError;
			}
			cacheDate = [[cache cacheDateForDataWithURL:requestUrl] retain];
		}
		
/*		self.requestUrl = aUrl;
		cacheStyle = aCacheStyle;
		EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
		
		data = [[cache cachedDataWithURL:requestUrl date:[NSDate date]] retain];
		connection = nil;
		if (!data) {
			data = [[NSData dataWithContentsOfURL:requestUrl] retain];
			if (data)
				isCached = NO;
			else if (cacheStyle > EVERequestCacheStyleShort) {
				data = [[cache cachedDataWithURL:requestUrl date:nil] retain];
				isCached = YES;
			}
		}
		else
			isCached = YES;
		NSError *parserError = [self parseData:data];
		if (parserError) {
			[data release];
			if (errorPtr)
				*errorPtr = parserError;
			[self release];
			return nil;
		}
		
		if (!isCached)
			[self cacheData];
		[data release];
		data = nil;*/
	}
	return self;
}

- (id) initWithURL: (NSURL*) aUrl bodyData:(NSData*) bodyData contentType:(NSString*) contentType cacheStyle:(EVERequestCacheStyle) aCacheStyle error:(NSError **)errorPtr {
	if (self = [super init]) {
		//NSLog(@"%@", aUrl);
		scheduleThread = [[NSThread currentThread] retain];
		self.requestUrl = aUrl;
		cacheStyle = aCacheStyle;
		EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
		
		hash = [[bodyData md5] retain];
		data = [cache cachedDataWithHash:hash date:[NSDate date]];

		connection = nil;
		if (!data) {
			isCached = NO;
			data = [[NSMutableData data] retain];
			[self retain];
			NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
			[request setHTTPMethod:@"POST"];
			[request setHTTPBody:bodyData];
			if (contentType)
				[request setValue:contentType forHTTPHeaderField:@"Content-Type"];
				//[request setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
			connection = [NSURLConnection connectionWithRequest:request delegate:self];
			while (!isFinishedLoading && [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
			if (errorPtr)
				*errorPtr = error;
		}
		else {
			isCached = YES;
			[scheduleThread release];
			scheduleThread = nil;
			NSError *parserError = [self parseData:data];
			if (parserError) {
				if (errorPtr)
					*errorPtr = parserError;
				[self release];
				return nil;
			}
			cacheDate = [[cache cacheDateForDataWithURL:requestUrl] retain];
		}
	}
	return self;
}

- (id) initWithURL: (NSURL*) aUrl cacheStyle:(EVERequestCacheStyle) aCacheStyle target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super init]) {
		scheduleThread = [[NSThread currentThread] retain];
		self.requestUrl = aUrl;
		cacheStyle = aCacheStyle;
		targetObject = [aObject retain];
		EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
		delegate = target;
		[delegate retain];
		method = [delegate methodForSelector:action];
		
		data = [[cache cachedDataWithURL:requestUrl date:[NSDate date]] retain];
		if (!data) {
			isCached = NO;
			data = [[NSMutableData data] retain];
			[self retain];
			connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:requestUrl] delegate:self];
		}
		else {
			isCached = YES;
			[self performSelectorInBackground:@selector(backgroundProcessResults) withObject:nil];
		}
	}
	return self;
}

- (id) initWithURL: (NSURL*) aUrl bodyData:(NSData*) bodyData contentType:(NSString*) contentType cacheStyle:(EVERequestCacheStyle) aCacheStyle target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super init]) {
		scheduleThread = [[NSThread currentThread] retain];
		self.requestUrl = aUrl;
		cacheStyle = aCacheStyle;
		targetObject = [aObject retain];
		EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
		delegate = target;
		[delegate retain];
		method = [delegate methodForSelector:action];
		
		//data = [[cache cachedDataWithURL:requestUrl date:[NSDate date]] retain];
		hash = [[bodyData md5] retain];
		data = [[cache cachedDataWithHash:hash date:[NSDate date]] retain];
		if (!data) {
			isCached = NO;
			data = [[NSMutableData data] retain];
			[self retain];
			NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
			[request setHTTPMethod:@"POST"];
			[request setHTTPBody:bodyData];
			if (contentType)
				[request setValue:contentType forHTTPHeaderField:@"Content-Type"];
			//[request setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
			connection = [NSURLConnection connectionWithRequest:request delegate:self];
		}
		else {
			isCached = YES;
			[self performSelectorInBackground:@selector(backgroundProcessResults) withObject:nil];
		}
	}
	return self;
}

- (void) dealloc {
	[hash release];
	if (connection)
		[connection cancel];
	[requestUrl release];
	[delegate release];
	[cacheDate release];
	delegate = nil;
	[error release];
	[scheduleThread release];
	[super dealloc];
}

#pragma mark NSURLConnectionDelegate

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
	return YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	NSURLProtectionSpace *protectionSpace = [challenge protectionSpace];
	NSURLCredential *credential = [NSURLCredential credentialForTrust:[protectionSpace serverTrust]];
	[[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
}

- (void)connection:(NSURLConnection *)aConnection didReceiveData:(NSData *)aData {
	[(NSMutableData*) data appendData:aData];
}

- (void)connection:(NSURLConnection *)aConnection didFailWithError:(NSError *)aError {
	connection = nil;
	[data release];
	if ([[aError domain] isEqualToString:@"NSURLErrorDomain"] && cacheStyle > EVERequestCacheStyleShort) {
		EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
		data = [cache cachedDataWithURL:requestUrl date:nil];
		if (data) {
			NSError *parserError = [self parseData:data];
			//[self performSelectorOnMainThread:@selector(didCompleteWithError:) withObject:parserError waitUntilDone:YES];
			[self performSelector:@selector(didCompleteWithError:) onThread:scheduleThread withObject:parserError waitUntilDone:YES];
		}
		else
			//[self performSelectorOnMainThread:@selector(didCompleteWithError:) withObject:aError waitUntilDone:YES];
			[self performSelector:@selector(didCompleteWithError:) onThread:scheduleThread withObject:aError waitUntilDone:YES];
	}
	else
		//[self performSelectorOnMainThread:@selector(didCompleteWithError:) withObject:aError waitUntilDone:YES];
		[self performSelector:@selector(didCompleteWithError:) onThread:scheduleThread withObject:aError waitUntilDone:YES];
	[self autorelease];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConnection {
	connection = nil;
	NSError *parserError = [self parseData:data];
	if (!parserError)
		[self cacheData];
	[data release];
	//[self performSelectorOnMainThread:@selector(didCompleteWithError:) withObject:parserError waitUntilDone:YES];
	[self performSelector:@selector(didCompleteWithError:) onThread:scheduleThread withObject:parserError waitUntilDone:YES];
	[self autorelease];
}


@end