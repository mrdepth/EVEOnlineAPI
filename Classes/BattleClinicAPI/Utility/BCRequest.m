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

@interface BCRequest()
@property (nonatomic, readwrite, strong) NSString *text;
@end

@implementation BCRequest

- (NSError*) parseData: (NSData*) aData {
	NSString *xml = [[NSString alloc] initWithData:aData encoding:NSASCIIStringEncoding];
	NSData *convertedData = [xml dataUsingEncoding:NSUTF8StringEncoding];
	
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:convertedData];
	[parser setDelegate:self];
	NSError* error = nil;
	
	self.text = [NSMutableString string];
	if (![parser parse]) {
		error = [parser parserError];
	}
	
	if (error.code == 4) {
		NSString *s = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
		error = [NSError errorWithDomain:BattleClinicErrorDomain code:0 userInfo:[NSDictionary dictionaryWithObject:s forKey:NSLocalizedDescriptionKey]];
	}
	return error;
}

#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[(NSMutableString*) self.text setString:@""];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	//text = [text stringByAppendingString:string];
	[(NSMutableString*) self.text appendString:string];
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
	NSString *s = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	[(NSMutableString*) self.text setString:s];
}

@end