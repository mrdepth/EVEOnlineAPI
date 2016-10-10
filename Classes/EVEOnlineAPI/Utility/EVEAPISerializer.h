//
//  EVEAPISerializer.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.08.15.
//
//

#import "EVEHTTPSessionManager.h"

@interface EVEAPISerializer : AFHTTPResponseSerializer

+ (instancetype) serializerWithRootClass:(Class) aClass;
- (instancetype) initWithRootClass:(Class) aClass;

@end
