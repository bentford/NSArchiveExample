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
- (void)viewDidAppear:(BOOL)animated {
	
	// refresh everytime
	[tableview reloadData];
}

#pragma mark UITableViewDelegate

#pragma mark -

#pragma mark UITableViewDataSource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return @"Person Object";
			break;
		case 1:
			return @"Dictionary";
			break;
		case 2:
			return @"Array";
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
			return [[Persistance sharedService].dictionary count];
			break;
		case 2:
			return [[Persistance sharedService].array count];
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
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"] autorelease];
	}
	Person *person = nil;
	
	switch (indexPath.section) {
		case 0:
			cell.textLabel.text = [Persistance sharedService].boss.fullName;
			break;
		case 1:
			if( [[[Persistance sharedService].dictionary allKeys] count] > indexPath.row ) {
				NSString *key = [[[Persistance sharedService].dictionary allKeys] objectAtIndex:indexPath.row];
				NSString *value = [[Persistance sharedService].dictionary objectForKey:key];
				cell.textLabel.text = value;
				cell.detailTextLabel.text = [NSString stringWithFormat:@"value for key: %@",key];
			}			
			break;
		case 2:
			person = [[Persistance sharedService].array objectAtIndex:indexPath.row];
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
