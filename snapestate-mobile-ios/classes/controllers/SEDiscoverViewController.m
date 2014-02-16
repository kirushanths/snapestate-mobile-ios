//
//  SEDiscoverViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-01.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEDiscoverViewController.h"
#import "SEDiscoverCell.h"
#import "SEPropertyListingViewController.h"

@interface SEDiscoverViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SEDiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"DISCOVER";
	self.view.backgroundColor = self.tableView.backgroundColor = SE_COLOR_GRAY_BLUE_DARK;
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
	
	switch (indexPath.row % 4) {
		case 0:
			[cell setupWithImage:[UIImage imageNamed:@"discoverbg.jpeg"]];
			break;
		case 1:
			[cell setupWithImage:[UIImage imageNamed:@"home3.jpg"]];
			break;
		case 2:
			[cell setupWithImage:[UIImage imageNamed:@"home2.jpg"]];
			break;
		case 3:
			[cell setupWithImage:[UIImage imageNamed:@"home4.jpg"]];
			break;
		default:
			break;
	}
	
	return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section { return nil; }
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section { return nil; }

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section { return 0.0f; }
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section { return 0.0f; }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	SEPropertyListingViewController *nextVC = [[SEPropertyListingViewController alloc] init];
	[self pushNewController:nextVC];
}

#pragma mark -
#pragma mark Property Accessors

- (UITableView *)tableView
{
	CREATE_THREAD_SAFE_INSTANCE(_tableView, ^{
		_tableView = [[UITableView alloc] initWithFrame:__blockself.view.bounds];
		_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		_tableView.delegate = __blockself;
		_tableView.dataSource = __blockself;
	});
}

@end
