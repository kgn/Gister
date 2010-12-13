//
//  AppDelegate+GistList.m
//  Gister
//
//  Created by David Keegan on 12/12/10.
//  Copyright 2010 InScopeApps{+}. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate(GistList)

//from http://www.stupendous.net/archives/2009/01/11/nsoutlineview-example/
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item{
    if(item == nil){//root
        return [self.gists count];
    }
    
    return 0;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item{
    return NO;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item{
    if(item == nil){//root
        item = self.gists;
    }
    
    if([item isKindOfClass:[NSArray class]]){
        return [item objectAtIndex:index];
    }else if([item isKindOfClass:[NSDictionary class]]){
        return [item objectForKey:[[item allKeys] objectAtIndex:index]];
    }
    
    return nil;
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item{
    Gist *gist = (Gist*)item;
    NSString *title = [gist.files componentsJoinedByString:@", "];
    return title;
}

- (void)outlineViewSelectionDidChange:(NSNotification *)aNotification{
    if([aNotification name] == NSOutlineViewSelectionDidChangeNotification){
        Gist *gist = (Gist *)[self.listView itemAtRow:[self.listView selectedRow]];
        [self.gistView updateWithGist:gist];
    }
}

@end
