//
//  GistView.m
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "GistView.h"
//#import <OkudaKit/OkudaKit.h>

@implementation GistView

@synthesize gist;
@synthesize textView;
@synthesize description;

- (void)awakeFromNib{
    [[self.description cell] setBackgroundStyle:NSBackgroundStyleRaised];
    self.description.stringValue = @"";
    
    //don't wordwrap the text view
    [self.textView setEditable:NO];
    [[self.textView textContainer] setContainerSize:NSMakeSize(FLT_MAX, FLT_MAX)];
    [[self.textView textContainer] setWidthTracksTextView:NO];
    [self.textView setHorizontallyResizable:YES];
}

- (void)updateWithGist:(Gist *)aGist{
    self.gist = aGist;
    NSString *rawString = [self.gist cachedTextForFile:[self.gist.files objectAtIndex:0]];
    //NSAttributedString *highlightedString = [[OKSyntaxHighlighter syntaxHighlighter] highlightedStringForString:rawString ofGrammar:@"json"];
    NSDictionary *attributes = [[NSDictionary alloc] initWithObjectsAndKeys:
                                [NSFont fontWithName:@"Monaco" size:10], NSFontAttributeName,
                                //[NSColor whiteColor], NSForegroundColorAttributeName, 
                                nil];
    NSAttributedString *highlightedString = [[NSAttributedString alloc] initWithString:rawString attributes:attributes];
    [[self.textView textStorage] setAttributedString:highlightedString];
    
    self.description.stringValue = self.gist.description;
}

- (IBAction)copyFile:(id)sender{
    NSString *rawString = [self.gist cachedTextForFile:[self.gist.files objectAtIndex:0]];
    
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    [pasteboard declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:nil];
    [pasteboard setString:rawString forType:NSStringPboardType];    
}

- (IBAction)saveFile:(id)sender{
    NSSavePanel *savePanel = [NSSavePanel savePanel];
#if MAC_OS_X_VERSION_10_6 && MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_6    
    if([savePanel respondsToSelector:@selector(setNameFieldStringValue:)]){
        [savePanel setNameFieldStringValue:[self.gist.files objectAtIndex:0]];
    }
#endif    
    if([savePanel runModal] == NSOKButton){
        NSError *error;
        NSString *rawString = [self.gist cachedTextForFile:[self.gist.files objectAtIndex:0]];
        NSString *selectedFile = [savePanel filename];
        [rawString writeToFile:selectedFile atomically:YES encoding:NSUTF8StringEncoding error:&error];
    }         
}

@end
