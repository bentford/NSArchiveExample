//
//  BossViewController.m
//  NSArchiveExample
//
//  Created by Ben Ford on 4/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BossViewController.h"
#import "Model.h"

@implementation BossViewController

- (void)awakeFromNib {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadBoss];    
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
    [age resignFirstResponder];
}

- (void)loadBoss {
    firstName.text = [Persistance sharedService].boss.firstName;
    lastName.text = [Persistance sharedService].boss.lastName;
    age.text = [NSString stringWithFormat:@"%d",[Persistance sharedService].boss.age];
    [isFullTime setOn:[Persistance sharedService].boss.isFullTime animated:NO];
}

- (IBAction)saveBoss {
    
    [Persistance sharedService].boss.firstName = firstName.text;
    [Persistance sharedService].boss.lastName = lastName.text;
    [Persistance sharedService].boss.age = [age.text intValue];
    [Persistance sharedService].boss.isFullTime = isFullTime.on;
}
@end
