//
//  SEPropertyListingViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-16.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEPropertyListingViewController.h"

@interface SEPropertyListingViewController ()

@property (nonatomic, strong) UIImageView *previewImage;

@end

@implementation SEPropertyListingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = @"LISTING";
	
	UIBarButtonItem *searchIcon = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
	self.navigationItem.rightBarButtonItem = searchIcon;

	[self.view addSubview:self.previewImage];
}

#pragma mark -
#pragma mark Property Accessors

- (UIImageView *)previewImage
{
	CREATE_THREAD_SAFE_INSTANCE(_previewImage, ^{
		float locY = SYSTEM_VERSION_MIN_SDK_7 ? __blockself.navStatusBarHeight : 0;
		_previewImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, locY, __blockself.view.bounds.size.width, 200)];
		_previewImage.contentMode = UIViewContentModeCenter;
		_previewImage.clipsToBounds = YES;
		_previewImage.backgroundColor = [UIColor blackColor];
		_previewImage.image = [UIImage imageNamed:@"discoverbg.jpeg"];
	});
}

@end
