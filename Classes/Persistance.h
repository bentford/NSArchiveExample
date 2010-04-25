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
    NSMutableDictionary *dictionary;
    NSMutableArray *array;
}

@property (nonatomic,retain) Person *boss;
@property (nonatomic,retain) NSMutableDictionary *dictionary;
@property (nonatomic,retain) NSMutableArray *array;

+ (Persistance*) sharedService;

- (void)loadFromDisk;
- (void)saveToDisk;

+ (NSString *)pathForDocumentsDirectoryFile:(NSString*)filename;

@end
