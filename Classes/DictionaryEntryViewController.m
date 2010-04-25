//
//  DictionaryEntryViewController.m
//  NSArchiveExample
//
//  Created by Ben Ford on 4/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DictionaryEntryViewController.h"
#import "Model.h"

@implementation DictionaryEntryViewController

- (void)viewDidLoad {
	[self loadData];
}

- (void)loadData {
	
	// check if the dictionary has enough entries, if it does, load it into the view
	NSArray *allKeys = [[Persistance sharedService].dictionary allKeys];
	if( [allKeys count] > 0 ) {
		key1.text = [allKeys objectAtIndex:0];
		value1.text = [[Persistance sharedService].dictionary objectForKey:key1.text];
	}

	if( [allKeys count] > 1 ) {	
		key2.text = [allKeys objectAtIndex:1];
		value2.text = [[Persistance sharedService].dictionary objectForKey:key2.text];
	}
}

- (IBAction)save {
	[[Persistance sharedService].dictionary setObject:value1.text forKey:key1.text];
	[[Persistance sharedService].dictionary setObject:value2.text forKey:key2.text];
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [key1 resignFirstResponder];
    [key2 resignFirstResponder];
    [value1 resignFirstResponder];
	[value2 resignFirstResponder];
}
@end
