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
        self.age = [coder decodeIntForKey:@"age"];
        self.isFullTime = [coder decodeBoolForKey:@"isFullTime"];        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.firstName forKey:@"firstName"];
    [coder encodeObject:self.firstName forKey:@"lastName"];    
    [coder encodeInt:self.age forKey:@"age"];
    [coder encodeBool:self.isFullTime forKey:@"isFullTime"]; 
}
#pragma mark -

- (NSString *)fullName {
	return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (void)dealloc {
    self.firstName = nil;
    self.lastName = nil;
    [super dealloc];
}
@end
