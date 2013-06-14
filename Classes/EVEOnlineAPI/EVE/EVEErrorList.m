//
//  EVEErrorList.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVEErrorList.h"


@implementation EVEErrorListItem

+ (id) errorListItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEErrorListItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.errorCode = [[attributeDict valueForKey:@"errorCode"] integerValue];
		self.errorText = [attributeDict valueForKey:@"errorText"];
	}
	return self;
}

@end


@implementation EVEErrorList

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) errorListWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVEErrorList alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ErrorList.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"errors"]) {
		self.errors = [[NSMutableArray alloc] init];
		return self.errors;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"errors"]) {
		EVEErrorListItem *errorListItem = [EVEErrorListItem errorListItemWithXMLAttributes:attributeDict];
		[object addObject:errorListItem];
		return errorListItem;
	}
	return nil;
}
@end