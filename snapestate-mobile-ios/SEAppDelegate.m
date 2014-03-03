//
//  SEAppDelegate.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-01-18.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEAppDelegate.h"
#import "SEConstants.h"
#import "SENavigationViewController.h"
#import "SELoginViewController.h"
#import "MMDrawerController.h"
#import "SESideMenuViewController.h"
#import "MMDrawerVisualState.h"

@implementation SEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{	
	SELoginViewController *loginVC = [[SELoginViewController alloc] init];
	SENavigationViewController *navVC = [[SENavigationViewController alloc] initWithRootViewController:loginVC];
	
	MMDrawerController *drawerVC = [[MMDrawerController alloc] initWithCenterViewController:navVC
																   leftDrawerViewController:nil
																  rightDrawerViewController:nil];
	
	[drawerVC setRestorationIdentifier:@"MMDrawer"];
	[drawerVC setMaximumLeftDrawerWidth:250.0f];
    [drawerVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeBezelPanningCenterView];
    [drawerVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
	[drawerVC setDrawerVisualStateBlock:[MMDrawerVisualState slideAndScaleVisualStateBlock]];
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = drawerVC;
	
	[self styleApplication];
	
	self.window.backgroundColor = SE_COLOR_GRAY_BLUE_DARK;
	[self.window makeKeyAndVisible];
    return YES;
}

-(void)styleApplication
{
	UIColor *navColor = SE_COLOR_THEME;
	UIColor *textColor = [UIColor whiteColor];
	
	NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero;
    shadow.shadowColor = [UIColor clearColor];
	
	NSDictionary *attrs = @{ UITextAttributeTextColor: textColor,
							 UITextAttributeTextShadowColor: [UIColor clearColor],
							 UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
							 UITextAttributeFont: SE_FONT(18.0f) };
	
	[[UINavigationBar appearance] setTitleTextAttributes:attrs];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
	
	if (SYSTEM_VERSION_MIN_SDK_7) {
		[[UINavigationBar appearance] setTintColor:textColor];
		[[UINavigationBar appearance] setBarTintColor:navColor];
	} else {
		[[UINavigationBar appearance] setTintColor:navColor];
	}
	
	if (SYSTEM_VERSION_MIN_SDK_7)
		[self.window setTintColor:navColor];
}

-(void)createAppearanceForNavigationController:(UINavigationController *)naviVC
{
    UIImage *navBarImage;
	UIColor *navBarColor = [UIColor colorWithWhite:1.0f alpha:0.5f];
    if (SYSTEM_VERSION_MIN_SDK_7) {
        CGRect navBarRect = CGRectMake(0, 0, 320, 64);
        UIGraphicsBeginImageContextWithOptions(navBarRect.size, NO, 0);
        [navBarColor setFill];
        UIRectFill(navBarRect);
        navBarImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        UIGraphicsBeginImageContextWithOptions(navBarRect.size, NO, 0);
        [navBarImage drawInRect:navBarRect];
        CGRect navBarBlueRect = CGRectMake(0, 20, 320, 44);
        CGRect roundRect = navBarBlueRect;
        roundRect.size.height += 40; //dont curve bottom, push it out
        [[UIBezierPath bezierPathWithRoundedRect:roundRect cornerRadius:0.0] addClip];
        [navBarColor setFill];
        UIRectFill(navBarBlueRect);
        navBarImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
		
		[[UINavigationBar appearance] setBackgroundImage:navBarImage forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
    } else {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(320, 44), NO, 0);
        [navBarColor setFill];
        UIRectFill(CGRectMake(0, 0, 320, 44));
        navBarImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
		
		[[UINavigationBar appearance] setBackgroundImage:navBarImage forBarMetrics:UIBarMetricsDefault];
    }
}

@end
