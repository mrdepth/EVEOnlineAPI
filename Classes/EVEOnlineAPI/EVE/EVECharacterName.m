//
//  EVECharacterName.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacterName.h"


@implementation EVECharacterNameItem

+ (id) characterNameItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharacterNameItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.characterID = [[attributeDict valueForKey:@"characterID"] intValue];
		self.name = [attributeDict valueForKey:@"name"];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInt32:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.characterID = [aDecoder decodeInt32ForKey:@"characterID"];
		self.name = [aDecoder decodeObjectForKey:@"name"];
	}
	return self;
}

@end

@implementation EVECharacterName


+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) characterNameWithIDs:(NSArray*) ids cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECharacterName alloc] initWithIDs:ids cachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithIDs:(NSArray*) ids cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	NSString* body = [NSString stringWithFormat:@"ids=%@", [ids componentsJoinedByString:@","]];
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CharacterName.xml.aspx",
														EVEOnlineAPIHost]]
						 bodyData:[body dataUsingEncoding:NSUTF8StringEncoding]
					  contentType:nil
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
		
	}
	return self;

}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"characters"]) {
		self.characters = [[NSMutableDictionary alloc] init];
		return self.characters;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"characters"]) {
		[(NSMutableDictionary*) self.characters setObject:[attributeDict valueForKey:@"name"] forKey:@([attributeDict[@"characterID"] intValue])];
		return nil;
	}
	return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
	[aCoder encodeObject:self.characters forKey:@"characters"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.characters = [aDecoder decodeObjectForKey:@"characters"];
	}
	return self;
}

@end