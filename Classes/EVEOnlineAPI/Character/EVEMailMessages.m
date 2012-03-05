//
//  EVEMailMessages.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMailMessages.h"


@implementation EVEMailMessagesItem
@synthesize messageID;
@synthesize senderID;
@synthesize sentDate;
@synthesize title;
@synthesize toCorpOrAllianceID;
@synthesize toCharacterIDs;
@synthesize toListID;
@synthesize read;

+ (id) mailMessagesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVEMailMessagesItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.messageID = [[attributeDict valueForKey:@"messageID"] integerValue];
		self.senderID = [[attributeDict valueForKey:@"senderID"] integerValue];
		self.sentDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"sentDate"]];
		self.title = [attributeDict valueForKey:@"title"];
		self.toCorpOrAllianceID = [[attributeDict valueForKey:@"toCorpOrAllianceID"] integerValue];
		
		NSString* toCharacterIDsString = [attributeDict valueForKey:@"toCharacterIDs"];
		self.toCharacterIDs = toCharacterIDsString.length > 1 ? [toCharacterIDsString componentsSeparatedByString:@","] : 0;

		NSString* toListIDsString = [attributeDict valueForKey:@"toListID"];
		self.toListID = toListIDsString.length > 1 ? [toListIDsString componentsSeparatedByString:@","] : nil;
		self.read = [[attributeDict valueForKey:@"read"] boolValue];
	}
	return self;
}

- (void) dealloc {
	[sentDate release];
	[title release];
	[toCharacterIDs release];
	[toListID release];
	[super dealloc];
}

@end


@implementation EVEMailMessages
@synthesize mailMessages;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) mailMessagesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	return [[[EVEMailMessages alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr] autorelease];
}

+ (id) mailMessagesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)object {
	return [[[EVEMailMessages alloc] initWithKeyID:keyID vCode:vCode characterID:characterID target:target action:action object:object] autorelease];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/MailMessages.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID target:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/MailMessages.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, vCode, characterID]]
					   cacheStyle:EVERequestCacheStyleLong
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[mailMessages release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"messages"]) {
		mailMessages = [[NSMutableArray alloc] init];
		return mailMessages;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"messages"]) {
		EVEMailMessagesItem *mailMessagesItem = [EVEMailMessagesItem mailMessagesItemWithXMLAttributes:attributeDict];
		[mailMessages addObject:mailMessagesItem];
		return mailMessages;
	}
	return nil;
}

@end