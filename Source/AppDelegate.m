//
//  GisterAppDelegate.m
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "Prefs.h"
#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window, preferencesWindow;
@synthesize listView;
@synthesize gistView;
@synthesize gists;

+ (void)initialize{
    if([self class] == [AppDelegate class]){
        [Prefs registerUserDefaults];
    }
}

- (void)prefsChanged:(NSNotification *)aNotification{
    if([aNotification name] == NSUserDefaultsDidChangeNotification){
        [self refresh];
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    [self refresh];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(prefsChanged:)
                                                 name:NSUserDefaultsDidChangeNotification 
                                               object:nil];
}

- (void)refresh{
    self.gists = [Gists gistsFromUser:GistPrefUserNameValue];
    [self.listView reloadData];
}

- (IBAction)showPreferences:(id)sender{
    [self.preferencesWindow makeKeyAndOrderFront:self];
}

@end
