//
//  SEPropertyListingViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-16.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEPropertyListingViewController.h"
#import "SEHouseListingTableView.h"

@interface SEPropertyListingViewController ()

@property (nonatomic, strong) SEHouseListingTableView *tableView;

@end

@implementation SEPropertyListingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = @"LISTING";
	
	UIBarButtonItem *searchIcon = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
	self.navigationItem.rightBarButtonItem = searchIcon;

	[self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark Property Accessors

- (SEHouseListingTableView *)tableView
{
	CREATE_THREAD_SAFE_INSTANCE(_tableView, ^{
		_tableView = [[SEHouseListingTableView alloc] initWithFrame:CGRectMake(0, 0, ViewWidth(__blockself.view), ViewHeight(__blockself.view))];
	});
}

@end
