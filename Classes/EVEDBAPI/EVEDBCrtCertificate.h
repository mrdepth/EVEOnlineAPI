//
//  EVEDBCrtCertificate.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBObject.h"

@class EVEDBCrtCategory;
@class EVEDBCrtClass;
@class EVEDBEveIcon;
@interface EVEDBCrtCertificate : EVEDBObject
@property (nonatomic) NSInteger certificateID;
@property (nonatomic) NSInteger categoryID;
@property (nonatomic, strong) EVEDBCrtCategory* category;
@property (nonatomic) NSInteger classID;
@property (nonatomic, strong) EVEDBCrtClass* certificateClass;
@property (nonatomic) NSInteger grade;
@property (nonatomic, readonly) NSString* gradeText;
@property (nonatomic) NSInteger corpID;
@property (nonatomic) NSInteger iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, readonly, strong) NSArray* prerequisites;
@property (nonatomic, readonly, strong) NSArray* derivations;
@property (nonatomic, readonly, strong) NSArray* recommendations;
@property (nonatomic, readonly) NSString* iconImageName;

+ (id) crtCertificateWithCertificateID: (NSInteger)aCertificateID error:(NSError **)errorPtr;
- (id) initWithCertificateID: (NSInteger)aCertificateID error:(NSError **)errorPtr;

@end