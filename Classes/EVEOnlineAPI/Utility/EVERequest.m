//
//  EVERequest.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVERequest.h"
#import "EVERequestsCache.h"

@implementation NSDateFormatter(EVERequest)

+ (NSDateFormatter*) eveDateFormatter {
	NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
	NSDateFormatter *dateFormatter = [threadDictionary valueForKey:@"eveDateFormatter"];
	
	if (!dateFormatter) {
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
		[dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"]];
		[threadDictionary setValue:dateFormatter forKey:@"eveDateFormatter"];
		[dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
		[dateFormatter autorelease];
	}
	return dateFormatter;
}

@end

@implementation EVERequest(Protected)

- (NSString*) text {
	return text;
}

- (NSError*) parseData: (NSData*) aData {
//	NSString *s = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding];
//	NSLog(@"%@", s);
//	[s release];*
	
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:aData];
	[parser setDelegate:self];
	error = nil;
	
	rowsets = [[NSMutableArray alloc] init];
	rowsetObjects = [[NSMutableArray alloc] init];
	rows = [[NSMutableArray alloc] init];
	text = [[NSMutableString alloc] init];
	if (![parser parse]) {
		error = [parser parserError];
	}
	[rowsets release];
	[rowsetObjects release];
	[rows release];
	[text release];
	[parser release];
	return error;
}

- (void) cacheData {
	EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
	NSTimeInterval timeInterval = [self.currentTime timeIntervalSinceNow];
	NSTimeInterval dateInterval = [self.cachedUntil timeIntervalSince1970];
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:dateInterval - timeInterval];
	[cache cacheData:data withURL:requestUrl cachedUntil:date];
}

- (NSString*) currentRowset {
	if (rowsets.count > 0)
		return [rowsets lastObject];
	else
		return nil;
}

- (id) currentRow {
	if (rows.count > 0)
		return [rows lastObject];
	else
		return nil;
}

- (id) didStartRowset:(NSString*) rowset {
	return nil;
}

- (void) didEndRowset:(NSString*) rowset rowsetObject:(id) object {
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	return nil;
}

- (void) didEndRow: (id) row rowset: (NSString*) rowset {
}

@end



@implementation EVERequest
@synthesize currentTime;
@synthesize cachedUntil;
@synthesize apiVersion;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

- (void) dealloc {
	[currentTime release];
	[cachedUntil release];
	[apiVersion release];
	[super dealloc];
}

- (NSDate*) currentServerTime {
	return [NSDate dateWithTimeIntervalSinceNow:-[self.cacheDate timeIntervalSinceDate:self.currentTime]];
}

- (NSDate*) serverTimeWithLocalTime:(NSDate*) localTime {
	if (!localTime)
		return nil;
	return [NSDate dateWithTimeInterval:[self.currentTime timeIntervalSinceDate:self.cacheDate] sinceDate:localTime];
}

- (NSDate*) localTimeWithServerTime:(NSDate*) serverTime {
	return [NSDate dateWithTimeInterval:[self.cacheDate timeIntervalSinceDate:self.currentTime] sinceDate:serverTime];
}


#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[text setString:@""];
	if ([elementName isEqualToString:@"eveapi"]) {
		self.apiVersion = [attributeDict valueForKey:@"version"];
	}
	else if ([elementName isEqualToString:@"error"]) {
		errorCode = [[attributeDict valueForKey:@"code"] integerValue];
	}
	else if ([elementName isEqualToString:@"rowset"]) {
		NSString *rowset = [attributeDict valueForKey:@"name"];
		[rowsets addObject:rowset];
		id rowsetObject = [self didStartRowset:rowset];
		if (!rowsetObject)
			rowsetObject = [NSNull null];
		[rowsetObjects addObject:rowsetObject];
	}
	else if ([elementName isEqualToString:@"row"]) {
		id rowsetObject = [rowsetObjects lastObject];
		id row = [self didStartRowWithAttributes:attributeDict
										  rowset:[rowsets lastObject]
									rowsetObject:((NSNull*) rowsetObject == [NSNull null] ? nil : rowsetObject)];
		if (!row)
			row = [NSNull null];
		[rows addObject:row];
	}
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	if ([elementName isEqualToString:@"currentTime"]) {
		self.currentTime = [[NSDateFormatter eveDateFormatter] dateFromString:text];
	}
	else if ([elementName isEqualToString:@"cachedUntil"])
		self.cachedUntil = [[NSDateFormatter eveDateFormatter] dateFromString:text];
	else if ([elementName isEqualToString:@"error"]) {
		error = [NSError errorWithDomain:EVEOnlineErrorDomain code:errorCode userInfo:[NSDictionary dictionaryWithObject:[[text copy] autorelease] forKey:NSLocalizedDescriptionKey]];
	}
	else if ([elementName isEqualToString:@"rowset"]) {
		id rowsetObject = [rowsetObjects lastObject];
		[self didEndRowset:[rowsets lastObject]
			  rowsetObject:((NSNull*) rowsetObject == [NSNull null] ? nil : rowsetObject)];
		
		[rowsets removeLastObject];
		[rowsetObjects removeLastObject];
	}
	else if ([elementName isEqualToString:@"row"]) {
		id row = [rows lastObject];
		[self didEndRow: ((NSNull*) row == [NSNull null] ? nil : row)
				 rowset: [rowsets lastObject]];
		[rows removeLastObject];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	[text appendString:string];
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
	NSString *s = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	[text setString:s];
	[s release];
}

@end