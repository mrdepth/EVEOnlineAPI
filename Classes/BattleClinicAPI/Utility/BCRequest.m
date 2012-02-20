//
//  BCRequest.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BCRequest.h"
#import "BCGlobals.h"
#import "NSData+MD5.h"
#import "EVERequestsCache.h"


@implementation BCRequest(Protected)

- (NSString*) text {
	return text;
}

- (NSError*) parseData: (NSData*) aData {
	NSString *xml = [[NSString alloc] initWithData:aData encoding:NSASCIIStringEncoding];
	//NSLog(@"%@", s);
	NSData *convertedData = [xml dataUsingEncoding:NSUTF8StringEncoding];
	
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:convertedData];
	[parser setDelegate:self];
	error = nil;
	
	text = [NSMutableString string];
	if (![parser parse]) {
		error = [parser parserError];
	}
	
	if (error.code == 4) {
		NSString *s = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
		error = [NSError errorWithDomain:BattleClinicErrorDomain code:0 userInfo:[NSDictionary dictionaryWithObject:s forKey:NSLocalizedDescriptionKey]];
		[s release];
	}
	[parser release];

	[xml release];
	return error;
}

/*- (void) cacheData {
	EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
	NSDate *date = [NSDate dateWithTimeIntervalSinceNow:60*60];
	[cache cacheData:data withHash:hash cachedUntil:date];
}*/

- (void) dealloc {
	[super dealloc];
}


@end

@implementation BCRequest

#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[text setString:@""];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	//text = [text stringByAppendingString:string];
	[text appendString:string];
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
	//text = [[[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding] autorelease];
	NSString *s = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	[text setString:s];
	[s release];
}

@end