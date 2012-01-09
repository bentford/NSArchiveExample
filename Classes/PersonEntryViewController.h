//
//  PersonEntryViewController.h
//  NSArchiveExample
//
//  Created by Ben Ford on 4/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PersonEntryViewController : UIViewController {
    IBOutlet UITextField *firstName;
    IBOutlet UITextField *lastName;
    IBOutlet UITextField *age;
    
	IBOutlet UILabel *titleLabel;
}
- (IBAction)savePerson;
- (void)loadBoss;
@end
