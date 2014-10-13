//
//  EVEDBCertCertificate.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 22.01.14.
//
//

#import "EVEDBCertCertificate.h"
#import "EVEDBDatabase.h"
#import "EVEDBInvGroup.h"
#import "EVEDBCertSkill.h"

@interface EVEDBCertCertificate()
@property (nonatomic, strong, readwrite) EVEDBInvGroup* group;
@property (nonatomic, strong, readwrite) NSArray* skills;
@end


@implementation EVEDBCertCertificate
@synthesize description = _description;

+ (NSDictionary*) columnsMap {
	static NSDictionary* map = nil;
	if (!map)
		map = @{@"certID" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"certificateID"},
				@"description" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"description"},
				@"groupid" : @{@"type" : @(EVEDBTypeInt), @"keyPath" : @"groupID"},
				@"name" : @{@"type" : @(EVEDBTypeText), @"keyPath" : @"name"}
				};
	
	return map;
}

+ (id) certCertificateWithCertificateID: (int32_t)certificateID error:(NSError **)errorPtr {
	return [[EVEDBCertCertificate alloc] initWithCertificateID:certificateID error:errorPtr];
}

- (id) initWithCertificateID: (int32_t)certificateID error:(NSError **)errorPtr {
	if (self = [super initWithSQLRequest:[NSString stringWithFormat:@"SELECT * from certCerts WHERE certID=%d;", certificateID]
								   error:errorPtr]) {
	}
	return self;
}

- (EVEDBInvGroup*) group {
	if (self.groupID == 0)
		return nil;
	if (!_group) {
		_group = [EVEDBInvGroup invGroupWithGroupID:self.groupID error:nil];
		if (!_group)
			_group = (EVEDBInvGroup*) [NSNull null];
	}
	if ((NSNull*) _group == [NSNull null])
		return nil;
	else
		return _group;
}

- (NSArray*) skills {
	if (!_skills) {
		NSMutableArray* skills = [[NSMutableArray alloc] initWithCapacity:5];
		for (int i = 0; i < 5; i++)
			[skills addObject:[NSMutableArray new]];
		
		[[EVEDBDatabase sharedDatabase] execSQLRequest:[NSString stringWithFormat:@"SELECT * FROM certSkills where certID=%d", self.certificateID]
										   resultBlock:^(sqlite3_stmt *stmt, BOOL *needsMore) {
											   EVEDBCertSkill* skill = [[EVEDBCertSkill alloc] initWithStatement:stmt];
											   if (skill.certificateLevel >= 0 && skill.certificateLevel <= 4) {
												   [skills[skill.certificateLevel] addObject:skill];
											   }
										   }];
		for (NSMutableArray* array in skills)
			[array sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"skill.typeName" ascending:YES]]];

		_skills = skills;
	}
	return _skills;
}

+ (NSString*) iconImageNameWithMasteryLevel:(int32_t) masteryLevel {
	if (masteryLevel >= -1 && masteryLevel <= 4)
		return [NSString stringWithFormat:@"Icons/icon79_0%d.png", 2 + masteryLevel];
	else
		return @"Icons/icon79_1.png";
}

@end