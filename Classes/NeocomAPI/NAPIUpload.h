//
//  NAPIUpload.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 18.06.13.
//
//

#import "EVEObject.h"

@interface NAPIUpload : EVEObject
@property (nonatomic, assign, getter = isSuccess) BOOL success;
@end
