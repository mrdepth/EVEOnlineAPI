//
//  CRAPISerializer.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.11.15.
//
//

#import <AFNetworking/AFNetworking.h>

@interface CRAPISerializer : AFHTTPResponseSerializer

+ (instancetype) serializerWithRootClass:(Class) aClass;
- (instancetype) initWithRootClass:(Class) aClass;

@end
