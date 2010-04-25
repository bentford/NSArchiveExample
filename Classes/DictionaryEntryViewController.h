//
//  DictionaryEntryViewController.h
//  NSArchiveExample
//
//  Created by Ben Ford on 4/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DictionaryEntryViewController : UIViewController {
	IBOutlet UITextField *key1;
	IBOutlet UITextField *value1;
	IBOutlet UITextField *key2;
	IBOutlet UITextField *value2;
}
- (IBAction)save;
- (void)loadData;
@end
