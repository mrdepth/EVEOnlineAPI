//
//  EVEDBCrtCertificate.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBCrtCategory;
@class EVEDBCrtClass;
@class EVEDBEveIcon;
@interface EVEDBCrtCertificate : NSObject {
	NSInteger certificateID;
	NSInteger categoryID;
	EVEDBCrtCategory* category;
	NSInteger classID;
	EVEDBCrtClass* certificateClass;
	NSInteger grade;
	NSInteger corpID;
	NSInteger iconID;
	EVEDBEveIcon *icon;
	NSString* description;
	NSMutableArray* prerequisites;
	NSMutableArray* derivations;
	NSMutableArray* recommendations;
}
@property (nonatomic) NSInteger certificateID;
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, retain) EVEDBCrtCategory* category;
@property (nonatomic) NSInteger classID;
@property (nonatomic, retain) EVEDBCrtClass* certificateClass;
@property (nonatomic) NSInteger grade;
@property (nonatomic, readonly) NSString* gradeText;
@property (nonatomic) NSInteger corpID;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, retain) EVEDBEveIcon *icon;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSArray* prerequisites;
@property (nonatomic, retain) NSArray* derivations;
@property (nonatomic, retain) NSArray* recommendations;
@property (nonatomic, readonly) NSString* iconImageName;

+ (id) crtCertificateWithCertificateID: (NSInteger)aCertificateID error:(NSError **)errorPtr;
+ (id) crtCertificateWithDictionary: (NSDictionary*) dictionary;
- (id) initWithCertificateID: (NSInteger)aCertificateID error:(NSError **)errorPtr;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end