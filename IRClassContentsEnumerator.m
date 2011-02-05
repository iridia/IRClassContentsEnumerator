//
//  IRClassContentsEnumerator.m
//  Enumerator
//
//  Created by Evadne Wu on 2/5/11.
//  Copyright 2011 Iridia Productions. All rights reserved.
//

#import "IRClassContentsEnumerator.h"


@interface IRClassContentsEnumerator ()

@property (nonatomic, readwrite, retain) NSArray *sortedListing;

@end





@implementation IRClassContentsEnumerator

@synthesize allClassesToMethodSignatureStrings;

- (id) init {

	self = [super init];
	if (!self) return nil;
	
	self.sortedListing = nil;
	
	[self refresh];
	
	return self;

}

- (void) refresh {

	NSMutableArray *everyMethodString = [NSMutableArray array];

	int numClasses = objc_getClassList(NULL, 0);
	Class *classes = malloc(sizeof(Class) * numClasses);
	objc_getClassList(classes, numClasses);
	
	NSString * (^format)() = ^ (BOOL isClassMethod, Class aClass, Method aMethod) {
	
		return (NSString *)[NSString stringWithFormat:@"%@[%@ %@]",
		
			(isClassMethod ? @"+" : @"-"),
			NSStringFromClass(aClass),
			NSStringFromSelector(method_getName(aMethod))
		
		];
	
	};
	
	int i = 0;
	for (i = 0; i < numClasses; i++) {
	
		Class class = classes[i];
		
		unsigned int classMethodsCount;
		unsigned int instanceMethodsCount;
		
		Method* classMethods = class_copyMethodList(object_getClass(class), &classMethodsCount);
		Method* instanceMethods = class_copyMethodList(class, &instanceMethodsCount);
		
		NSString *className = NSStringFromClass(class);
		NSMutableArray *results = [NSMutableArray arrayWithCapacity:(classMethodsCount + instanceMethodsCount)];
		
		while (classMethodsCount--)
		[results addObject:format(YES, class, classMethods[classMethodsCount])];
		
		while (instanceMethodsCount--)
		[results addObject:format(NO, class, instanceMethods[instanceMethodsCount])];
		
		free(classMethods);
		free(instanceMethods);
		
		[everyMethodString addObjectsFromArray:results];
				
	}
	
	self.allClassesToMethodSignatureStrings = [[workingDictionary copy] autorelease];
	
	[everyMethodString sortUsingComparator: ^ (id lhs, id rhs) { 
	
		NSUInteger lhsLength = [lhs length], rhsLength = [rhs length];
	
		return (NSComparisonResult)(
		
			(lhsLength < rhsLength) ? NSOrderedDescending :
			(lhsLength > rhsLength) ? NSOrderedAscending :
			(lhsLength == rhsLength) ? NSOrderedSame : NSOrderedSame
			
		);
		
	}];
	
	self.sortedListing = [[everyMethodString copy] autorelease];
	
	NSLog(@"self.sortedListing %@", self.sortedListing);
	
}

@end
