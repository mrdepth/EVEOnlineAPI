//
//  NSMutableString+HTMLEscape.h
//  EscapeSequences
//
//  Created by Artem Shimanski on 1/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableString(HTML)

- (void) replaceHTMLEscapes;
- (void) removeHTMLTags;
- (void) unescapeHTML;

@end
