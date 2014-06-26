//
//  EVECertificateTree.h
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVERequest.h"

@interface EVECertificateTreeItem : NSObject<NSCoding>
@property (nonatomic) int32_t categoryID;
@property (nonatomic, copy) NSString *categoryName;
@property (nonatomic, strong) NSArray *classes;

+ (id) certificateTreeItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECertificateTreeClassesItem : NSObject<NSCoding>
@property (nonatomic) int32_t classID;
@property (nonatomic, copy) NSString *className;
@property (nonatomic, strong) NSArray *certificates;

+ (id) certificateTreeClassesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECertificateTreeCertificatesItem : NSObject<NSCoding>
@property (nonatomic) int32_t certificateID;
@property (nonatomic) int32_t grade;
@property (nonatomic) int32_t corporationID;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, strong) NSArray *requiredSkills;
@property (nonatomic, strong) NSArray *requiredCertificates;

+ (id) certificateTreeCertificatesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECertificateTreeRequiredSkillsItem : NSObject<NSCoding>
@property (nonatomic) int32_t typeID;
@property (nonatomic) int32_t skillLevel;

+ (id) certificateTreeRequiredSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECertificateTreeRequiredCertificatesItem : NSObject<NSCoding>
@property (nonatomic) int32_t certificateID;
@property (nonatomic) int32_t grade;

+ (id) certificateTreeRequiredCertificatesItemWithXMLAttributes:(NSDictionary *)attributeDict;
- (id) initWithXMLAttributes:(NSDictionary *)attributeDict;

@end


@interface EVECertificateTree : EVERequest
@property (nonatomic, strong) NSArray *categories;

+ (id) certificateTreeWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
- (id) initWithCachePolicy:(NSURLRequestCachePolicy) cachePolicy error:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress, BOOL* stop)) progressHandler;
@end