//
//  EVECorpStandings.m
//  EVEOnlineAPI
//
//  Created by Артем Шиманский on 11.08.15.
//
//

#import "EVECorpStandings.h"

@implementation EVECorpStandings

+ (NSDictionary*) scheme {
	static NSDictionary* scheme = nil;
	if (!scheme)
		scheme = @{@"corporationNPCStandings":@{@"type":@(EVEXMLSchemePropertyTypeObject), @"class":[EVEStandingsNPCStandings class]}};
	
	return scheme;
}

@end
