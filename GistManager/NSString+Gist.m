//
//  NSString+Gist.m
//  GistManager
//
//  Created by David Keegan on 12/9/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "NSString+Gist.h"

@implementation NSString(Gist)

+ (NSString *)initFromUrl:(NSURL *)url{
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:30];
    
	NSError *error;
	NSURLResponse *response;
	NSData *urlData = [NSURLConnection sendSynchronousRequest:urlRequest
                                            returningResponse:&response
                                                        error:&error];
    
	return [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
}

@end
