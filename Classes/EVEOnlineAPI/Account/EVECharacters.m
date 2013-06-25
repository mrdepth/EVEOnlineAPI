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

@end


@implementation EVECharacters

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeLimited;
}

+ (id) charactersWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECharacters alloc] initWithKeyID:keyID vCode:vCode error:errorPtr progressHandler:progressHandler];
}

- (id) initWithKeyID: (NSInteger) keyID vCode: (NSString*) vCode error:(NSError **)errorPtr progressHandler:(void (^)(CGFloat))progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/account/Characters.xml.aspx?keyID=%d&vCode=%@", EVEOnlineAPIHost, keyID, [vCode stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

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

@end
