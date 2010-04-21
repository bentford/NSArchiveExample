//
//  Persistance.h
//  GuestInfo
//
//  Created by Ben Ford on 10/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Person;
@interface Persistance : NSObject {

    Person *boss;
    NSMutableDictionary *managers;
    NSMutableArray *employees;
}

@property (nonatomic,retain) Person *boss;
@property (nonatomic,retain) NSMutableDictionary *managers;
@property (nonatomic,retain) NSMutableArray *employees;

+ (Persistance*) sharedService;

- (void)loadFromDisk;
- (void)saveToDisk;

+ (NSString *)pathForDocumentsDirectoryFile:(NSString*)filename;

@end
