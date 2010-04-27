//
//  ArrayEntryViewController.h
//  NSArchiveExample
//
//  Created by Ben Ford on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ArrayEntryViewController : UIViewController {
	IBOutlet UITextField *value1;
	IBOutlet UITextField *value2;
	IBOutlet UITextField *value3;
	IBOutlet UITextField *value4;
}
- (void)loadData;
- (IBAction)save;
@end
