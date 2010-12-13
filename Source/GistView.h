//
//  GistView.h
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <GistManager/GistManager.h>

@interface GistView : NSView {
    Gist *gist;
    NSTextView *textView;
    NSTextField *description;
}

@property (nonatomic, retain) Gist *gist;
@property (assign) IBOutlet NSTextView *textView;
@property (assign) IBOutlet NSTextField *description;

- (void)updateWithGist:(Gist *)aGist;

- (IBAction)copyFile:(id)sender;
- (IBAction)saveFile:(id)sender;

@end
