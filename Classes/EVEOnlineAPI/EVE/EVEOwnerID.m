//
//  EVEOwnerID.m
//  Neocom
//
//  Created by Артем Шиманский on 28.03.14.
//  Copyright (c) 2014 Artem Shimanski. All rights reserved.
//

#import "EVEOwnerID.h"

@implementation EVEOwnerIDItem

+ (id) ownerIDItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVEOwnerIDItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.ownerID = [[attributeDict valueForKey:@"ownerID"] intValue];
		self.ownerName = [attributeDict valueForKey:@"ownerName"];
		self.ownerGroupID = [[attributeDict valueForKey:@"ownerGroupID"] intValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.ownerID forKey:@"ownerID"];
	[aCoder encodeObject:self.ownerName forKey:@"ownerName"];
	[aCoder encodeInt32:self.ownerGroupID forKey:@"ownerGroupID"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.ownerID = [aDecoder decodeInt32ForKey:@"ownerID"];
		self.ownerName = [aDecoder decodeObjectForKey:@"ownerName"];
		self.ownerGroupID = [aDecoder decodeInt32ForKey:@"ownerGroupID"];
	}
	return self;
}

@end

@implementation EVEOwnerID

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) ownerIDWithNames:(NSArray*) names cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVEOwnerID alloc] initWithNames:names cachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithNames:(NSArray*) names cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/ownerID.xml.aspx?names=%@", EVEOnlineAPIHost,
														[[names componentsJoinedByString:@","] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]
					  cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"owners"]) {
		self.owners = [[NSMutableArray alloc] init];
		return self.owners;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"owners"]) {
		EVEOwnerIDItem *characterIDItem = [EVEOwnerIDItem ownerIDItemWithXMLAttributes:attributeDict];
		[object addObject:characterIDItem];
		return characterIDItem;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.owners forKey:@"owners"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.owners = [aDecoder decodeObjectForKey:@"owners"];
	}
	return self;
}

@end