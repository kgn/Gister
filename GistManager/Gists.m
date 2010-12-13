//
//  Gists.m
//  GistManager
//
//  Created by David Keegan on 12/8/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "Gists.h"
#import "Gist.h"
#import "NSString+Gist.h"
#import <JSON/JSON.h>

@implementation Gists

+ (NSArray *)gistsFromUser:(NSString *)user{
    NSError *error;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://gist.github.com/api/v1/json/gists/%@", user]];
    NSDictionary *data = (NSDictionary *)[[SBJsonParser alloc] objectWithString:[NSString initFromUrl:url] error:&error];
    
    NSMutableArray *gists = [[NSMutableArray alloc] init];
    NSAutoreleasePool *pool =  [[NSAutoreleasePool alloc] init];
    for(NSDictionary *gist in [data objectForKey:@"gists"]){
        //TODO: fix the date
        Gist *testgist = [[Gist alloc] initWithDictionary:gist];
        NSLog(@"%@", testgist.created);
        [gists addObject:[[Gist alloc] initWithDictionary:gist]];
    }
    [pool drain];
    
    return gists;
}

@end
