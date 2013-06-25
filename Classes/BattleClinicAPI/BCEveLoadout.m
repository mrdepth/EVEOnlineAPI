//
//  BCEveLoadout.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BCEveLoadout.h"
#import "BCGlobals.h"


@implementation BCEveLoadout

+ (id) eveLoadoutsWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)loadoutID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[BCEveLoadout alloc] initWithAPIKey:apiKey loadoutID:loadoutID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithAPIKey:(NSString*) apiKey loadoutID:(NSInteger)aLoadoutID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	NSString *s = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><eveLoadoutGet xmlns=\"urn:api\"><applicationKey>%@</applicationKey><id>%d</id></eveLoadoutGet></soap:Body></soap:Envelope>",
				   apiKey,
				   aLoadoutID];
	NSData *bodyData = [s dataUsingEncoding:NSUTF8StringEncoding];
	if (self = [super initWithURL:[NSURL URLWithString:BattleClinicAPIHost]
						 bodyData:bodyData
					  contentType:@"text/xml"
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
		self.loadoutID = aLoadoutID;
	}
	return self;
}

- (NSError*) parseData:(NSData *)data {
	NSError* error = [super parseData:data];
	self.cacheExpireDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24];
	return error;
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
		self.typeID = [self.text integerValue];
	else if ([elementName isEqualToString:@"thumbsUp"])
		self.thumbsUp = [self.text integerValue];
	else if ([elementName isEqualToString:@"thumbsDown"])
		self.thumbsDown = [self.text integerValue];
	else if ([elementName isEqualToString:@"topic"])
		self.topic = [self.text integerValue];
	else if ([elementName isEqualToString:@"title"])
		self.title = self.text;
	else if ([elementName isEqualToString:@"description"])
		self.description = self.text;
	else if ([elementName isEqualToString:@"fitting"])
		self.fitting = self.text;
}

@end