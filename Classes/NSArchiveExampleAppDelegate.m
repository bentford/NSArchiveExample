//
//  NSArchiveExampleAppDelegate.m
//  NSArchiveExample
//
//  Created by Ben Ford on 4/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "NSArchiveExampleAppDelegate.h"
#import "Persistance.h"

@implementation NSArchiveExampleAppDelegate

@synthesize window;
@synthesize tabBar;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    [[Persistance sharedService] loadFromDisk];
    
    [window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
     [[Persistance sharedService] saveToDisk];
}

- (void)dealloc {
    [tabBar release];
    [window release];
    [super dealloc];
}


@end
