//
//  EVECertificateTree.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECertificateTree.h"


@implementation EVECertificateTreeItem

+ (id) certificateTreeItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECertificateTreeItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.categoryID = [[attributeDict valueForKey:@"categoryID"] integerValue];
		self.categoryName = [attributeDict valueForKey:@"categoryName"];
	}
	return self;
}

@end


@implementation EVECertificateTreeClassesItem

+ (id) certificateTreeClassesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECertificateTreeClassesItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.classID = [[attributeDict valueForKey:@"classID"] integerValue];
		self.className = [attributeDict valueForKey:@"className"];
	}
	return self;
}

@end


@implementation EVECertificateTreeCertificatesItem

+ (id) certificateTreeCertificatesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECertificateTreeCertificatesItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.certificateID = [[attributeDict valueForKey:@"certificateID"] integerValue];
		self.grade = [[attributeDict valueForKey:@"grade"] integerValue];
		self.corporationID = [[attributeDict valueForKey:@"corporationID"] integerValue];
		self.description = [attributeDict valueForKey:@"description"];
	}
	return self;
}

@end


@implementation EVECertificateTreeRequiredSkillsItem

+ (id) certificateTreeRequiredSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECertificateTreeRequiredSkillsItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.skillLevel = [[attributeDict valueForKey:@"skillLevel"] integerValue];
	}
	return self;
}

@end


@implementation EVECertificateTreeRequiredCertificatesItem

+ (id) certificateTreeRequiredCertificatesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[EVECertificateTreeRequiredCertificatesItem alloc] initWithXMLAttributes:attributeDict];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.certificateID = [[attributeDict valueForKey:@"certificateID"] integerValue];
		self.grade = [[attributeDict valueForKey:@"grade"] integerValue];
	}
	return self;
}

@end


@implementation EVECertificateTree

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) certificateTreeWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	return [[EVECertificateTree alloc] initWithError:errorPtr progressHandler:progressHandler];
}

- (id) initWithError:(NSError **)errorPtr progressHandler:(void(^)(CGFloat progress)) progressHandler {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CertificateTree.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr
				  progressHandler:progressHandler]) {
	}
	return self;
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"categories"]) {
		self.categories = [[NSMutableArray alloc] init];
		return self.categories;
	}
	else if ([rowset isEqualToString:@"classes"]) {
		NSMutableArray *classes = [[NSMutableArray alloc] init];
		[self.currentRow setClasses:classes];
		return classes;
	}
	else if ([rowset isEqualToString:@"certificates"]) {
		NSMutableArray *certificates = [[NSMutableArray alloc] init];
		[self.currentRow setCertificates:certificates];
		return certificates;
	}
	else if ([rowset isEqualToString:@"requiredSkills"]) {
		NSMutableArray *requiredSkills = [[NSMutableArray alloc] init];
		[self.currentRow setRequiredSkills:requiredSkills];
		return requiredSkills;
	}
	else if ([rowset isEqualToString:@"requiredCertificates"]) {
		NSMutableArray *requiredCertificates = [[NSMutableArray alloc] init];
		[self.currentRow setRequiredCertificates:requiredCertificates];
		return requiredCertificates;
	}
	else
		return nil;
}

- (id) didStartRowWithAttributes:(NSDictionary *) attributeDict rowset:(NSString*) rowset rowsetObject:(id) object {
	if ([rowset isEqualToString:@"categories"]) {
		EVECertificateTreeItem *certificateTreeItem = [EVECertificateTreeItem certificateTreeItemWithXMLAttributes:attributeDict];
		[object addObject:certificateTreeItem];
		return certificateTreeItem;
	}
	else if ([rowset isEqualToString:@"classes"]) {
		EVECertificateTreeClassesItem *certificateTreeClassesItem = [EVECertificateTreeClassesItem certificateTreeClassesItemWithXMLAttributes:attributeDict];
		[object addObject:certificateTreeClassesItem];
		return certificateTreeClassesItem;
	}
	else if ([rowset isEqualToString:@"certificates"]) {
		EVECertificateTreeCertificatesItem *certificateTreeCertificatesItem = [EVECertificateTreeCertificatesItem certificateTreeCertificatesItemWithXMLAttributes:attributeDict];
		[object addObject:certificateTreeCertificatesItem];
		return certificateTreeCertificatesItem;
	}
	else if ([rowset isEqualToString:@"requiredSkills"]) {
		EVECertificateTreeRequiredSkillsItem *certificateTreeRequiredSkillsItem = [EVECertificateTreeRequiredSkillsItem certificateTreeRequiredSkillsItemWithXMLAttributes:attributeDict];
		[object addObject:certificateTreeRequiredSkillsItem];
		return certificateTreeRequiredSkillsItem;
	}
	else if ([rowset isEqualToString:@"requiredCertificates"]) {
		EVECertificateTreeRequiredCertificatesItem *certificateTreeRequiredCertificatesItem = [EVECertificateTreeRequiredCertificatesItem certificateTreeRequiredCertificatesItemWithXMLAttributes:attributeDict];
		[object addObject:certificateTreeRequiredCertificatesItem];
		return certificateTreeRequiredCertificatesItem;
	}
	return nil;
}
@end