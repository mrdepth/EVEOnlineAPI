//
//  EVERequest.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVERequest.h"

@interface EVERequest()
@property (nonatomic, strong) NSError* error;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, strong, readwrite) NSMutableString* text;

@property (nonatomic, strong) NSMutableArray *rowsets;
@property (nonatomic, strong) NSMutableArray *rowsetObjects;
@property (nonatomic, strong) NSMutableArray *rows;

@end

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
	}
	return dateFormatter;
}

@end

@implementation EVERequest

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
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

- (NSError*) parseData: (NSData*) aData {
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:aData];
	[parser setDelegate:self];

#ifdef LOG_REQUESTS
	NSString *dir = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
	NSString* name = [[self.url lastPathComponent] stringByDeletingPathExtension];
	[aData writeToFile:[dir stringByAppendingPathComponent:name] atomically:YES];
#endif
	
	self.rowsets = [[NSMutableArray alloc] init];
	self.rowsetObjects = [[NSMutableArray alloc] init];
	self.rows = [[NSMutableArray alloc] init];
	self.text = [[NSMutableString alloc] init];
	
	NSError* error = nil;
	if (![parser parse])
		error = [parser parserError];
	self.rowsets = nil;
	self.rowsetObjects = nil;
	self.rows = nil;
	self.text = nil;
	
	if (self.error)
		error = self.error;
	
	self.cacheExpireDate = [self localTimeWithServerTime:self.cachedUntil];
	return error;
}

- (NSString*) currentRowset {
	if (self.rowsets.count > 0)
		return [self.rowsets lastObject];
	else
		return nil;
}

- (id) currentRow {
	if (self.rows.count > 0)
		return [self.rows lastObject];
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

#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[(NSMutableString*) self.text setString:@""];
	if ([elementName isEqualToString:@"eveapi"]) {
		self.apiVersion = [attributeDict valueForKey:@"version"];
	}
	else if ([elementName isEqualToString:@"error"]) {
		self.errorCode = [[attributeDict valueForKey:@"code"] integerValue];
	}
	else if ([elementName isEqualToString:@"rowset"]) {
		NSString *rowset = [attributeDict valueForKey:@"name"];
		[self.rowsets addObject:rowset];
		id rowsetObject = [self didStartRowset:rowset];
		if (!rowsetObject)
			rowsetObject = [NSNull null];
		[self.rowsetObjects addObject:rowsetObject];
	}
	else if ([elementName isEqualToString:@"row"]) {
		id rowsetObject = [self.rowsetObjects lastObject];
		id row = [self didStartRowWithAttributes:attributeDict
										  rowset:[self.rowsets lastObject]
									rowsetObject:((NSNull*) rowsetObject == [NSNull null] ? nil : rowsetObject)];
		if (!row)
			row = [NSNull null];
		[self.rows addObject:row];
	}
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	if ([elementName isEqualToString:@"currentTime"]) {
		self.currentTime = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	}
	else if ([elementName isEqualToString:@"cachedUntil"])
		self.cachedUntil = [[NSDateFormatter eveDateFormatter] dateFromString:self.text];
	else if ([elementName isEqualToString:@"error"]) {
		self.error = [NSError errorWithDomain:EVEOnlineErrorDomain code:self.errorCode userInfo:[NSDictionary dictionaryWithObject:[self.text copy] forKey:NSLocalizedDescriptionKey]];
	}
	else if ([elementName isEqualToString:@"rowset"]) {
		id rowsetObject = [self.rowsetObjects lastObject];
		[self didEndRowset:[self.rowsets lastObject]
			  rowsetObject:((NSNull*) rowsetObject == [NSNull null] ? nil : rowsetObject)];
		
		[self.rowsets removeLastObject];
		[self.rowsetObjects removeLastObject];
	}
	else if ([elementName isEqualToString:@"row"]) {
		id row = [self.rows lastObject];
		[self didEndRow: ((NSNull*) row == [NSNull null] ? nil : row)
				 rowset: [self.rowsets lastObject]];
		[self.rows removeLastObject];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	[(NSMutableString*) self.text appendString:string];
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
	NSString *s = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	[(NSMutableString*) self.text setString:s];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.currentTime forKey:@"currentTime"];
	[aCoder encodeObject:self.cachedUntil forKey:@"cachedUntil"];
	[aCoder encodeObject:self.apiVersion forKey:@"apiVersion"];
	[aCoder encodeObject:self.cacheDate forKey:@"cacheDate"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.currentTime = [aDecoder decodeObjectForKey:@"currentTime"];
		self.cachedUntil = [aDecoder decodeObjectForKey:@"cachedUntil"];
		self.apiVersion = [aDecoder decodeObjectForKey:@"apiVersion"];
		self.cacheDate = [aDecoder decodeObjectForKey:@"cacheDate"];
	}
	return self;
}

@end