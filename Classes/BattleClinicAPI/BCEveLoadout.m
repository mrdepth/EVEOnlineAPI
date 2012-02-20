//
//  BCEveLoadout.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BCEveLoadout.h"
#import "BCGlobals.h"
#import "EVERequestsCache.h"


@implementation BCEveLoadout
@synthesize loadoutID;
@synthesize typeID;
@synthesize thumbsUp;
@synthesize thumbsDown;
@synthesize topic;
@synthesize title;
@synthesize description;
@synthesize fitting;

+ (id) eveLoadoutsWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)loadoutID target:(id)target action:(SEL)action object:(id)object {
	return [[[BCEveLoadout alloc] initWithAPIKey:apiKey loadoutID:loadoutID target:target action:action object:object] autorelease];
}

+ (id) eveLoadoutsWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)loadoutID error:(NSError **)errorPtr {
	return [[[BCEveLoadout alloc] initWithAPIKey:apiKey loadoutID:loadoutID error:errorPtr] autorelease];
}

- (id) initWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)aLoadoutID target:(id)target action:(SEL)action object:(id)object {
	NSString *s = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><eveLoadoutGet xmlns=\"urn:api\"><applicationKey>%@</applicationKey><id>%d</id></eveLoadoutGet></soap:Body></soap:Envelope>",
				   apiKey,
				   aLoadoutID];
	NSData *bodyData = [s dataUsingEncoding:NSUTF8StringEncoding];
	if (self = [super initWithURL:[NSURL URLWithString:BattleClinicAPIHost]
						 bodyData:bodyData
					  contentType:@"text/xml"
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action
						   object:object]) {
		loadoutID = aLoadoutID;
	}
	return self;
}

- (id) initWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)aLoadoutID error:(NSError **)errorPtr {
	NSString *s = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><eveLoadoutGet xmlns=\"urn:api\"><applicationKey>%@</applicationKey><id>%d</id></eveLoadoutGet></soap:Body></soap:Envelope>",
				   apiKey,
				   aLoadoutID];
	NSData *bodyData = [s dataUsingEncoding:NSUTF8StringEncoding];
	if (self = [super initWithURL:[NSURL URLWithString:BattleClinicAPIHost]
						 bodyData:bodyData
					  contentType:@"text/xml"
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
		loadoutID = aLoadoutID;
	}
	return self;
}

- (void) dealloc {
	[title release];
	[description release];
	[fitting release];
	[super dealloc];
}

- (void) cacheData {
	EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
	NSDate *date = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
	[cache cacheData:data withHash:hash cachedUntil:date];
}

#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	
	if ([elementName isEqualToString:@"typeID"])
		self.typeID = [text integerValue];
	else if ([elementName isEqualToString:@"thumbsUp"])
		self.thumbsUp = [text integerValue];
	else if ([elementName isEqualToString:@"thumbsDown"])
		self.thumbsDown = [text integerValue];
	else if ([elementName isEqualToString:@"topic"])
		self.topic = [text integerValue];
	else if ([elementName isEqualToString:@"title"])
		self.title = text;
	else if ([elementName isEqualToString:@"description"])
		self.description = text;
	else if ([elementName isEqualToString:@"fitting"])
		self.fitting = text;
}

@end