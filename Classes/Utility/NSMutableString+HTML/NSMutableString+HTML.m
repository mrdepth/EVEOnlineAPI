//
//  NSMutableString+HTMLEscape.m
//  EscapeSequences
//
//  Created by Artem Shimanski on 1/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSMutableString+HTML.h"
#import <UIKit/UIKit.h>

const unichar codes[241];
const char *sequences[241];

NSMutableDictionary *sequencesMap = nil;

@implementation NSMutableString(HTML)

- (void) loadSequencesMap {
	sequencesMap = [[NSMutableDictionary alloc] init];
	int n = sizeof(codes) / sizeof(unichar);
	unichar symbol[2] = {0,0};
	symbol[0] = 8743;
	for (int i = 0; i < n; i++) {
		symbol[0] = codes[i];
		[sequencesMap setValue:[NSString stringWithCharacters:symbol length:1] forKey:[NSString stringWithUTF8String:sequences[i]]];
	}
	return;
}

- (void) replaceHTMLEscapes {
	if (!sequencesMap)
		[self loadSequencesMap];
	NSRange findStartRange = NSMakeRange(0, self.length);
	NSRange startRange = [self rangeOfString:@"&" options:0 range:findStartRange];

	while (startRange.location != NSNotFound) {
		NSRange findEndRange = NSMakeRange(startRange.location + 1, 10 < self.length - startRange.location - 1 ? 10 : self.length - startRange.location - 1);
		NSRange endRange = [self rangeOfString:@";" options:0 range:findEndRange];

		if (endRange.location != NSNotFound) {
			NSString *entity = [self substringWithRange:NSMakeRange(startRange.location + 1, endRange.location - startRange.location - 1)];
			if ([entity characterAtIndex:0] == '#') {
				unichar symbol = [[entity substringWithRange:NSMakeRange(1, entity.length - 1)] intValue];
				[self replaceCharactersInRange:NSMakeRange(startRange.location, endRange.location + endRange.length - startRange.location) withString:[NSString stringWithCharacters:&symbol length:1]];
				findStartRange.location++;
				findStartRange.length = self.length - findStartRange.location;
			}
			else {
				NSString *s = [sequencesMap valueForKey:entity];
				if (s)
					[self replaceCharactersInRange:NSMakeRange(startRange.location, endRange.location + endRange.length - startRange.location) withString:s];
				findStartRange.location++;
				findStartRange.length = self.length - findStartRange.location;
			}
		}
		else
			findStartRange = NSMakeRange(findEndRange.location + findEndRange.length, self.length - (findEndRange.location + findEndRange.length));
		startRange = [self rangeOfString:@"&" options:0 range:findStartRange];
	}
	
	findStartRange = NSMakeRange(0, self.length);
	startRange = [self rangeOfString:@"\\u" options:0 range:findStartRange];

	while (startRange.location != NSNotFound) {
		startRange.length += 4;
		if (startRange.location + startRange.length < self.length) {
			unichar uc = 0;
			
			int n = (int) (startRange.location + startRange.length);
			if (n >= self.length)
				n = (int)(self.length - 1);
			
			for (int i = (int)(startRange.location + 2); i < n; i++) {
				int v = 0;
				char c = [self characterAtIndex:i];
				if (c >= '0' && c <= '9')
					v = c - '0';
				else if (c >= 'a' && c <= 'f')
					v = c - 'a' + 10;
				else if (c >= 'A' && c <= 'F')
					v = c - 'A' + 10;
				uc <<= 4;
				uc += v;
			}
			
			[self replaceCharactersInRange:startRange withString:[NSString stringWithCharacters:&uc length:1]];
		}
		startRange = [self rangeOfString:@"\\u" options:0 range:NSMakeRange(startRange.location + 1, self.length - startRange.location - 1)];
	}
}

- (void) removeHTMLTags {
	NSRange findStartRange = NSMakeRange(0, self.length);
	NSRange startRange = [self rangeOfString:@"<" options:0 range:findStartRange];
	
	while (startRange.location != NSNotFound) {
		NSRange findEndRange = NSMakeRange(startRange.location + 1, self.length - startRange.location - 1);
		NSRange endRange = [self rangeOfString:@">" options:0 range:findEndRange];
		if (endRange.location == NSNotFound)
			break;
		else {
			NSString *tag = [self substringWithRange:NSMakeRange(startRange.location + 1, 2 < endRange.location - startRange.location - 1 ? 2 : endRange.location - startRange.location - 1)];
			NSString *replaceString;
			if ([tag compare:@"br" options:NSCaseInsensitiveSearch] == NSOrderedSame || [tag compare:@"/p" options:NSCaseInsensitiveSearch] == NSOrderedSame)
				replaceString = @"\n";
			else
				replaceString = @"";
			[self replaceCharactersInRange:NSMakeRange(startRange.location, endRange.location - startRange.location + 1) withString:replaceString];
			findStartRange.location = findStartRange.location + replaceString.length;
			findStartRange.length = self.length - findStartRange.location;
			startRange = [self rangeOfString:@"<" options:0 range:findStartRange];
		}
	}
}

- (void) unescapeHTML {
	NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:@"&(.*?);" options:0 error:nil];
	NSTextCheckingResult* result;
	while ((result = [expression firstMatchInString:self options:0 range:NSMakeRange(0, self.length)]) != nil) {
		NSString* escape = [self substringWithRange:result.range];
		[self replaceCharactersInRange:result.range withString:[[NSAttributedString alloc] initWithData:[escape dataUsingEncoding:NSUTF8StringEncoding] options:@{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) }
																				  documentAttributes:nil
																							   error:nil].string];
	}
	
	
	expression = [NSRegularExpression regularExpressionWithPattern:@"\\\\u(.{4})"
														   options:NSRegularExpressionCaseInsensitive
															 error:nil];
	while ((result = [expression firstMatchInString:self options:0 range:NSMakeRange(0, self.length)]) != nil) {
		NSScanner* scanner = [NSScanner scannerWithString:[self substringWithRange:result.range]];
		unsigned int i = ' ';
		unichar *u = (unichar*) &i;
		[scanner scanHexInt:&i];
		
		[self replaceCharactersInRange:result.range withString:[NSString stringWithCharacters:u length:1]];
	}
	
	[self replaceOccurrencesOfString:@"\\r" withString:@"" options:0 range:NSMakeRange(0, self.length)];
	[self replaceOccurrencesOfString:@"\\n" withString:@"\n" options:0 range:NSMakeRange(0, self.length)];
	[self replaceOccurrencesOfString:@"\\t" withString:@"\t" options:0 range:NSMakeRange(0, self.length)];
}

@end

const unichar codes[] = {
	34,
	39,
	38,
	60,
	62,
	160,
	161,
	162,
	163,
	164,
	165,
	166,
	167,
	168,
	169,
	170,
	171,
	172,
	173,
	174,
	175,
	176,
	177,
	178,
	179,
	180,
	181,
	182,
	183,
	184,
	185,
	186,
	187,
	188,
	189,
	190,
	191,
	215,
	247,
	192,
	193,
	194,
	195,
	196,
	197,
	198,
	199,
	200,
	201,
	202,
	203,
	204,
	205,
	206,
	207,
	208,
	209,
	210,
	211,
	212,
	213,
	214,
	216,
	217,
	218,
	219,
	220,
	221,
	222,
	223,
	224,
	225,
	226,
	227,
	228,
	229,
	230,
	231,
	232,
	233,
	234,
	235,
	236,
	237,
	238,
	239,
	240,
	241,
	242,
	243,
	244,
	245,
	246,
	248,
	249,
	250,
	251,
	252,
	253,
	254,
	255,
	8704,
	8706,
	8707,
	8709,
	8711,
	8712,
	8713,
	8715,
	8719,
	8721,
	8722,
	8727,
	8730,
	8733,
	8734,
	8736,
	8743,
	8744,
	8745,
	8746,
	8747,
	8756,
	8764,
	8773,
	8776,
	8800,
	8801,
	8804,
	8805,
	8834,
	8835,
	8836,
	8838,
	8839,
	8853,
	8855,
	8869,
	8901,
	913,
	914,
	915,
	916,
	917,
	918,
	919,
	920,
	921,
	922,
	923,
	924,
	925,
	926,
	927,
	928,
	929,
	931,
	932,
	933,
	934,
	935,
	936,
	937,
	945,
	946,
	947,
	948,
	949,
	950,
	951,
	952,
	953,
	954,
	955,
	956,
	957,
	958,
	959,
	960,
	961,
	962,
	963,
	964,
	965,
	966,
	967,
	968,
	969,
	977,
	978,
	982,
	338,
	339,
	352,
	353,
	376,
	402,
	710,
	732,
	8194,
	8195,
	8201,
	8204,
	8205,
	8206,
	8207,
	8211,
	8212,
	8216,
	8217,
	8218,
	8220,
	8221,
	8222,
	8224,
	8225,
	8226,
	8230,
	8240,
	8242,
	8243,
	8249,
	8250,
	8254,
	8364,
	8482,
	8592,
	8593,
	8594,
	8595,
	8596,
	8629,
	8968,
	8969,
	8970,
	8971,
	9674,
	9824,
	9827,
	9829,
	9830	
};

const char *sequences[] = {
	"quot",
	"apos",
	"amp",
	"lt",
	"gt",
	"nbsp",
	"iexcl",
	"cent",
	"pound",
	"curren",
	"yen",
	"brvbar",
	"sect",
	"uml",
	"copy",
	"ordf",
	"laquo",
	"not",
	"shy",
	"reg",
	"macr",
	"deg",
	"plusmn",
	"sup2",
	"sup3",
	"acute",
	"micro",
	"para",
	"middot",
	"cedil",
	"sup1",
	"ordm",
	"raquo",
	"frac14",
	"frac12",
	"frac34",
	"iquest",
	"times",
	"divide",
	"Agrave",
	"Aacute",
	"Acirc",
	"Atilde",
	"Auml",
	"Aring",
	"AElig",
	"Ccedil",
	"Egrave",
	"Eacute",
	"Ecirc",
	"Euml",
	"Igrave",
	"Iacute",
	"Icirc",
	"Iuml",
	"ETH",
	"Ntilde",
	"Ograve",
	"Oacute",
	"Ocirc",
	"Otilde",
	"Ouml",
	"Oslash",
	"Ugrave",
	"Uacute",
	"Ucirc",
	"Uuml",
	"Yacute",
	"THORN",
	"szlig",
	"agrave",
	"aacute",
	"acirc",
	"atilde",
	"auml",
	"aring",
	"aelig",
	"ccedil",
	"egrave",
	"eacute",
	"ecirc",
	"euml",
	"igrave",
	"iacute",
	"icirc",
	"iuml",
	"eth",
	"ntilde",
	"ograve",
	"oacute",
	"ocirc",
	"otilde",
	"ouml",
	"oslash",
	"ugrave",
	"uacute",
	"ucirc",
	"uuml",
	"yacute",
	"thorn",
	"yuml",
	"forall",
	"part",
	"exist",
	"empty",
	"nabla",
	"isin",
	"notin",
	"ni",
	"prod",
	"sum",
	"minus",
	"lowast",
	"radic",
	"prop",
	"infin",
	"ang",
	"and",
	"or",
	"cap",
	"cup",
	"int",
	"there4",
	"sim",
	"cong",
	"asymp",
	"ne",
	"equiv",
	"le",
	"ge",
	"sub",
	"sup",
	"nsub",
	"sube",
	"supe",
	"oplus",
	"otimes",
	"perp",
	"sdot",
	"Alpha",
	"Beta",
	"Gamma",
	"Delta",
	"Epsilon",
	"Zeta",
	"Eta",
	"Theta",
	"Iota",
	"Kappa",
	"Lambda",
	"Mu",
	"Nu",
	"Xi",
	"Omicron",
	"Pi",
	"Rho",
	"Sigma",
	"Tau",
	"Upsilon",
	"Phi",
	"Chi",
	"Psi",
	"Omega",
	"alpha",
	"beta",
	"gamma",
	"delta",
	"epsilon",
	"zeta",
	"eta",
	"theta",
	"iota",
	"kappa",
	"lambda",
	"mu",
	"nu",
	"xi",
	"omicron",
	"pi",
	"rho",
	"sigmaf",
	"sigma",
	"tau",
	"upsilon",
	"phi",
	"chi",
	"psi",
	"omega",
	"thetasym",
	"upsih",
	"piv",
	"OElig",
	"oelig",
	"Scaron",
	"scaron",
	"Yuml",
	"fnof",
	"circ",
	"tilde",
	"ensp",
	"emsp",
	"thinsp",
	"zwnj",
	"zwj",
	"lrm",
	"rlm",
	"ndash",
	"mdash",
	"lsquo",
	"rsquo",
	"sbquo",
	"ldquo",
	"rdquo",
	"bdquo",
	"dagger",
	"Dagger",
	"bull",
	"hellip",
	"permil",
	"prime",
	"Prime",
	"lsaquo",
	"rsaquo",
	"oline",
	"euro",
	"trade",
	"larr",
	"uarr",
	"rarr",
	"darr",
	"harr",
	"crarr",
	"lceil",
	"rceil",
	"lfloor",
	"rfloor",
	"loz",
	"spades",
	"clubs",
	"hearts",
	"diams"	
};