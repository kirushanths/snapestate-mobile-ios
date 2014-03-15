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

#define BUTTON_HEIGHT 50

@interface SEDiscoverViewController () <UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *cameraButton;

@end

@implementation SEDiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"DISCOVER";
	[self.view addSubview:self.tableView];
	[self.view addSubview:self.cameraButton];
	
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

- (void)takePhoto
{
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Unable to open Camera"
															  message:@"Device has no camera"
															 delegate:nil
													cancelButtonTitle:@"OK"
													otherButtonTitles: nil];
		[myAlertView show];
	} else {
		UIImagePickerController *picker = [[UIImagePickerController alloc] init];
		picker.delegate = self;
		picker.allowsEditing = YES;
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		[self presentViewController:picker animated:YES completion:NULL];
	}
}

#pragma mark -
#pragma mark Property Accessors

- (UITableView *)tableView
{
	CREATE_THREAD_SAFE_INSTANCE(_tableView, ^{
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ViewWidth(__blockself.view), ViewHeight(__blockself.view))];
		[_tableView setContentInset:UIEdgeInsetsMake(0, 0, BUTTON_HEIGHT, 0)];
		_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		_tableView.backgroundColor = [UIColor clearColor];
		_tableView.delegate = __blockself;
		_tableView.dataSource = __blockself;
	});
}

- (UIButton *)cameraButton
{
	CREATE_THREAD_SAFE_INSTANCE(_cameraButton, ^{
		float height = BUTTON_HEIGHT;
		_cameraButton = [[UIButton alloc] initWithFrame:CGRectMake(0, ViewHeight(__blockself.view) - height,
																	ViewWidth(__blockself.view), BUTTON_HEIGHT)];
		_cameraButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
		_cameraButton.backgroundColor = [SE_COLOR_BLUE colorWithAlphaComponent:0.7];
		[_cameraButton setTitle:@"CAMERA" forState:UIControlStateNormal];
		[_cameraButton addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
		[_cameraButton.titleLabel setFontRegularSize:18.0f];
	});
}

@end
