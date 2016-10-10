//
//  EVEAPISerializer.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.08.15.
//
//

#import "EVEAPISerializer.h"
#import "EVEOnlineAPI.h"
#import "NSDictionary+XML.h"
#import "EVEResult.h"

@interface EVEAPISerializer()
@property (nonatomic, strong) Class rootClass;
@end

@implementation EVEAPISerializer

+ (instancetype) serializerWithRootClass:(Class) aClass {
	return [[self alloc] initWithRootClass:aClass];
}

- (id) initWithRootClass:(Class) aClass {
	if (self = [super init]) {
		self.rootClass = aClass;
	}
	return self;
}

- (nullable id) responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
	NSDictionary* dic = [NSDictionary dictionaryObjectWithXMLData:data];
	EVEAPIObject* api = [[EVEAPIObject alloc] initWithDictionary:dic[@"eveapi"]];
	NSDictionary* result = dic[@"eveapi"][@"result"];
	if (result && [result isKindOfClass:[NSDictionary class]]) {
		EVEResult* object = [[self.rootClass alloc] initWithDictionary:result];
		object.eveapi = api;
		return object;
	}
	else {
		if (error)
			*error = api.error;
		return nil;
	}
}

@end
