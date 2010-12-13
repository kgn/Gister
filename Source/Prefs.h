//
//  Prefs.h
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define GistPrefUserNameKey @"username"
#define GistPrefUserNameValue [[NSUserDefaults standardUserDefaults] valueForKey:GistPrefUserNameKey]

@interface Prefs : NSObject {}

+ (void)registerUserDefaults;

@end
