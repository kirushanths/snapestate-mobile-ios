//
//  SEDiscoverViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-01.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEDiscoverViewController.h"
#import "SEDiscoverCell.h"

@interface SEDiscoverViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SEDiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"DISCOVER";
	self.view.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:self.tableView];
	
	UIBarButtonItem *searchIcon = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:nil];
	self.navigationItem.rightBarButtonItem = searchIcon;
	
	[self setupDrawerButton];
}

#pragma mark -
#pragma mark TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [SEDiscoverCell heightForRow];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SEDiscoverCell *cell = [tableView dequeueReusableCellWithIdentifier:[SEDiscoverCell reuseIdentifier]];
	
	if (cell == nil) {
		cell = [[SEDiscoverCell alloc] init];
	}
	
	return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section { return nil; }
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section { return nil; }

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section { return 0.0f; }
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section { return 0.0f; }

#pragma mark -
#pragma mark Property Accessors

- (UITableView *)tableView
{
	CREATE_THREAD_SAFE_INSTANCE(_tableView, ^{
		_tableView = [[UITableView alloc] initWithFrame:__blockself.view.bounds];
		_tableView.delegate = __blockself;
		_tableView.dataSource = __blockself;
	});
}

@end
