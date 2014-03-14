//
//  EVECentralRequest.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 1/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EVECentralRequest.h"

@interface EVECentralRequest()
@property (nonatomic, readwrite, strong) NSString *text;
@end

@implementation EVECentralRequest(Protected)

- (NSError*) parseData: (NSData*) aData {
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:aData];
	[parser setDelegate:self];
	NSError* error = nil;
	
	self.text = [NSMutableString string];
	if (![parser parse]) {
		error = [parser parserError];
	}
	if (error.code == 4) {
		NSString *s = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
		error = [NSError errorWithDomain:EVECentralErrorDomain code:0 userInfo:[NSDictionary dictionaryWithObject:s forKey:NSLocalizedDescriptionKey]];
	}
	self.text = nil;
	return error;
}


@end

@implementation EVECentralRequest

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
	[(NSMutableString*) self.text appendString:string];
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
	NSString *s = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	[(NSMutableString*) self.text setString:s];
}

- (NSString*) validText {
	NSInteger n = [self.text lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
	const char* s = [self.text UTF8String];
	
	NSInteger start;
	NSInteger end;
	
	for (start = 0; start < n; start++) {
		if (s[start] != '\n' && s[start] != ' ' && s[start] != '\t')
			break;
	}
	
	for (end = n - 1; end >= 0; end--) {
		if (s[end] != '\n' && s[end] != ' ' && s[end] != '\t')
			break;
	}
	
	NSString* validText = nil;
	if (start <= end)
		validText = [self.text substringWithRange:NSMakeRange(start, end - start + 1)];
	else
		validText = self.text;
	return validText;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.cacheExpireDate forKey:@"cacheExpireDate"];
	[aCoder encodeObject:self.cacheDate forKey:@"cacheDate"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.cacheExpireDate = [aDecoder decodeObjectForKey:@"cacheExpireDate"];
		self.cacheDate = [aDecoder decodeObjectForKey:@"cacheDate"];
	}
	return self;
}

@end
