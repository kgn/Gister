//
//  GisterAppDelegate.m
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "Prefs.h"
#import "AppDelegate.h"
#import <GistManager/GistManager.h>

@implementation AppDelegate

@synthesize window;
@synthesize dataStore;
@synthesize listView;

+ (void)initialize{
    if([self class] == [AppDelegate class]){
        [Prefs registerUserDefaults];
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
}

-(void)awakeFromNib{
    self.dataStore = [[NSMutableArray array]  retain];
    NSArray *gists = [Gists gistsFromUser:GistPrefUserNameValue];
    for(Gist *gist in gists){
        [self.dataStore addObject:[self addItem:gist toGroup:nil]];
    }
    [self.listView reloadData];
}

@end
