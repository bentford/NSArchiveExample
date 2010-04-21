//
//  BossViewController.h
//  NSArchiveExample
//
//  Created by Ben Ford on 4/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BossViewController : UIViewController {
    IBOutlet UITextField *firstName;
    IBOutlet UITextField *lastName;
    IBOutlet UITextField *age;
    IBOutlet UISwitch *isFullTime;
}

- (IBAction)saveBoss;
- (void)loadBoss;
@end
