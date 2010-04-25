    //
//  PersonEntryViewController.m
//  NSArchiveExample
//
//  Created by Ben Ford on 4/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PersonEntryViewController.h"
#import "Model.h"

@implementation PersonEntryViewController
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
    [age resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadBoss];    
}

- (void)loadBoss {
    firstName.text = [Persistance sharedService].boss.firstName;
    lastName.text = [Persistance sharedService].boss.lastName;
    age.text = [NSString stringWithFormat:@"%d",[Persistance sharedService].boss.age];
    [isFullTime setOn:[Persistance sharedService].boss.isFullTime animated:NO];
}

- (IBAction)savePerson {
	
    [Persistance sharedService].boss.firstName = firstName.text;
    [Persistance sharedService].boss.lastName = lastName.text;
    [Persistance sharedService].boss.age = [age.text intValue];
    [Persistance sharedService].boss.isFullTime = isFullTime.on;
}

- (void)dealloc {
    [super dealloc];
}


@end
