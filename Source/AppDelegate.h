//
//  GisterAppDelegate.h
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject {
    NSWindow *window;
    NSMutableArray *dataStore;
    NSOutlineView *listView;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSMutableArray *dataStore;
@property (assign) IBOutlet NSOutlineView *listView;

@end

@interface AppDelegate(GSTROutline)

- (NSMutableDictionary *)addItem:(id)item toGroup:(NSMutableDictionary *)group;

@end
