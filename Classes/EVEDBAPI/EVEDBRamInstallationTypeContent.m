//
//  EVEDBRamInstallationTypeContent.m
//  EVEOnlineAPI
//
//  Created by Mr. Depth on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EVEDBRamInstallationTypeContent.h"
#import "EVEDBDatabase.h"
#import "EVEDBRamAssemblyLineType.h"
#import "EVEDBInvType.h"

@interface EVEDBRamInstallationTypeContent(Private)
- (void) setValuesWithDictionary:(NSDictionary *)dictionary;
- (void) didReceiveRecord: (NSDictionary*) record;
@end

@implementation EVEDBRamInstallationTypeContent(Private)

- (void) setValuesWithDictionary:(NSDictionary *)dictionary {
	self.installationTypeID = [[dictionary valueForKey:@"installationTypeID"] integerValue];
	self.assemblyLineTypeID = [[dictionary valueForKey:@"assemblyLineTypeID"] integerValue];
	self.quantity = [[dictionary valueForKey:@"quantity"] integerValue];
}

- (void) didReceiveRecord: (NSDictionary*) record {
	[self setValuesWithDictionary:record];
}

@end

@implementation EVEDBRamInstallationTypeContent
@synthesize installationTypeID;
@synthesize installationType;
@synthesize assemblyLineTypeID;
@synthesize assemblyLineType;
@synthesize quantity;

+ (id) ramInstallationTypeContentWithDictionary: (NSDictionary*) dictionary {
	return [[[EVEDBRamInstallationTypeContent alloc] initWithDictionary:dictionary] autorelease];
}

- (id) initWithDictionary: (NSDictionary*) dictionary {
	if (self = [super init]) {
		[self setValuesWithDictionary:dictionary];
	}
	return self;
}

- (void) dealloc {
	[installationType release];
	[assemblyLineType release];
	[super dealloc];
}

- (EVEDBInvType*) installationType {
	if (installationTypeID == 0)
		return NULL;
	if (!installationType) {
		installationType = [[EVEDBInvType invTypeWithTypeID:installationTypeID error:nil] retain];
		if (!installationType)
			installationType = (EVEDBInvType*) [[NSNull null] retain];
	}
	if ((NSNull*) installationType == [NSNull null])
		return NULL;
	else
		return installationType;
}

- (EVEDBRamAssemblyLineType*) assemblyLineType {
	if (assemblyLineTypeID == 0)
		return NULL;
	if (!assemblyLineType) {
		assemblyLineType = [[EVEDBRamAssemblyLineType ramAssemblyLineTypeWithAssemblyLineTypeID:assemblyLineTypeID error:nil] retain];
		if (!assemblyLineType)
			assemblyLineType = (EVEDBRamAssemblyLineType*) [[NSNull null] retain];
	}
	if ((NSNull*) assemblyLineType == [NSNull null])
		return NULL;
	else
		return assemblyLineType;
}

@end