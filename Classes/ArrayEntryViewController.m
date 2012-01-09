//
//  ArrayEntryViewController.m
//  NSArchiveExample
//
//  Created by Ben Ford on 4/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ArrayEntryViewController.h"
#import "Persistance.h"
#import "NSArray+Ext.h"

@implementation ArrayEntryViewController

- (void)viewWillAppear:(BOOL)animated {
	[self loadData];
}

- (void)loadData {
	value1.text = [[Persistance sharedService].array extObjectAtIndexOrNil:0];
	value2.text = [[Persistance sharedService].array extObjectAtIndexOrNil:1];
	value3.text = [[Persistance sharedService].array extObjectAtIndexOrNil:2];
	value4.text = [[Persistance sharedService].array extObjectAtIndexOrNil:3];
}

- (IBAction)save {
	// taking the short route
	[[Persistance sharedService].array removeAllObjects];
	
	[[Persistance sharedService].array insertObject:value1.text atIndex:0];
	[[Persistance sharedService].array insertObject:value2.text atIndex:1];
	[[Persistance sharedService].array insertObject:value3.text atIndex:2];
	[[Persistance sharedService].array insertObject:value4.text atIndex:3];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[value1 resignFirstResponder];
	[value2 resignFirstResponder];
	[value3 resignFirstResponder];
	[value4 resignFirstResponder];
}

- (void)dealloc {
    [super dealloc];
}


@end
