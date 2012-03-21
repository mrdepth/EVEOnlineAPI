//
//  EVEDBRamInstallationTypeContent.h
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVEDBInvType;
@class EVEDBRamAssemblyLineType;
@interface EVEDBRamInstallationTypeContent : NSObject {
	NSInteger installationTypeID;
	EVEDBInvType* installationType;
	NSInteger assemblyLineTypeID;
	EVEDBRamAssemblyLineType* assemblyLineType;
	NSInteger quantity;
}
@property (nonatomic) NSInteger installationTypeID;
@property (nonatomic, retain) EVEDBInvType* installationType;
@property (nonatomic) NSInteger assemblyLineTypeID;
@property (nonatomic, retain) EVEDBRamAssemblyLineType* assemblyLineType;
@property (nonatomic) NSInteger quantity;

+ (id) ramInstallationTypeContentWithDictionary: (NSDictionary*) dictionary;
- (id) initWithDictionary: (NSDictionary*) dictionary;

@end