//
//  BCEveLoadoutsTags.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BCEveLoadoutsTags.h"
#import "BCGlobals.h"
#import "EVERequestsCache.h"


@implementation BCEveLoadoutsTags
@synthesize tags;

+ (id) eveLoadoutsTagsWithAPIKey:(NSString*) apiKey target:(id)target action:(SEL)action object:(id)object {
	return [[[BCEveLoadoutsTags alloc] initWithAPIKey:apiKey target:target action:action object:object] autorelease];
}

+ (id) eveLoadoutsTagsWithAPIKey:(NSString*) apiKey error:(NSError **)errorPtr {
	return [[[BCEveLoadoutsTags alloc] initWithAPIKey:apiKey error:errorPtr] autorelease];
}

- (id) initWithAPIKey:(NSString*) apiKey target:(id)target action:(SEL)action object:(id)object {
	NSString *s = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><eveLoadoutsGetTags xmlns=\"urn:api\"><applicationKey>%@</applicationKey></eveLoadoutsGetTags></soap:Body></soap:Envelope>",
				   apiKey];
	NSData *bodyData = [s dataUsingEncoding:NSUTF8StringEncoding];
	if (self = [super initWithURL:[NSURL URLWithString:BattleClinicAPIHost]
						 bodyData:bodyData
					  contentType:@"text/xml"
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action
						   object:object]) {
	}
	return self;
}

- (id) initWithAPIKey:(NSString*) apiKey error:(NSError **)errorPtr {
	NSString *s = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><eveLoadoutsGetTags xmlns=\"urn:api\"><applicationKey>%@</applicationKey></eveLoadoutsGetTags></soap:Body></soap:Envelope>",
				   apiKey];
	NSData *bodyData = [s dataUsingEncoding:NSUTF8StringEncoding];
	if (self = [super initWithURL:[NSURL URLWithString:BattleClinicAPIHost]
						 bodyData:bodyData
					  contentType:@"text/xml"
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (void) dealloc {
	[tags release];
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
	
	if ([elementName isEqualToString:@"tags"])
		self.tags = [NSMutableArray array];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	
	if ([elementName isEqualToString:@"tag"])
		[tags addObject:[[text copy] autorelease]];
}

@end