//
//  SEPropertyListingViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-16.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEPropertyListingViewController.h"
#import "SEHouseListingTableView.h"
#import "UILabel+LatoFont.h"

#define BUTTON_HEIGHT 50

@interface SEPropertyListingViewController ()

@property (nonatomic, strong) SEHouseListingTableView *tableView;
@property (nonatomic, strong) UIButton *contactButton;

@end

@implementation SEPropertyListingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = @"LISTING";
	
	UIBarButtonItem *searchIcon = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
	self.navigationItem.rightBarButtonItem = searchIcon;

	[self.view addSubview:self.tableView];
	[self.view addSubview:self.contactButton];
}

#pragma mark -
#pragma mark Property Accessors

- (SEHouseListingTableView *)tableView
{
	CREATE_THREAD_SAFE_INSTANCE(_tableView, ^{
		_tableView = [[SEHouseListingTableView alloc] initWithFrame:CGRectMake(0, 0, ViewWidth(__blockself.view), ViewHeight(__blockself.view))];
		[_tableView setContentInset:UIEdgeInsetsMake(0, 0, BUTTON_HEIGHT, 0)];
	});
}

- (UIButton *)contactButton
{
	CREATE_THREAD_SAFE_INSTANCE(_contactButton, ^{
		float height = BUTTON_HEIGHT;
		_contactButton = [[UIButton alloc] initWithFrame:CGRectMake(0, ViewHeight(__blockself.view) - height,
																	ViewWidth(__blockself.view), BUTTON_HEIGHT)];
		_contactButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
		_contactButton.backgroundColor = [SE_COLOR_BLUE colorWithAlphaComponent:0.7];
		[_contactButton setTitle:@"CONTACT AGENT" forState:UIControlStateNormal];
		[_contactButton.titleLabel setFontRegularSize:18.0f];
	});
}

@end
