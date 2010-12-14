//
//  Git.h
//  Gister
//
//  Created by David Keegan on 12/14/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Git : NSObject {
    NSString *gitPath;
}

+ (NSString *)commandLineCallWithPath:(NSString *)path andArgs:(NSArray *)args;

- (NSString *)username;

@end
