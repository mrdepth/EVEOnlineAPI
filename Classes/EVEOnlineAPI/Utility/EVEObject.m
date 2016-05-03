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
		if (dictionary && [dictionary isKindOfClass:[NSDictionary class]]) {
			[self.class.scheme enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary* item, BOOL *stop) {
				@try {
					NSString* elementName = item[@"elementName"];
					if (!elementName)
						elementName = key;
					
					id value = [dictionary valueForKeyPath:elementName];
					
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
							if (value && [value isKindOfClass:[NSString class]])
								[self setValue:@([value doubleValue]) forKey:key];
							else if (value && [value isKindOfClass:[NSNumber class]])
								[self setValue:value forKey:key];
							else
								[self setValue:@(0) forKey:key];
							break;
						case EVEXMLSchemePropertyTypeString: {
							if ([value isKindOfClass:[NSString class]])
								[self setValue:value forKey:key];
							break;
						}
							
						case EVEXMLSchemePropertyTypeObject: {
							Class class = item[@"class"];
							if (class && [class isSubclassOfClass:[EVEObject class]] && [value isKindOfClass:[NSDictionary class]])
								value = [[class alloc] initWithDictionary:value];
							
							[self setValue:value forKey:key];
							break;
						}
							
						case EVEXMLSchemePropertyTypeRowset: {
							NSMutableArray* array = [NSMutableArray new];
							Class class = item[@"class"];
							
							id object = dictionary[@"rowset"];
							id rowset;
							if (object) {
								if ([object isKindOfClass:[NSArray class]])
									rowset = object[[NSPredicate predicateWithFormat:@"name=%@", elementName]];
								else if ([object isKindOfClass:[NSDictionary class]] && [object[@"name"] isEqualToString:elementName])
									rowset = object;
							}
							NSArray* rows = rowset[@"row"] ?: [value isKindOfClass:[NSArray class]] ? value : nil;
							if (rows) {
								if (![rows isKindOfClass:[NSArray class]])
									rows = @[rows];
								
								for (NSDictionary* row in rows) {
									if (class && [class isSubclassOfClass:[EVEObject class]] && [row isKindOfClass:[NSDictionary class]])
										[array addObject:[[class alloc] initWithDictionary:row]];
									else
										[array addObject:row];
									
								}
								[self setValue:array forKey:key];
							}
							break;
						}
						case EVEXMLSchemePropertyTypeArray: {
							if (value) {
								NSMutableArray* array = [NSMutableArray new];
								Class class = item[@"class"];
								
								if (![value isKindOfClass:[NSArray class]])
									value = @[value];
								
								for (NSDictionary* object in value) {
									if (class && [class isSubclassOfClass:[EVEObject class]] && [object isKindOfClass:[NSDictionary class]])
										[array addObject:[[class alloc] initWithDictionary:object]];
									else
										[array addObject:object];
									
								}
								[self setValue:array forKey:key];
							}
							break;
						}
						case EVEXMLSchemePropertyTypeDate:
							if (value && [value isKindOfClass:[NSString class]])
								[self setValue:[[NSDateFormatter eveDateFormatter] dateFromString:value] forKey:key];
							else if ([value isKindOfClass:[NSDate class]])
								[self setValue:value forKey:key];
							break;
						case EVEXMLSchemePropertyTypeError: {
							if (value && [value isKindOfClass:[NSDictionary class]]) {
								NSInteger errorCode = [value[@"code"] integerValue];
								NSString* description = value[@"_"];
								[self setValue:[NSError errorWithDomain:EVEOnlineErrorDomain code:errorCode userInfo:@{NSLocalizedDescriptionKey:description ? description : @""}] forKey:key];
							}
							break;
						}
							
						default:
							break;
					}
				}
				@catch (NSException *exception) {
					NSLog(@"%@: invalid item\n%@:%@", [self class], key, item);
				}
				@finally {
				}

			}];
		}
	}
	return self;
}

#pragma mark - NSCoding

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[self.class.scheme enumerateKeysAndObjectsUsingBlock:^(id key, NSDictionary* item, BOOL *stop) {
		id value = [self valueForKey:key];
		if (value) {
			if ([value isKindOfClass:[NSArray class]])
				[aCoder encodeObject:[value copy] forKey:key];
			else
				[aCoder encodeObject:value forKey:key];
		}
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
