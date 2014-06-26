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
@property (nonatomic) int32_t certificateID;
@property (nonatomic) int32_t categoryID;
@property (nonatomic, strong) EVEDBCrtCategory* category;
@property (nonatomic) int32_t classID;
@property (nonatomic, strong) EVEDBCrtClass* certificateClass;
@property (nonatomic) int32_t grade;
@property (nonatomic, readonly) NSString* gradeText;
@property (nonatomic) int32_t corpID;
@property (nonatomic) int32_t iconID;
@property (nonatomic, strong) EVEDBEveIcon *icon;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, readonly, strong) NSArray* prerequisites;
@property (nonatomic, readonly, strong) NSArray* derivations;
@property (nonatomic, readonly, strong) NSArray* recommendations;
@property (nonatomic, readonly) NSString* iconImageName;

+ (id) crtCertificateWithCertificateID: (int32_t)aCertificateID error:(NSError **)errorPtr;
- (id) initWithCertificateID: (int32_t)aCertificateID error:(NSError **)errorPtr;

@end