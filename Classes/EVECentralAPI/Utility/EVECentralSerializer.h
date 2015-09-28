//
//  EVECentralSerializer.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 28.09.15.
//
//

#import <AFNetworking/AFNetworking.h>

@interface EVECentralSerializer : AFHTTPResponseSerializer

+ (instancetype) serializerWithRootClass:(Class) aClass;
- (instancetype) initWithRootClass:(Class) aClass;


@end
