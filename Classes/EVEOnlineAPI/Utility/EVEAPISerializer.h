//
//  EVEAPISerializer.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.08.15.
//
//

#import <AFNetworking/AFNetworking.h>

@interface EVEAPISerializer : AFHTTPResponseSerializer
@property (nonatomic, strong) NSData* data;

+ (instancetype) serializerWithRootClass:(Class) aClass;
- (instancetype) initWithRootClass:(Class) aClass;

@end
