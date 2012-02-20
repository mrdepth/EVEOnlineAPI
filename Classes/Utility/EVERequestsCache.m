//
//  EVERequestsCache.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVERequestsCache.h"
#import "NSURL+MD5.h"

static EVERequestsCache *singleton = nil;

@implementation EVERequestsCache

+ (EVERequestsCache*) sharedRequestsCache {
	@synchronized([UIApplication sharedApplication]) {
		if (!singleton)
			singleton = [[EVERequestsCache alloc] init];
		return singleton;
	}
}

+ (NSString*) cacheDirectory {
	return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"EVEOnlineAPICache"];
}

+ (NSString*) cacheFileName {
	return [[EVERequestsCache cacheDirectory] stringByAppendingPathComponent:@"cache.plist"];
}

- (id) init {
	if (self = [super init]) {
		NSString *dir = [EVERequestsCache cacheDirectory];
		NSFileManager *fileManager = [NSFileManager defaultManager];
		[fileManager createDirectoryAtPath:dir withIntermediateDirectories:NO attributes:nil error:nil];
		cache = [[NSMutableDictionary dictionaryWithContentsOfURL:[NSURL fileURLWithPath:[EVERequestsCache cacheFileName]]] retain];
		if (!cache)
			cache = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (void) dealloc {
	[cache release];
	[super dealloc];
}

- (NSData*) cachedDataWithURL: (NSURL*) url date:(NSDate*) date {
	NSString *hash = [url md5];
	return [self cachedDataWithHash:hash date:date];
}

- (NSData*) cachedDataWithHash:(NSString*) hash date:(NSDate *)date {
	@synchronized(self) {
		NSString *fileName = [NSString stringWithFormat:@"%@.xml", hash];
		NSDate *cachedUntil = [[cache valueForKey:fileName] valueForKey:@"cachedUntil"];
		if (!cachedUntil)
			return nil;
		if (date && [cachedUntil compare:date] == NSOrderedAscending)
			return nil;
		else
			return [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:[[EVERequestsCache cacheDirectory] stringByAppendingPathComponent:fileName]]];
	}
}

- (NSDate*) cacheDateForDataWithURL: (NSURL*) url {
	@synchronized(self) {
		NSString *hash = [url md5];
		NSString *fileName = [NSString stringWithFormat:@"%@.xml", hash];
		return [[cache valueForKey:fileName] valueForKey:@"cacheDate"];
	}
}

- (void) cacheData: (NSData*) data withURL: (NSURL*) url cachedUntil: (NSDate*) cachedUntil {
	NSString *hash = [url md5];
	[self cacheData:data withHash:hash cachedUntil:cachedUntil];
}

- (void) cacheData: (NSData*) data withHash: (NSString*) hash cachedUntil: (NSDate*) cachedUntil {
	@synchronized(self) {
		NSString *fileName = [NSString stringWithFormat:@"%@.xml", hash];
		[cache setValue:[NSDictionary dictionaryWithObjectsAndKeys:[NSDate date], @"cacheDate", cachedUntil, @"cachedUntil", nil]
				 forKey:fileName];
		[data writeToURL:[NSURL fileURLWithPath:[[EVERequestsCache cacheDirectory] stringByAppendingPathComponent:fileName]] atomically:YES];
		[cache writeToURL:[NSURL fileURLWithPath:[EVERequestsCache cacheFileName]] atomically:YES];
	}
}

- (void) clear {
	@synchronized(self) {
		[cache removeAllObjects];
		NSString *path = [EVERequestsCache cacheDirectory];
		NSFileManager *fileManager = [NSFileManager defaultManager];
		NSArray *items = [fileManager contentsOfDirectoryAtPath:path error:nil];
		for (NSString *item in items)
			[fileManager removeItemAtPath: [path stringByAppendingPathComponent:item] error:nil];
	}
}

@end
