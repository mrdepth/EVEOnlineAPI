//
//  BCEveLoadoutsList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BCEveLoadoutsList.h"
#import "BCGlobals.h"
#import "EVERequestsCache.h"

@implementation BCEveLoadoutsListItem
@synthesize typeID;
@synthesize thumbsUp;
@synthesize thumbsDown;
@synthesize topicID;
@synthesize subject;
@synthesize posterTime;
@synthesize modifiedTime;
@synthesize loadoutID;
@synthesize raceID;
@synthesize thumbsTotal;
@synthesize author;
@synthesize memberID;

- (void) dealloc {
	[subject release];
	[posterTime release];
	[modifiedTime release];
	[author release];
	[super dealloc];
}

@end

@implementation BCEveLoadoutsList
@synthesize loadouts;

+ (id) eveLoadoutsListWithAPIKey:(NSString*) apiKey raceID:(NSInteger) raceID typeID:(NSInteger) typeID classID:(NSInteger) classID userID:(NSInteger) userID tags:(NSArray*) tags target:(id)target action:(SEL)action object:(id)object {
	return [[[BCEveLoadoutsList alloc] initWithAPIKey:apiKey raceID:raceID typeID:typeID classID:classID userID:userID tags:tags target:target action:action object:object] autorelease];
}

+ (id) eveLoadoutsListWithAPIKey:(NSString*) apiKey raceID:(NSInteger) raceID typeID:(NSInteger) typeID classID:(NSInteger) classID userID:(NSInteger) userID tags:(NSArray*) tags error:(NSError **)errorPtr {
	return [[[BCEveLoadoutsList alloc] initWithAPIKey:apiKey raceID:raceID typeID:typeID classID:classID userID:userID tags:tags error:errorPtr] autorelease];
}

- (id) initWithAPIKey:(NSString*) apiKey raceID:(NSInteger) raceID typeID:(NSInteger) typeID classID:(NSInteger) classID userID:(NSInteger) userID tags:(NSArray*) tags target:(id)target action:(SEL)action object:(id)object {
	NSMutableString *sTags = [NSMutableString string];
	int i = 0;
	for (NSString *tag in [tags sortedArrayUsingSelector:@selector(compare:)]) {
		[sTags appendFormat:@"<item xsi:type=\"xsd:string\">%@</item>", tag];
		i++;
	}
	
	NSString *s = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ns1=\"urn:api\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><SOAP-ENV:Body><ns1:eveLoadoutsList><applicationKey xsi:type=\"xsd:string\">%@</applicationKey><race xsi:type=\"xsd:unsignedInt\">%d</race><type xsi:type=\"xsd:unsignedInt\">%d</type><class xsi:type=\"xsd:unsignedInt\">%d</class><user xsi:type=\"xsd:unsignedInt\">%d</user><tags SOAP-ENC:arrayType=\"xsd:string[%d]\" xsi:type=\"SOAP-ENC:Array\">%@</tags></ns1:eveLoadoutsList></SOAP-ENV:Body></SOAP-ENV:Envelope>",
				   apiKey,
				   raceID,
				   typeID,
				   classID,
				   userID,
				   i,
				   sTags];
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

- (id) initWithAPIKey:(NSString*) apiKey raceID:(NSInteger) raceID typeID:(NSInteger) typeID classID:(NSInteger) classID userID:(NSInteger) userID tags:(NSArray*) tags error:(NSError **)errorPtr {
	NSMutableString *sTags = [NSMutableString string];
	int i = 0;
	for (NSString *tag in [tags sortedArrayUsingSelector:@selector(compare:)]) {
		[sTags appendFormat:@"<item xsi:type=\"xsd:string\">%@</item>", tag];
		i++;
	}
	
	NSString *s = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ns1=\"urn:api\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><SOAP-ENV:Body><ns1:eveLoadoutsList><applicationKey xsi:type=\"xsd:string\">%@</applicationKey><race xsi:type=\"xsd:unsignedInt\">%d</race><type xsi:type=\"xsd:unsignedInt\">%d</type><class xsi:type=\"xsd:unsignedInt\">%d</class><user xsi:type=\"xsd:unsignedInt\">%d</user><tags SOAP-ENC:arrayType=\"xsd:string[%d]\" xsi:type=\"SOAP-ENC:Array\">%@</tags></ns1:eveLoadoutsList></SOAP-ENV:Body></SOAP-ENV:Envelope>",
				   apiKey,
				   raceID,
				   typeID,
				   classID,
				   userID,
				   i,
				   sTags];
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
	[loadouts release];
	[super dealloc];
}

- (void) cacheData {
	EVERequestsCache *cache = [EVERequestsCache sharedRequestsCache];
	NSDate *date = [NSDate dateWithTimeIntervalSinceNow:60*60];
	[cache cacheData:data withHash:hash cachedUntil:date];
}


#pragma mark NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qualifiedName
	 attributes:(NSDictionary *)attributeDict {
	[super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
	
	if ([elementName isEqualToString:@"loadouts"])
		self.loadouts = [NSMutableArray array];
	else if ([elementName isEqualToString:@"item"] && [[attributeDict valueForKey:@"xsi:type"] compare:@"tns:eveLoadoutsList" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
		currentItem = [[[BCEveLoadoutsListItem alloc] init] autorelease];
		[loadouts addObject:currentItem];
	}
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
	[super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
	
	if ([elementName isEqualToString:@"typeID"])
		currentItem.typeID = [self.text integerValue];
	else if ([elementName isEqualToString:@"thumbsUp"])
		currentItem.thumbsUp = [self.text integerValue];
	else if ([elementName isEqualToString:@"thumbsDown"])
		currentItem.thumbsDown = [self.text integerValue];
	else if ([elementName isEqualToString:@"id_topic"])
		currentItem.topicID = [self.text integerValue];
	else if ([elementName isEqualToString:@"subject"])
		currentItem.subject = self.text;
	else if ([elementName isEqualToString:@"poster_time"])
		currentItem.posterTime = [NSDate dateWithTimeIntervalSince1970:[self.text floatValue]];
	else if ([elementName isEqualToString:@"modified_time"])
		currentItem.posterTime = [NSDate dateWithTimeIntervalSince1970:[self.text floatValue]];
	else if ([elementName isEqualToString:@"loadout_ID"])
		currentItem.loadoutID = [self.text integerValue];
	else if ([elementName isEqualToString:@"raceID"])
		currentItem.raceID = [self.text integerValue];
	else if ([elementName isEqualToString:@"thumbsTotal"])
		currentItem.thumbsTotal = [self.text integerValue];
	else if ([elementName isEqualToString:@"author"]) {
		if (!currentItem.author)
			currentItem.author = self.text;
	}
	else if ([elementName isEqualToString:@"id_member"])
		currentItem.memberID = [self.text integerValue];
}

@end