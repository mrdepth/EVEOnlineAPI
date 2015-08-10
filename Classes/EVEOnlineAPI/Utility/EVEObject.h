//
//  EVEObject.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 05.08.15.
//
//

#import <Foundation/Foundation.h>
#import "EVELocationIDTransformer.h"

#define EVEXMLSchemePropertyTypeKey
#define EVEXMLSchemePropertyKeyPathKey
#define EVEXMLSchemePropertyNameKey

typedef NS_ENUM(NSInteger, EVEXMLSchemePropertyType) {
	EVEXMLSchemePropertyTypeScalar,
	EVEXMLSchemePropertyTypeObject,
	EVEXMLSchemePropertyTypeRowset,
	EVEXMLSchemePropertyTypeDate,
	EVEXMLSchemePropertyTypeString,
	EVEXMLSchemePropertyTypeError
};


@protocol EVEXMLScheme
@end

@interface EVEObject : NSObject<EVEXMLScheme, NSCoding>
+ (NSDictionary*) scheme;
- (id) initWithDictionary:(NSDictionary*) dictionary;
@end