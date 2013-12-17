//
//  EVECorpContactList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECorpContactList.h"


@implementation EVECorpContactListItem

+ (id) corpContactListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECorpContactListItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.contactID = [[attributeDict valueForKey:@"contactID"] integerValue];
		self.contactName = [attributeDict valueForKey:@"contactName"];
		self.standing = [[attributeDict valueForKey:@"standing"] floatValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:self.contactID forKey:@"contactID"];
	[aCoder encodeObject:self.contactName forKey:@"contactName"];
	[aCoder encodeFloat:self.standing forKey:@"standing"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.contactID = [aDecoder decodeIntegerForKey:@"contactID"];
		self.contactName = [aDecoder decodeObjectForKey:@"contactName"];
		self.standing = [aDecoder decodeFloatForKey:@"standing"];
	}
	return self;
}

@end


@implementation EVECorpContactList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) corpContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECorpContactList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/corp/ContactList.xml.aspx?keyID=%d&vCode=%@&characterID=%d", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], characterID]]
					   cacheStyle:EVERequestCacheStyleLong
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}


#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"corporateContactList"]) {
		self.corporateContactList = [[NSMutableArray alloc] init];
		return self.corporateContactList;
	}
	else if ([rowset isEqualToString:@"allianceContactList"]) {
		self.allianceContactList = [[NSMutableArray alloc] init];
		return self.allianceContactList;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"corporateContactList"] || [rowset isEqualToString:@"allianceContactList"]) {
		EVECorpContactListItem *corpContactListItem = [EVECorpContactListItem corpContactListItemWithXMLAttributes:attributeDict];
		[object addObject:corpContactListItem];
		return corpContactListItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.corporateContactList forKey:@"corporateContactList"];
	[aCoder encodeObject:self.allianceContactList forKey:@"allianceContactList"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.corporateContactList = [aDecoder decodeObjectForKey:@"corporateContactList"];
		self.allianceContactList = [aDecoder decodeObjectForKey:@"allianceContactList"];
	}
	return self;
}

@end
