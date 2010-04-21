//
//  NSArchiveExampleAppDelegate.h
//  NSArchiveExample
//
//  Created by Ben Ford on 4/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSArchiveExampleViewController;

@interface NSArchiveExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UITabBarController *tabBar;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBar;

@end

