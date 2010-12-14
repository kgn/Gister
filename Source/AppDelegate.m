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

@synthesize window;
@synthesize listView;
@synthesize gistView;
@synthesize gists;

+ (void)initialize{
    if([self class] == [AppDelegate class]){
        [Prefs registerUserDefaults];
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    [self refresh];
}

- (void)refresh{
    self.gists = [Gists gistsFromUser:GistPrefUserNameValue];
    [self.listView reloadData];    
}

@end
