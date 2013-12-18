//
//  EVEMailMessages.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEMailMessages.h"


@implementation EVEMailMessagesItem

+ (id) mailMessagesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEMailMessagesItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.messageID = [[attributeDict valueForKey:@"messageID"] integerValue];
		self.senderID = [[attributeDict valueForKey:@"senderID"] integerValue];
		self.sentDate = [[NSDateFormatter eveDateFormatter] dateFromString:[attributeDict valueForKey:@"sentDate"]];
		self.title = [attributeDict valueForKey:@"title"];
		self.toCorpOrAllianceID = [[attributeDict valueForKey:@"toCorpOrAllianceID"] integerValue];
		
		NSString* toCharacterIDsString = [attributeDict valueForKey:@"toCharacterIDs"];
		self.toCharacterIDs = toCharacterIDsString.length > 1 ? [toCharacterIDsString componentsSeparatedByString:@","] : nil;

		NSString* toListIDsString = [attributeDict valueForKey:@"toListID"];
		self.toListID = toListIDsString.length > 1 ? [toListIDsString componentsSeparatedByString:@","] : nil;
		self.read = [[attributeDict valueForKey:@"read"] boolValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.messageID forKey:@"messageID"];
	[aCoder encodeInteger:self.senderID forKey:@"senderID"];
	[aCoder encodeObject:self.sentDate forKey:@"sentDate"];
	[aCoder encodeObject:self.title forKey:@"title"];
	[aCoder encodeInteger:self.toCorpOrAllianceID forKey:@"toCorpOrAllianceID"];
	[aCoder encodeObject:self.toCharacterIDs forKey:@"toCharacterIDs"];
	[aCoder encodeObject:self.toListID forKey:@"toListID"];
	[aCoder encodeBool:self.read forKey:@"read"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.messageID = [aDecoder decodeIntegerForKey:@"messageID"];
		self.senderID = [aDecoder decodeIntegerForKey:@"senderID"];
		self.sentDate = [aDecoder decodeObjectForKey:@"sentDate"];
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.toCorpOrAllianceID = [aDecoder decodeIntegerForKey:@"toCorpOrAllianceID"];
		self.toCharacterIDs = [aDecoder decodeObjectForKey:@"toCharacterIDs"];
		self.toListID = [aDecoder decodeObjectForKey:@"toListID"];
		self.read = [aDecoder decodeBoolForKey:@"read"];
	}
	return self;
}

@end


@implementation EVEMailMessages

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) mailMessagesWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEMailMessages alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/char/MailMessages.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"messages"]) {
		self.mailMessages = [[NSMutableArray alloc] init];
		return self.mailMessages;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"messages"]) {
		EVEMailMessagesItem *mailMessagesItem = [EVEMailMessagesItem mailMessagesItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.mailMessages addObject:mailMessagesItem];
		return mailMessagesItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.mailMessages forKey:@"mailMessages"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.mailMessages = [aDecoder decodeObjectForKey:@"mailMessages"];
	}
	return self;
}

@end