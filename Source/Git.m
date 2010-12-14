//
//  Git.m
//  Gister
//
//  Created by David Keegan on 12/14/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "Git.h"

@implementation Git

+ (NSString *)commandLineCallWithPath:(NSString *)path andArgs:(NSArray *)args{
    NSTask *task = [[NSTask alloc] init];
    [task setCurrentDirectoryPath:@"/tmp"];
    [task setEnvironment:[[NSProcessInfo processInfo] environment]];
    [task setLaunchPath:path];
    [task setArguments:args];
    
    NSPipe *filePipe = [NSPipe pipe];
    [task setStandardOutput:filePipe];
    //[task setStandardError:filePipe];
    
    NSFileHandle *file = [filePipe fileHandleForReading];
    [task launch];
    
    NSData *data = [file readDataToEndOfFile];
    [task waitUntilExit];
    
    [task release];
    [file closeFile];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

//from gitx
+ (NSArray *)searchLocations{
	NSMutableArray *locations = [NSMutableArray arrayWithObjects:@"/opt/local/bin/git",
                 @"/sw/bin/git",
                 @"/opt/git/bin/git",
                 @"/usr/local/bin/git",
                 @"/usr/local/git/bin/git",
                 nil];
    
	[locations addObject:[@"~/bin/git" stringByExpandingTildeInPath]];
	return locations;
}

- (NSString *)findGitPath{
    //try the enviorment variable
    char *path = getenv("GIT_PATH");
    if(path){
        return [NSString stringWithCString:path encoding:NSUTF8StringEncoding];
    }
    
    //try which
    NSString *whichPath = [Git commandLineCallWithPath:@"/usr/bin/which" andArgs:[NSArray arrayWithObject:@"git"]];
    if(whichPath && ![whichPath isEqualToString:@""]){
        return whichPath;
    }
    
    //try seach location
    NSFileManager *fileManager = [NSFileManager defaultManager];
    for(NSString *location in [Git searchLocations]){
        if([fileManager fileExistsAtPath:location]){
            return location;
        }
	}
    
    return nil;
}

- (id)init{
    self = [super init];
    if (self != nil) {
        gitPath = [[self findGitPath] retain];
        NSLog(@"%@", gitPath);
    }
    return self;
}


- (NSString *)username{
    //try to get the github username
    NSString *gitname = [Git commandLineCallWithPath:gitPath andArgs:
                          [NSArray arrayWithObjects:@"config", @"--global", @"github.user", nil]];
    if(gitname && ![gitname isEqualToString:@""]){
        return gitname;
    }
    
    //try to get the git username
    NSString *username = [Git commandLineCallWithPath:gitPath andArgs:
            [NSArray arrayWithObjects:@"config", @"--global", @"user.name", nil]];
    if(username && ![username isEqualToString:@""]){
        return username;
    }
    
    return nil;
}

@end
