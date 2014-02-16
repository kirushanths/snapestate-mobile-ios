//
//  SEPropertyListingViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-16.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEPropertyListingViewController.h"

#define PADDING 20
#define PREVIEW_HEIGHT 200 + PADDING
#define ICON_WIDTH 50
#define ICON_HEIGHT 26

@interface SEPropertyListingViewController ()

@property (nonatomic, strong) UIImageView *previewImage;
@property (nonatomic, strong) UIScrollView *listingContent;

@property (nonatomic, strong) UIImageView *addressIcon;
@property (nonatomic, strong) UILabel *streeLabel;
@property (nonatomic, strong) UILabel *locationLabel;

@property (nonatomic, strong) UIImageView *detailsIcon;


@end

@implementation SEPropertyListingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = @"LISTING";
	
	UIBarButtonItem *searchIcon = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
	self.navigationItem.rightBarButtonItem = searchIcon;

	[self.view addSubview:self.listingContent];
	[self.listingContent addSubview:self.previewImage];
	
	[self.listingContent addSubview:self.streeLabel];
	[self.listingContent addSubview:self.locationLabel];
	[self.listingContent addSubview:self.addressIcon];
	
	[self.listingContent addSubview:self.detailsIcon];
}

#pragma mark -
#pragma mark Property Accessors

- (UIImageView *)detailsIcon
{
	CREATE_THREAD_SAFE_INSTANCE(_detailsIcon, ^{
		_detailsIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, PREVIEW_HEIGHT + (ICON_HEIGHT * 2), ICON_WIDTH + 5, ICON_HEIGHT)];
		_detailsIcon.backgroundColor = [UIColor clearColor];
		_detailsIcon.contentMode = UIViewContentModeCenter;
		_detailsIcon.alpha = 1.0;
		_detailsIcon.image = [UIImage imageNamed:@"icon_details.png"];
	});
}

- (UIImageView *)addressIcon
{
	CREATE_THREAD_SAFE_INSTANCE(_addressIcon, ^{
		_addressIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, PREVIEW_HEIGHT, ICON_WIDTH + 5, ICON_HEIGHT)];
		_addressIcon.backgroundColor = [UIColor clearColor];
		_addressIcon.contentMode = UIViewContentModeCenter;
		_addressIcon.alpha = 0.2;
		_addressIcon.image = [UIImage imageNamed:@"icon_location.png"];
	});
}

- (UILabel *)streeLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_streeLabel, ^{
		_streeLabel = [[UILabel alloc] initWithFrame:CGRectMake(ICON_WIDTH, PREVIEW_HEIGHT,
																  ViewWidth(__blockself.view) - (PADDING) - ICON_WIDTH, ICON_HEIGHT)];
		_streeLabel.backgroundColor = [UIColor clearColor];
		_streeLabel.textColor = [UIColor grayColor];
		[_streeLabel setFontRegularSize:20.0f];
		_streeLabel.text = @"123 BAKER STREET";
	});
}

- (UILabel *)locationLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_locationLabel, ^{
		_locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(ICON_WIDTH, PREVIEW_HEIGHT + ICON_HEIGHT,
																   ViewWidth(__blockself.view) - (PADDING) - ICON_WIDTH, ICON_HEIGHT)];
		_locationLabel.backgroundColor = [UIColor clearColor];
		_locationLabel.textColor = [UIColor grayColor];
		[_locationLabel setFontSize:16.0f];
		_locationLabel.text = @"Toronto, ON";
	});
}

- (UIScrollView *)listingContent
{
	CREATE_THREAD_SAFE_INSTANCE(_listingContent, ^{
		_listingContent = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ViewWidth(__blockself.view), ViewHeight(__blockself.view))];
		_listingContent.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.9f];
	});
}

- (UIImageView *)previewImage
{
	CREATE_THREAD_SAFE_INSTANCE(_previewImage, ^{
		_previewImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, __blockself.view.bounds.size.width, PREVIEW_HEIGHT - PADDING)];
		_previewImage.contentMode = UIViewContentModeCenter;
		_previewImage.clipsToBounds = YES;
		_previewImage.backgroundColor = [UIColor blackColor];
		_previewImage.image = [UIImage imageNamed:@"discoverbg.jpeg"];
	});
}

@end
