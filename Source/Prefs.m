//
//  Prefs.m
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "Prefs.h"

@implementation Prefs

+ (void)registerUserDefaults{
    NSDictionary *userDefaultsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                            @"inscopeapps", GistPrefUserNameKey, 
                                            nil];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsDictionary];
}

@end
