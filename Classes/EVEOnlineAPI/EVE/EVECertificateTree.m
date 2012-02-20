//
//  EVECertificateTree.m
//  EVEOnlineAPI
//
//  Created by Artem Shimanski on 8/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EVECertificateTree.h"


@implementation EVECertificateTreeItem
@synthesize categoryID;
@synthesize categoryName;
@synthesize classes;

+ (id) certificateTreeItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECertificateTreeItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.categoryID = [[attributeDict valueForKey:@"categoryID"] integerValue];
		self.categoryName = [attributeDict valueForKey:@"categoryName"];
	}
	return self;
}

- (void) dealloc {
	[categoryName release];
	[classes release];
	[super dealloc];
}

@end


@implementation EVECertificateTreeClassesItem

@synthesize classID;
@synthesize className;
@synthesize certificates;

+ (id) certificateTreeClassesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECertificateTreeClassesItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.classID = [[attributeDict valueForKey:@"classID"] integerValue];
		self.className = [attributeDict valueForKey:@"className"];
	}
	return self;
}

- (void) dealloc {
	[className release];
	[certificates release];
	[super dealloc];
}

@end


@implementation EVECertificateTreeCertificatesItem
@synthesize certificateID;
@synthesize grade;
@synthesize corporationID;
@synthesize description;
@synthesize requiredSkills;
@synthesize requiredCertificates;

+ (id) certificateTreeCertificatesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECertificateTreeCertificatesItem alloc] initWithXMLAttributes:attributeDict] autorelease];
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

- (void) dealloc {
	[description release];
	[requiredSkills release];
	[requiredCertificates release];
	[super dealloc];
}

@end


@implementation EVECertificateTreeRequiredSkillsItem
@synthesize typeID;
@synthesize skillLevel;

+ (id) certificateTreeRequiredSkillsItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECertificateTreeRequiredSkillsItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.typeID = [[attributeDict valueForKey:@"typeID"] integerValue];
		self.skillLevel = [[attributeDict valueForKey:@"skillLevel"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}

@end


@implementation EVECertificateTreeRequiredCertificatesItem
@synthesize certificateID;
@synthesize grade;

+ (id) certificateTreeRequiredCertificatesItemWithXMLAttributes:(NSDictionary *)attributeDict {
	return [[[EVECertificateTreeRequiredCertificatesItem alloc] initWithXMLAttributes:attributeDict] autorelease];
}

- (id) initWithXMLAttributes:(NSDictionary *)attributeDict {
	if (self = [super init]) {
		self.certificateID = [[attributeDict valueForKey:@"certificateID"] integerValue];
		self.grade = [[attributeDict valueForKey:@"grade"] integerValue];
	}
	return self;
}

- (void) dealloc {
	[super dealloc];
}

@end


@implementation EVECertificateTree
@synthesize categories;

+ (EVEApiKeyType) requiredApiKeyType {
	return EVEApiKeyTypeNone;
}

+ (id) certificateTreeWithError:(NSError **)errorPtr {
	return [[[EVECertificateTree alloc] initWithError:errorPtr] autorelease];
}

+ (id) certificateTreeWithTarget:(id)target action:(SEL)action object:(id)aObject {
	return [[[EVECertificateTree alloc] initWithTarget:target action:action object:aObject] autorelease];
}

- (id) initWithError:(NSError **)errorPtr {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CertificateTree.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
							error:errorPtr]) {
	}
	return self;
}

- (id) initWithTarget:(id)target action:(SEL)action object:(id)aObject {
	if (self = [super initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/eve/CertificateTree.xml.aspx", EVEOnlineAPIHost]]
					   cacheStyle:EVERequestCacheStyleModifiedShort
						   target:target
						   action:action object:aObject]) {
	}
	return self;
}

- (void) dealloc {
	[categories release];
	[super dealloc];
}

#pragma mark NSXMLParserDelegate

- (id) didStartRowset: (NSString*) rowset {
	if ([rowset isEqualToString:@"categories"]) {
		categories = [[NSMutableArray alloc] init];
		return categories;
	}
	else if ([rowset isEqualToString:@"classes"]) {
		NSMutableArray *classes = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setClasses:classes];
		return classes;
	}
	else if ([rowset isEqualToString:@"certificates"]) {
		NSMutableArray *certificates = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setCertificates:certificates];
		return certificates;
	}
	else if ([rowset isEqualToString:@"requiredSkills"]) {
		NSMutableArray *requiredSkills = [[[NSMutableArray alloc] init] autorelease];
		[self.currentRow setRequiredSkills:requiredSkills];
		return requiredSkills;
	}
	else if ([rowset isEqualToString:@"requiredCertificates"]) {
		NSMutableArray *requiredCertificates = [[[NSMutableArray alloc] init] autorelease];
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