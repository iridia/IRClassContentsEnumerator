//
//  EnumeratorAppDelegate.m
//  Enumerator
//
//  Created by Evadne Wu on 2/5/11.
//  Copyright 2011 Iridia Productions. All rights reserved.
//

#import "EnumeratorAppDelegate.h"

#import <objc/objc.h>
#import <objc/runtime.h>

@implementation EnumeratorAppDelegate

@synthesize window;

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification {

	[[[IRClassContentsEnumerator alloc] init] autorelease];

}

@end
