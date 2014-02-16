//
//  SELoginViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-01-19.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SELoginViewController.h"
#import "SEDiscoverViewController.h"
#import "SETextFieldView.h"
#import "SEButton.h"

#define UI_WIDTH 200
#define UI_HEIGHT 45

@interface SELoginViewController ()

@property (nonatomic, strong) UIImageView *dropBackgroundView;
@property (nonatomic, strong) SETextFieldView *loginField;
@property (nonatomic, strong) SETextFieldView *passwordField;
@property (nonatomic, strong) SEButton *loginButton;

@end

@implementation SELoginViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self enableSidebar:NO];
	
	self.title = @"Login";
	[self.view addSubview:self.dropBackgroundView];
	[self.view addSubview:self.loginField];
	[self.view addSubview:self.passwordField];
	[self.view addSubview:self.loginButton];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)loginButtonPressed
{
	[self.loginField resignKeyboard];
	[self.passwordField resignKeyboard];
	
	// TODO: login

	SEDiscoverViewController *nextVC = [[SEDiscoverViewController alloc] init];
	[self pushNewController:nextVC];
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

- (SETextFieldView *)loginField
{
	CREATE_THREAD_SAFE_INSTANCE(_loginField, ^{
		_loginField = [[SETextFieldView alloc] initWithFrame:CGRectMake((__blockself.view.bounds.size.width - UI_WIDTH) / 2.0f, 80, UI_WIDTH, UI_HEIGHT)];
		_loginField.textField.placeholder = @"Email";
	});
}

- (SETextFieldView *)passwordField
{
	CREATE_THREAD_SAFE_INSTANCE(_passwordField, ^{
		_passwordField = [[SETextFieldView alloc] initWithFrame:CGRectMake((__blockself.view.bounds.size.width - UI_WIDTH) / 2.0f, 80 + UI_HEIGHT + 10, UI_WIDTH, UI_HEIGHT)];
		_passwordField.textField.placeholder = @"Password";
		_passwordField.textField.secureTextEntry = YES;
	});
}

- (SEButton *)loginButton
{
	CREATE_THREAD_SAFE_INSTANCE(_loginButton, ^{
		_loginButton = [[SEButton alloc] initWithTitle:@"Login" andTarget:self andAction:@selector(loginButtonPressed)];
		_loginButton.frame = CGRectMake((__blockself.view.bounds.size.width - UI_WIDTH) / 2.0f, 80 + (UI_HEIGHT + 10) * 2, UI_WIDTH, UI_HEIGHT);
	});
}

@end
