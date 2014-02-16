//
//  SESideMenuViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-08.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SESideMenuViewController.h"
#import "SESideCell.h"

enum SE_SIDE_ROWS {
	SE_SIDE_ROW_SNAPS,
	SE_SIDE_ROW_DISCOVER,
	SE_SIDE_ROW_SEARCH,
	SE_SIDE_ROW_ACCOUNT,
	SE_SIDE_ROW_SETTINGS,
	SE_SIDE_NUM_ROWS
	};

@interface SESideMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *backgroundImage;

@end

@implementation SESideMenuViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self.view addSubview:self.backgroundImage];
	[self.view addSubview:self.tableView];
	self.view.backgroundColor = self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.tableView reloadData];
	CGRect frame = self.tableView.frame;
	frame.origin.y = (self.view.bounds.size.height - self.tableView.contentSize.height) / 2;
	self.tableView.frame = frame;
}

#pragma mark -
#pragma mark TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return SE_SIDE_NUM_ROWS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	SESideCell *cell = [tableView dequeueReusableCellWithIdentifier:[SESideCell reuseIdentifier]];
	if (!cell) {
		cell = [[SESideCell alloc] init];
	}
	
	[cell setCurrent:NO];
	[cell showBadge:NO];
	
	switch (indexPath.row) {
		case SE_SIDE_ROW_SNAPS:
			[cell setTitle:@"My Snaps"];
			[cell setBadgeValue:1];
			[cell showBadge:YES];
			break;
		case SE_SIDE_ROW_DISCOVER:
			[cell setTitle:@"Discover"];
			[cell setCurrent:YES];
			break;
		case SE_SIDE_ROW_SEARCH:
			[cell setTitle:@"Search"];
			break;
		case SE_SIDE_ROW_ACCOUNT:
			[cell setTitle:@"Account"];
			break;
		case SE_SIDE_ROW_SETTINGS:
			[cell setTitle:@"Settings"];
			break;
		default:
			break;
	}
	
	return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [SESideCell heightForRow];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section { return nil; }
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section { return nil; }

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section { return 0.0f; }
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section { return 0.0f; }


#pragma mark - 
#pragma mark Property Accessors

- (UIImageView *)backgroundImage
{
	CREATE_THREAD_SAFE_INSTANCE(_backgroundImage, ^{
		_backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebg.png"]];
		_backgroundImage.frame = __blockself.view.bounds;
		_backgroundImage.backgroundColor = SE_COLOR_GRAY_BLUE_DARK;
		_backgroundImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		_backgroundImage.contentMode = UIViewContentModeCenter;
	});
}

- (UITableView *)tableView
{
	CREATE_THREAD_SAFE_INSTANCE(_tableView, ^{
		float yloc = (SYSTEM_VERSION_MIN_SDK_7 ? 20 : 0);
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, yloc,
																   __blockself.view.bounds.size.width,
																   __blockself.view.bounds.size.height - yloc)];
		_tableView.backgroundColor = [UIColor clearColor];
		_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		_tableView.scrollEnabled = NO;
		_tableView.dataSource = __blockself;
		_tableView.delegate = __blockself;
	});
}

@end
