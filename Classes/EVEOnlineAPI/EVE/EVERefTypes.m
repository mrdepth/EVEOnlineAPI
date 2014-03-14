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
		self.refTypeID = [[attributeDict valueForKey:@"refTypeID"] intValue];
		self.refTypeName = [attributeDict valueForKey:@"refTypeName"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.refTypeID forKey:@"refTypeID"];
	[aCoder encodeObject:self.refTypeName forKey:@"refTypeName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.refTypeID = [aDecoder decodeInt32ForKey:@"refTypeID"];
		self.refTypeName = [aDecoder decodeObjectForKey:@"refTypeName"];
	}
	return self;
}

@end


@implementation EVERefTypes

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) refTypesWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVERefTypes alloc] initWithCachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/RefTypes.xml.aspx", EVEOnlineAPIHost]]
					   cachePolicy:cachePolicy
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

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.refTypes forKey:@"refTypes"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.refTypes = [aDecoder decodeObjectForKey:@"refTypes"];
	}
	return self;
}

@end