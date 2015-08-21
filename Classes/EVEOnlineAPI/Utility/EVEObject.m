//
//  EVEObject.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.08.15.
//
//

#import "EVEObject.h"
#import "EVEAPISerializer.h"
#import "EVEOnlineAPI.h"
#import "NSDateFormatter+EVEOnlineAPI.h"

@implementation EVEObject

+ (NSDictionary*) scheme {
	return @{};
}

- (id) initWithDictionary:(NSDictionary*) dictionary {
	if (self = [super init]) {
		[self.class.scheme enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary* item, BOOL *stop) {
			NSString* elementName = item[@"elementName"];
			if (!elementName)
				elementName = key;
			id value = dictionary[elementName];
			
			id transformer = item[@"transformer"];
			if (transformer) {
				if ([transformer isKindOfClass:[NSValueTransformer class]])
					value = [(NSValueTransformer*) transformer transformedValue:value];
				else {
					id (^block)(id) = transformer;
					value = block(value);
				}
			}

			switch ([item[@"type"] integerValue]) {
				case EVEXMLSchemePropertyTypeScalar:
					if (value)
						[self setValue:value forKey:key];
					else
						[self setValue:@(0) forKey:key];
					break;
				case EVEXMLSchemePropertyTypeString: {
					[self setValue:value forKey:key];
					break;
				}
					
				case EVEXMLSchemePropertyTypeObject: {
					Class class = item[@"class"];
					if (class && [class isSubclassOfClass:[EVEObject class]])
						value = [[class alloc] initWithDictionary:value];

					[self setValue:value forKey:key];
					break;
				}
					
				case EVEXMLSchemePropertyTypeRowset: {
					NSMutableArray* array = [NSMutableArray new];
					Class class = item[@"class"];
					
					id object = dictionary[@"rowset"];
					id rowset;
					if ([object isKindOfClass:[NSArray class]])
						rowset = object[[NSPredicate predicateWithFormat:@"name=%@", elementName]];
					else if ([object isKindOfClass:[NSDictionary class]] && [object[@"name"] isEqualToString:elementName])
						rowset = object;
					
					NSArray* rows = rowset[@"row"];
					if (rows) {
						if (![rows isKindOfClass:[NSArray class]])
							rows = @[rows];
						
						for (NSDictionary* row in rows) {
							if (class && [class isSubclassOfClass:[EVEObject class]])
								[array addObject:[[class alloc] initWithDictionary:row]];
							else
								[array addObject:row];
							
						}
						[self setValue:array forKey:key];
					}
					break;
				}
				case EVEXMLSchemePropertyTypeDate:
					if (value)
						[self setValue:[[NSDateFormatter eveDateFormatter] dateFromString:value] forKey:key];
					break;
				case EVEXMLSchemePropertyTypeError: {
					if (value) {
						NSInteger errorCode = [value[@"code"] integerValue];
						NSString* description = value[@"_"];
						[self setValue:[NSError errorWithDomain:EVEOnlineErrorDomain code:errorCode userInfo:@{NSLocalizedDescriptionKey:description ? description : @""}] forKey:key];
					}
					break;
				}
					
				default:
					break;
			}
		}];
	}
	return self;
}

#pragma mark - NSCoding

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[self.class.scheme enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary* item, BOOL *stop) {
		id value = [self valueForKey:key];
		if (value)
			[aCoder encodeObject:value forKey:key];
	}];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		[self.class.scheme enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary* item, BOOL *stop) {
			id value = [aDecoder decodeObjectForKey:key];
			[self setValue:value forKey:key];
		}];
	}
	return self;
}

@end
