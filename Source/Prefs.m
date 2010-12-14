//
//  Prefs.m
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "Prefs.h"
#import "Git.h"

@implementation Prefs

+ (void)registerUserDefaults{
    Git *git = [[Git alloc] init];
    NSDictionary *userDefaultsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [git username], GistPrefUserNameKey, 
                                            nil];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsDictionary];
}

@end
