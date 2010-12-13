//
//  Gist.h
//  GistManager
//
//  Created by David Keegan on 12/9/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gist : NSObject {
    NSDate *created;
    NSString *description, *owner, *repository;
    NSArray *files;
    BOOL public;
    
    NSDictionary *fileCache;
    NSMutableDictionary *textCache;
}

@property (nonatomic, retain) NSDate *created;
@property (nonatomic, copy) NSString *description, *owner, *repository;
@property (nonatomic, retain) NSArray *files;
@property BOOL public;

- (id)initWithDictionary:(NSDictionary *)aDictionary;
- (id)initWithRepository:(NSString *)aRepository;

- (NSArray *)fullURLs;
- (NSString *)textForURL:(NSURL *)url;
- (NSString *)cachedTextForFile:(NSString *)file;

@end
