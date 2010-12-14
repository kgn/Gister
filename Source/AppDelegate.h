//
//  GisterAppDelegate.h
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <GistManager/GistManager.h>
#import "GistView.h"

@interface AppDelegate : NSObject {
    NSWindow *window, *preferencesWindow;
    NSOutlineView *listView;
    GistView *gistView;
    NSArray *gists;
}

@property (assign) IBOutlet NSWindow *window, *preferencesWindow;
@property (assign) IBOutlet NSOutlineView *listView;
@property (assign) IBOutlet GistView *gistView;
@property (nonatomic, retain) NSArray *gists;

- (void)refresh;
- (IBAction)showPreferences:(id)sender;

@end

@interface AppDelegate(GistList)

@end

@interface AppDelegate(Actions)

- (IBAction)refreshAction:(id)sender;
- (IBAction)openGithubAction:(id)sender;

@end
