//
//  EVECertificateTree.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECertificateTreeItem : NSObject {
	NSInteger categoryID;
	NSString *categoryName;
	NSMutableArray *classes;
}
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, copy) NSString *categoryName;
@property (nonatomic, retain) NSArray *classes;

+ (id) certificateTreeItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECertificateTreeClassesItem : NSObject {
	NSInteger classID;
	NSString *className;
	NSMutableArray *certificates;
}
@property (nonatomic) NSInteger classID;
@property (nonatomic, copy) NSString *className;
@property (nonatomic, retain) NSArray *certificates;

+ (id) certificateTreeClassesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECertificateTreeCertificatesItem : NSObject {
	NSInteger certificateID;
	NSInteger grade;
	NSInteger corporationID;
	NSString *description;
	NSMutableArray *requiredSkills;
	NSMutableArray *requiredCertificates;
}
@property (nonatomic) NSInteger certificateID;
@property (nonatomic) NSInteger grade;
@property (nonatomic) NSInteger corporationID;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, retain) NSArray *requiredSkills;
@property (nonatomic, retain) NSArray *requiredCertificates;

+ (id) certificateTreeCertificatesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECertificateTreeRequiredSkillsItem : NSObject {
	NSInteger typeID;
	NSInteger skillLevel;
}
@property (nonatomic) NSInteger typeID;
@property (nonatomic) NSInteger skillLevel;

+ (id) certificateTreeRequiredSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECertificateTreeRequiredCertificatesItem : NSObject {
	NSInteger certificateID;
	NSInteger grade;
}
@property (nonatomic) NSInteger certificateID;
@property (nonatomic) NSInteger grade;

+ (id) certificateTreeRequiredCertificatesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECertificateTree : EVERequest {
	NSMutableArray *categories;
}
@property (nonatomic, retain) NSArray *categories;

+ (id) certificateTreeWithError:(NSError **)errorPtr;
+ (id) certificateTreeWithTarget:(id)target action:(SEL)action object:(id)object;
- (id) initWithError:(NSError **)errorPtr;
- (id) initWithTarget:(id)target action:(SEL)action object:(id)object;
@end