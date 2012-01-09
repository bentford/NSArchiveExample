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

#pragma mark UIApplicationDelegate
- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    [[Persistance sharedService] loadFromDisk];
    
    [window makeKeyAndVisible];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
     [[Persistance sharedService] saveToDisk];    
}

- (void)applicationWillTerminate:(UIApplication *)application {
     [[Persistance sharedService] saveToDisk];
}
#pragma mark -

- (void)dealloc {
    [tabBar release];
    [window release];
    [super dealloc];
}


@end
