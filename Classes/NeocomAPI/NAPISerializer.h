//
//  NAPISerializer.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 15.10.15.
//
//

#import <AFNetworking/AFNetworking.h>

@interface NAPISerializer : AFHTTPResponseSerializer

+ (instancetype) serializerWithRootClass:(Class) aClass;
- (instancetype) initWithRootClass:(Class) aClass;

@end
