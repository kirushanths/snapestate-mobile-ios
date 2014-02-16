//
//  SEBaseViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-16.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEBaseViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "SESideMenuViewController.h"

@interface SEBaseViewController ()

@end

@implementation SEBaseViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self enableSidebar:YES];
}

#pragma mark -
#pragma mark Side Menu

- (void)enableSidebar:(BOOL)enable
{
	[self.mm_drawerController setLeftDrawerViewController:enable ? [[self class] sideViewController] : nil];
}

- (void)setupDrawerButton
{
	MMDrawerBarButtonItem *drawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(drawerButtonPressed:)];
	self.navigationItem.leftBarButtonItem = drawerButton;
}

- (void)drawerButtonPressed:(id)sender
{
    [self openDrawer];
}

- (void)openDrawer
{
	[self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)closeDrawerWithCompletion:(void (^)(BOOL finished))completion
{
	[self.mm_drawerController closeDrawerAnimated:YES completion:completion];
}

#pragma mark -
#pragma mark Props

static SESideMenuViewController *_sideViewController;

+ (SESideMenuViewController *)sideViewController
{
	CREATE_THREAD_SAFE_SINGLETON(_sideViewController, ^{
		_sideViewController = [[SESideMenuViewController alloc] init];
	})
}

@end
