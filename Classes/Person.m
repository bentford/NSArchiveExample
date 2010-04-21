//
//  Person.m
//  NSArchiveExample
//
//  Created by Ben Ford on 4/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person
@synthesize firstName, lastName, age, isFullTime;
+ (Person *)defaultPerson {
    return [[[Person alloc] init] autorelease];
}

- (id)init {
    if( self = [super init] ) {
        self.firstName = [NSString string];
        self.lastName = [NSString string];
        self.age = 0;
        self.isFullTime = YES;
    }
    return self;
}

#pragma mark NSCoding
- (id)initWithCoder:(NSCoder *)coder { 
    self = [super init];
    if( self ) {
        self.firstName = [coder decodeObjectForKey:@"firstName"];
        self.lastName = [coder decodeObjectForKey:@"lastName"];
        self.age = [[coder decodeObjectForKey:@"age"] intValue];
        self.age = [[coder decodeObjectForKey:@"isFullTime"] boolValue];        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.firstName forKey:@"firstName"];
    [coder encodeObject:self.firstName forKey:@"firstName"];    
    [coder encodeObject:[NSNumber numberWithInt:self.age] forKey:@"age"];
    [coder encodeObject:[NSNumber numberWithInt:self.isFullTime] forKey:@"isFullTime"]; 
}
#pragma mark -


- (void)dealloc {
    self.firstName = nil;
    self.lastName = nil;
    [super dealloc];
}
@end
