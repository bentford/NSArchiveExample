//
//  Persistance.m
//  GuestInfo
//
//  Created by Ben Ford on 10/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Persistance.h"
#import "Person.h"

@implementation Persistance
@synthesize boss, dictionary, array;
//taken from apple code example:  
//http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaObjects/CocoaObjects.html#//apple_ref/doc/uid/TP40002974-CH4-SW32

static Persistance *sharedGlobalInstance = nil;

- (id)init {
    self = [super init];

    return self;
}

#pragma mark Singleton
+ (Persistance*) sharedService {
    if( sharedGlobalInstance == nil )
    {
        [[self alloc] init];// assignment not done here
    }
    return sharedGlobalInstance;
}

+ (Persistance*) allocWithZone:(NSZone*)zone {
    @synchronized(self)  {
        if (sharedGlobalInstance == nil) {
            sharedGlobalInstance = [super allocWithZone:zone];
            return sharedGlobalInstance;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (unsigned)retainCount {
    return UINT_MAX;  //denotes an object that cannot be released
}

- (void)release {
    //do nothing
}

- (id)autorelease {
    return self;
}
#pragma mark -

#pragma mark LifeCycle
- (void)loadFromDisk {

    // boss
    NSString *bossFilePath = [Persistance pathForDocumentsDirectoryFile:@"boss.archive"];
    self.boss = [NSKeyedUnarchiver unarchiveObjectWithFile:bossFilePath];

    if( !self.boss ) 
        self.boss = [Person defaultPerson];
    
    
    // managers
    NSString *managerFilePath = [Persistance pathForDocumentsDirectoryFile:@"managers.archive"];
    self.dictionary = [NSKeyedUnarchiver unarchiveObjectWithFile:managerFilePath];
    
    if( !self.dictionary ) 
        self.dictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    
    
    
    // employees
    NSString *employeesFilePath = [Persistance pathForDocumentsDirectoryFile:@"employees.archive"];
    self.array = [NSKeyedUnarchiver unarchiveObjectWithFile:employeesFilePath];
    
    if( !self.array ) 
        self.array = [NSMutableArray arrayWithCapacity:0];
}

- (void)saveToDisk {
    
    NSString *dictionaryFilePath = [Persistance pathForDocumentsDirectoryFile:@"boss.archive"];
    [NSKeyedArchiver archiveRootObject:self.boss toFile:dictionaryFilePath];
    
    NSString *managersFilePath = [Persistance pathForDocumentsDirectoryFile:@"managers.archive"];
    [NSKeyedArchiver archiveRootObject:self.dictionary toFile:managersFilePath];
    
    NSString *arrayFilePath = [Persistance pathForDocumentsDirectoryFile:@"employees.archive"];
    [NSKeyedArchiver archiveRootObject:self.array toFile:arrayFilePath];
    
}

#pragma mark -

#pragma mark helpers
+ (NSString *)pathForDocumentsDirectoryFile:(NSString*)filename { 
    NSArray *paths = NSSearchPathForDirectoriesInDomains( 
                                                         NSDocumentDirectory, NSUserDomainMask, YES); 
    NSString *documentsDirectory = [paths objectAtIndex:0]; 
    return [documentsDirectory stringByAppendingPathComponent:filename]; 
}
#pragma mark -

- (void)dealloc {
    self.boss = nil;
    self.dictionary = nil;
    self.array = nil;
    
    [super dealloc];
}
@end
