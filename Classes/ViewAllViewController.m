//
//  ViewAllViewController.m
//  NSArchiveExample
//
//  Created by Ben Ford on 4/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ViewAllViewController.h"
#import "Model.h"

@implementation ViewAllViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

#pragma mark UITableViewDelegate

#pragma mark -

#pragma mark UITableViewDataSource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return @"Boss";
			break;
		case 1:
			return @"Managers";
			break;
		case 2:
			return @"Employees";
			break;
	}
	return @"error";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return 1;
			break;
		case 1:
			return [[Persistance sharedService].managers count];
			break;
		case 2:
			return [[Persistance sharedService].employees count];
			break;
		default:
			return 1;
			break;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell;
	cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	if( cell == nil ) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:@"cell"] autorelease];
	}
	Person *person = nil;
	
	switch (indexPath.section) {
		case 0:
			cell.textLabel.text = [Persistance sharedService].boss.fullName;
			break;
		case 1:
			person = [[Persistance sharedService].managers objectForKey:@"HeadManager"];
			cell.textLabel.text = person.fullName;
			break;
		case 2:
			person = [[Persistance sharedService].employees objectAtIndex:indexPath.row];
			cell.textLabel.text = person.fullName;
			break;
		default:
			cell.textLabel.text = @"error";
			break;
	}
	
	return cell;
}
#pragma mark -

- (void)dealloc {
    [super dealloc];
}


@end
