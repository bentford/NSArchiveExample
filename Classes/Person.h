//
//  Person.h
//  NSArchiveExample
//
//  Created by Ben Ford on 4/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject <NSCoding> {
    NSString *firstName;
    NSString *lastName;
    NSInteger age;
    BOOL isFullTime;
}
@property (nonatomic,retain) NSString *firstName;
@property (nonatomic,retain) NSString *lastName;
@property (nonatomic) NSInteger age;
@property (nonatomic) BOOL isFullTime;

+ (Person *)defaultPerson;
- (id)init;
@end
