//
//  EVECharacters.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECharacters.h"

@implementation EVECharactersItem

+ (id) charactersItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECharactersItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.name = [attributeDict valueForKey:@"name"];
		self.characterID = [[attributeDict valueForKey:@"characterID"] integerValue];
		self.corporationName = [attributeDict valueForKey:@"corporationName"];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
	}
	return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.name forKey:@"name"];
	[aCoder encodeInteger:self.characterID forKey:@"characterID"];
	[aCoder encodeObject:self.corporationName forKey:@"corporationName"];
	[aCoder encodeInteger:self.corporationID forKey:@"corporationID"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		self.name = [aDecoder decodeObjectForKey:@"name"];
		self.characterID = [aDecoder decodeIntegerForKey:@"characterID"];
		self.corporationName = [aDecoder decodeObjectForKey:@"corporationName"];
		self.corporationID = [aDecoder decodeIntegerForKey:@"corporationID"];
	}
	return self;
}

@end


@implementation EVECharacters

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) charactersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	return [[EVECharacters alloc] initWithKeyID:keyID vCode:vCode cachePolicy:cachePolicy error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode cachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/account/Characters.xml.aspx?keyID=%d&vCode=%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]
					   cachePolicy:cachePolicy
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark - NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"characters"]) {
		self.characters = [[NSMutableArray alloc] init];
		return self.characters;
	}
	return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"characters"]) {
		EVECharactersItem *character = [EVECharactersItem charactersItemWithXMLAttributes:attributeDict];
		[(NSMutableArray*) self.characters addObject:character];
		return character;
	}
	else
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
