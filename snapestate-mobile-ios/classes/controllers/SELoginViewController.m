//
//  SELoginViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-01-19.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SELoginViewController.h"

@interface SELoginViewController ()

@property (nonatomic, strong) UIImageView *dropBackgroundView;

@end

@implementation SELoginViewController

#pragma mark -
#pragma mark View lifecycle

- (void)loadView
{
	CGRect windowBounds = [[UIScreen mainScreen] bounds];
	
	UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
	if (orientation == UIDeviceOrientationPortrait || orientation == UIDeviceOrientationPortraitUpsideDown ) {}
	else {}
	
	self.view = [[UIView alloc] initWithFrame:windowBounds];
	self.view.autoresizesSubviews = YES;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if (SYSTEM_VERSION_MIN_SDK_6)
        [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view addSubview:self.dropBackgroundView];
}

#pragma mark -
#pragma mark Property Accessors

- (UIImageView *)dropBackgroundView
{
	CREATE_THREAD_SAFE_INSTANCE(_dropBackgroundView, ^{
		_dropBackgroundView = [[UIImageView alloc] initWithFrame:__blockself.view.bounds];
		_dropBackgroundView.image = [UIImage imageNamed:@"loginbg.png"];
		_dropBackgroundView.contentMode = UIViewContentModeCenter;
	});
}

@end
