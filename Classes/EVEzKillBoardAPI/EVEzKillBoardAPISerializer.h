//
//  EVEzKillBoardAPISerializer.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 19.10.15.
//
//

#import <AFNetworking/AFNetworking.h>

@interface EVEzKillBoardAPISerializer : AFHTTPResponseSerializer

+ (instancetype) serializerWithRootClass:(Class) aClass;
- (instancetype) initWithRootClass:(Class) aClass;

@end
