//
//  NAPIUpload.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 18.06.13.
//
//

#import "EVECachedURLRequest.h"

@interface NAPIUpload : EVECachedURLRequest
@property (nonatomic, assign, getter = isSuccess) BOOL success;

+ (id) uploadFitsWithCannonicalNames:(NSArray*) cannonicalNames userID:(NSString*) userID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithCannonicalNames:(NSArray*) cannonicalNames userID:(NSString*) userID error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;

@end
