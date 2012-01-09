//
//  NSArray+Ext.m
//  Virgin Health Miles Mobile App
//
//  Created by Ben Ford on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Ext.h"

@implementation NSArray(Ext)
- (id)extObjectAtIndexOrNil:(NSUInteger)theIndex {
    if( [self count] >= theIndex + 1)
        return [self objectAtIndex:theIndex];
    else
        return nil;
}
@end
