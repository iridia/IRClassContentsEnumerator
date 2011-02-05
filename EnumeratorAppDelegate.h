//
//  EnumeratorAppDelegate.h
//  Enumerator
//
//  Created by Evadne Wu on 2/5/11.
//  Copyright 2011 Iridia Productions. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "IRClassContentsEnumerator.h"

@interface EnumeratorAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
