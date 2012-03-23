//
//  EVEC0rporationFaction.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEC0rporationFaction.h"
#import "EVERequest.h"
#import "EVERequestsCache.h"

@implementation EVEC0rporationFactionItem
@synthesize typeID;
@synthesize avg;
@synthesize median;
@synthesize lo;
@synthesize hi;
@synthesize latest;
@synthesize lastupdate;

+ (id) factionItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEC0rporationFactionItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.avg = [[attributeDict valueForKey:@"avg"] floatValue];
		self.median = [[attributeDict valueForKey:@"median"] floatValue];
		self.lo = [[attributeDict valueForKey:@"lo"] floatValue];
		self.hi = [[attributeDict valueForKey:@"hi"] floatValue];
		self.latest = [[attributeDict valueForKey:@"latest"] floatValue];
		self.lastupdate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"lastupdate"]];
	}
	return self;
}

- (void) dealloc {
	[lastupdate release];
	[super dealloc];
}

@end

@implementation EVEC0rporationFaction(Protected)

- (NSError*) parseData: (NSData*) aData {

	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:aData];
	[parser setDelegate:self];
	error = nil;
	
	text = [NSMutableString string];
	if (![parser parse]) {
		error = [parser parserError];
	}
	if (error.code == 4) {
		NSString *s = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
		error = [NSError errorWithDomain:EVEC0rporationErrorDomain code:0 userInfo:[NSDictionary dictionaryWithObject:s forKey:NSLocalizedDescriptionKey]];
		[s release];
	}
	[parser release];
	return error;
}

- (void) cacheData {
	EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
	NSDate *date = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 6];
	if (hash)
		[cache cacheData:data withHash:hash cachedUntil:date];
	else
		[cache cacheData:data withURL:requestUrl cachedUntil:date];
}


@end

@implementation EVEC0rporationFaction
@synthesize types;

+ (id) factionWithError:(NSError **)errorPtr {
	return [[[EVEC0rporationFaction alloc] initWithError:errorPtr] autorelease];
}

+ (id) factionWithTarget:(id)target action:(SEL)action object:(id)object {
	return [[[EVEC0rporationFaction alloc] initWithTarget:target action:action object:object] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/faction.xml",
														EVEC0rporationAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/faction.xml",
														EVEC0rporationAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}


- (void) dealloc {
	[types release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	[text appendString:string];
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
	NSString *s = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	[text setString:s];
	[s release];
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[text setString:@""];
	if ([elementName isEqualToString:@"rowset"])
		self.types = [NSMutableDictionary dictionary];
	else if ([elementName isEqualToString:@"row"]) {
		EVEC0rporationFactionItem* item = [EVEC0rporationFactionItem factionItemWithXMLAttributes:attributeDict];
		NSString* typeID = [NSString stringWithFormat:@"%d", item.typeID];
		[types setValue:item forKey:typeID];
	}
}

@end