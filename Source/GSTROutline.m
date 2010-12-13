//
//  GSTROutline.m
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "AppDelegate.h"
#import <GistManager/GistManager.h>

//from http://www.cocoadev.com/index.pl?NSOutlineViewDataSource
@interface WeakReference : NSObject {
    id parent;
}

+ (id)weakReferenceWithParent:(id)parent;
- (void)setParent:(id)_parent;
- (id)parent;

@end

@implementation WeakReference

+ (id)weakReferenceWithParent:(id)parent{
    id weakRef = [[[WeakReference alloc] init] autorelease];
    [weakRef setParent:parent];
    return weakRef;
}
- (void)setParent:(id)_parent{
    parent = _parent;
}
- (id)parent{
    return parent;
}

@end

@implementation AppDelegate(GSTROutline)

- (NSMutableDictionary *)addItem:(id)item toGroup:(NSMutableDictionary *)group{
    NSMutableDictionary *itemDict = [NSMutableDictionary dictionary];
    id children = [group objectForKey:@"CHILDREN"];
    [children addObject:itemDict];
    if(item){
        [itemDict setObject:item forKey:@"ITEM"];
    }
    if(group){
        [itemDict setObject:[WeakReference weakReferenceWithParent:group] forKey:@"PARENT"];
    }
    return itemDict;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item{
    id children;
    if(!item){
        children = self.dataStore;
    }else{
        children = [item objectForKey:@"CHILDREN"];
    }
    if((!children) || ([children count] < 1)){
        return NO;
    }
    return YES;
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item{
    id children;
    if(!item){
        children = self.dataStore;
    }else{
        children = [item objectForKey:@"CHILDREN"];
    }
    return [children count];
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item{
    id children;
    if(!item){
        children = self.dataStore;
    }else{
        children = [item objectForKey:@"CHILDREN"];
    }
    if((!children) || ([children count] <= index)){
        return nil;
    }
    return [children objectAtIndex:index];
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item{
    return [(Gist *)[item objectForKey:@"ITEM"] repository];
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification{
    Gist *gist = (Gist *)[self.listView itemAtRow:[self.listView selectedRow]];
    NSLog(@"%@", gist);
}

@end
