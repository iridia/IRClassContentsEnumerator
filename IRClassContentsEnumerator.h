//
//  IRClassContentsEnumerator.h
//  Enumerator
//
//  Created by Evadne Wu on 2/5/11.
//  Copyright 2011 Iridia Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/objc.h>
#import <objc/runtime.h>


@interface IRClassContentsEnumerator : NSObject

- (void) refresh;

@property (nonatomic, readonly, retain) NSArray *sortedListing;

@end
