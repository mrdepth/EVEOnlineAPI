//
//  EVEDBChrRace.h
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 09.06.14.
//
//

#import "EVEDBObject.h"

@interface EVEDBChrRace: EVEDBObject
@property (nonatomic, assign) int32_t raceID;
@property (nonatomic, strong) NSString* raceName;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, assign) int32_t iconID;
@property (nonatomic, strong) NSString* shortDescription;

@end