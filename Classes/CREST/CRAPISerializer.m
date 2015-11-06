//
//  CRAPISerializer.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.11.15.
//
//

#import "CRAPISerializer.h"
#import "CRAPI.h"

@interface CRAPISerializer()
@property (nonatomic, strong) Class rootClass;
@end

@implementation CRAPISerializer

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
	id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
	if (result) {
		if ([result isKindOfClass:[NSDictionary class]]) {
			if (result[@"error_description"]) {
				if (error)
					*error = [NSError errorWithDomain:CRAPIErrorDomain code:0 userInfo:@{NSLocalizedDescriptionKey:result[@"error_description"]}];
				return nil;
			}
			else if (result[@"exceptionType"] && result[@"message"]) {
				if (error) {
					NSInteger code = 0;
					if ([result[@"exceptionType"] isEqualToString:@"UnauthorizedError"])
						code = CRAPIErrorBadToken;
					*error = [NSError errorWithDomain:CRAPIErrorDomain code:code userInfo:@{NSLocalizedDescriptionKey:result[@"message"]}];
				}
				return nil;
			}
			else
				return [[self.rootClass alloc] initWithDictionary:result];
		}
		else if ([result isKindOfClass:[NSArray class]])
			return [[self.rootClass alloc] initWithArray:result];
	}
	if (error)
		*error = [NSError errorWithDomain:CRAPIErrorDomain code:CRAPIErrorCodeParsingError userInfo:@{NSLocalizedDescriptionKey:CRAPIErrorCodeParsingErrorText}];
	return nil;
}

@end
