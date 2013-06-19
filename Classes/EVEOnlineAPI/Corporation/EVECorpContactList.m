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

@end


@implementation EVECorpContactList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeFull;
}

+ (id) corpContactListWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECorpContactList alloc] initWithKeyID:keyID vCode:vCode characterID:characterID error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode characterID: (NSInteger) characterID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
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
@end
