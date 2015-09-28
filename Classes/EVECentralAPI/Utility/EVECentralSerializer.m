//
//  EVECentralSerializer.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 28.09.15.
//
//

#import "EVECentralSerializer.h"
#import "NSDictionary+XML.h"
#import "EVECentralGlobals.h"

@interface EVECentralSerializer()
@property (nonatomic, strong) Class rootClass;
@end


@implementation EVECentralSerializer

+ (instancetype) serializerWithRootClass:(Class) aClass {
	return [[self alloc] initWithRootClass:aClass];
}

- (id) initWithRootClass:(Class) aClass {
	if (self = [super init]) {
		self.rootClass = aClass;
	}
	return self;
}

- (nullable id) responseObjectForResponse:(nullable NSURLResponse *)response data:(nullable NSData *)data error:(NSError *__autoreleasing  __nullable * __nullable)error {
	NSDictionary* dic = [NSDictionary dictionaryWithXMLData:data];
	NSDictionary* result = dic[@"evec_api"];
	if (result && [result isKindOfClass:[NSDictionary class]]) {
		__block id object;
		[result enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
			if (![key isEqualToString:@"_"]) {
				if (obj && [obj isKindOfClass:[NSDictionary class]]) {
					object = [[self.rootClass alloc] initWithDictionary:obj];
					*stop = YES;
				}
			}
		}];
		if (object)
			return object;
	}
	if (error)
		*error = [NSError errorWithDomain:EVECentralErrorDomain code:EVECentralErrorCodeParsingError userInfo:@{NSLocalizedDescriptionKey:EVECentralErrorCodeParsingErrorText}];
	return nil;
}

@end
