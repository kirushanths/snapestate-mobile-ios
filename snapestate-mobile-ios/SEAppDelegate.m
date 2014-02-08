//
//  SEAppDelegate.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-01-18.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEAppDelegate.h"
#import "Flurry.h"
#import "SEConstants.h"
#import "SENavigationViewController.h"
#import "SELoginViewController.h"

@implementation SEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef SE_DEBUG
#else
	[Flurry setCrashReportingEnabled:YES];
	[Flurry startSession:FLURRY_TOKEN];
#endif
	
	SELoginViewController *loginVC = [[SELoginViewController alloc] init];
	SENavigationViewController *navVC = [[SENavigationViewController alloc] initWithRootViewController:loginVC];
	
//	[self createAppearanceForNavigationController:navVC];
	
	NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeZero;
    shadow.shadowColor = [UIColor clearColor];

	NSDictionary *attrs = @{ UITextAttributeTextColor: [UIColor darkGrayColor],
							 UITextAttributeTextShadowColor: [UIColor clearColor],
							 UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
							 UITextAttributeFont: [UIFont fontWithName:@"Lato-Light" size:20.0f] };
	
	[[UINavigationBar appearance] setTitleTextAttributes:attrs];
	
	[[UINavigationBar appearance] setTintColor:[UIColor colorWithWhite:1.0f alpha:1.0f]];
	[[UINavigationBar appearance] setBarTintColor:[UIColor colorWithWhite:1.0f alpha:1.0f]];
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	self.window.rootViewController = navVC;
	
    return YES;
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
