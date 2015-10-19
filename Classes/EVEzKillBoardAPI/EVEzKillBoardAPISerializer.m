//
//  EVEzKillBoardAPISerializer.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 19.10.15.
//
//

#import "EVEzKillBoardAPISerializer.h"
#import "EVEzKillBoardAPI.h"

@interface EVEzKillBoardAPISerializer()
@property (nonatomic, strong) Class rootClass;
@end


@implementation EVEzKillBoardAPISerializer

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
		if ([result isKindOfClass:[NSDictionary class]])
			return [[self.rootClass alloc] initWithDictionary:result];
		else if ([result isKindOfClass:[NSArray class]])
			return [[self.rootClass alloc] initWithArray:result];
	}
	if (error)
		*error = [NSError errorWithDomain:EVEzKillBoardAPIErrorDomain code:EVEzKillBoardAPIErrorCodeParsingError userInfo:@{NSLocalizedDescriptionKey:EVEzKillBoardAPIErrorCodeParsingErrorText}];
	return nil;
}


@end
