//
//  EVEC0rporationFaction.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEC0rporationFaction.h"
#import "EVERequest.h"

@interface EVEC0rporationFaction()
@property (nonatomic, strong) NSMutableString* text;

@end

@implementation EVEC0rporationFactionItem

+ (id) factionItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEC0rporationFactionItem alloc] initWithXMLAttributes:attributeDict];
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

@end

@implementation EVEC0rporationFaction

+ (id) factionWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEC0rporationFaction alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/faction.xml", EVEC0rporationAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

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
		error = [NSError errorWithDomain:EVEC0rporationErrorDomain code:0 userInfo:[NSDictionary dictionaryWithObject:s forKey:NSLocalizedDescriptionKey]];
	}
	
	self.cacheExpireDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 6];
	return error;
}

#pragma mark NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	[self.text appendString:string];
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
	NSString *s = [[NSString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
	[self.text setString:s];
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[self.text setString:@""];
	if ([elementName isEqualToString:@"rowset"])
		self.types = [NSMutableDictionary dictionary];
	else if ([elementName isEqualToString:@"row"]) {
		EVEC0rporationFactionItem* item = [EVEC0rporationFactionItem factionItemWithXMLAttributes:attributeDict];
		NSString* typeID = [NSString stringWithFormat:@"%d", item.typeID];
		[(NSMutableDictionary*) self.types setValue:item forKey:typeID];
	}
}

@end