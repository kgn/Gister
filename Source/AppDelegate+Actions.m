//
//  AppDelegate+Actions.m
//  Gister
//
//  Created by David Keegan on 12/13/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate(Actions)

- (IBAction)refreshAction:(id)sender{
    [self refresh];
}

- (IBAction)openGithubAction:(id)sender{
    [self.gistView.gist openRepositoryURL];
}

- (BOOL)validateUserInterfaceItem:(id<NSValidatedUserInterfaceItem>)anItem{
    SEL action = [anItem action];
    if(action == @selector(openGithubAction:)){
        return (self.gistView.gist != nil);
    }
    return YES;
}

@end
