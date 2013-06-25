//
//  EVERefTypes.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVERefTypes.h"


@implementation EVERefTypesItem

+ (id) refTypesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVERefTypesItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.refTypeID = [[attributeDict valueForKey:@"refTypeID"] integerValue];
		self.refTypeName = [attributeDict valueForKey:@"refTypeName"];
	}
	return self;
}

@end


@implementation EVERefTypes

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) refTypesWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVERefTypes alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/RefTypes.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"refTypes"]) {
		self.refTypes = [[NSMutableArray alloc] init];
		return self.refTypes;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"refTypes"]) {
		EVERefTypesItem *refTypesItem = [EVERefTypesItem refTypesItemWithXMLAttributes:attributeDict];
		[object addObject:refTypesItem];
		return refTypesItem;
	}
	return nil;
}
@end