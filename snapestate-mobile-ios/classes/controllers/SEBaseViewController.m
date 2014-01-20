//
//  SEBaseViewController.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-01-19.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEBaseViewController.h"

@interface SEBaseViewController ()

@property (nonatomic, assign) CGRect scrollRect;

@end

@implementation SEBaseViewController

#pragma mark -
#pragma mark View LifeCycle

-(void)viewDidUnload
{
	[super viewDidUnload];
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -
#pragma mark Navigation

-(void)pushNewController:(UIViewController *)viewController
{
    [self pushNewController:viewController animated:YES];
}

-(void)pushNewController:(UIViewController *)viewController animated:(BOOL)animated
{
    __weak SEBaseViewController *__self = self;
	dispatch_async(dispatch_get_main_queue(), ^{
		[__self.navigationController pushViewController:viewController animated:animated];
	});
}

-(void)popViewController
{
    __weak SEBaseViewController *__self = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([__self isModal] && [[__self.navigationController viewControllers] count] == 1) {
            [__self.navigationController dismissViewControllerAnimated:YES completion:nil];
        } else {
            [__self.navigationController popViewControllerAnimated:YES];
        }
    });
}

-(BOOL)isModal
{
    BOOL isModal = !!self.presentingViewController;
    return isModal;
}

#pragma mark -
#pragma mark Keyboard Events

-(void)registerKeyboardEvents
{
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillShow:)
												 name:UIKeyboardWillShowNotification
											   object:nil];
	
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillHide:)
												 name:UIKeyboardWillHideNotification
											   object:nil];
}

-(void)removeKeyboardEvents
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
													name:UIKeyboardWillShowNotification
												  object:nil];
	
    [[NSNotificationCenter defaultCenter] removeObserver:self
													name:UIKeyboardWillHideNotification
												  object:nil];
}

-(void)keyboardWillShow:(NSNotification*)aNotification
{
	RUN_SYNC_ON_MAIN_THREAD(^{
        [__blockself keyboardWillToggle:YES withNotification:aNotification animate:YES];
    });
}

-(void)keyboardWillHide:(NSNotification*)aNotification
{
	RUN_SYNC_ON_MAIN_THREAD(^{
        [__blockself keyboardWillToggle:NO withNotification:aNotification animate:YES];
    });
}

-(void)keyboardWillToggle:(BOOL)willShow withNotification:(NSNotification *)aNotification animate:(BOOL)animate
{
	UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
	NSDictionary *userInfo = aNotification.userInfo;
    NSTimeInterval duration = animate ? [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue] + 0.02 : 0;
    UIViewAnimationCurve curve = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
	
	CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
	float kbHeight;
	
	if (orientation == UIDeviceOrientationPortrait || orientation == UIDeviceOrientationPortraitUpsideDown ) {
		kbHeight = kbSize.height;
	} else {
		kbHeight = kbSize.width;
	}
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionBeginFromCurrentState | curve animations:^{
		
        if (!self.scrollView) {
            CGRect rect = self.view.frame;
            CGRect windowBounds = [[UIScreen mainScreen] bounds];
			CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
            if (willShow) {
                rect.size.height = windowBounds.size.height - kbHeight;
				if (!SYSTEM_VERSION_MIN_SDK_7) {
					rect.size.height -= statusBarFrame.size.height;
				}
            } else {
                rect.size.height = windowBounds.size.height;
            }
            self.view.frame = rect;
        } else {
            if (willShow) {
                self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, kbHeight, 0);
                self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, kbHeight, 0);
                if (!CGRectIsEmpty(self.scrollRect) && !CGRectIsNull(self.scrollRect))
                    [self.scrollView scrollRectToVisible:self.scrollRect animated:YES];
            } else {
                self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
                self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            }
        }
		
    } completion:nil];
}

#pragma mark -
#pragma mark Autorotation

-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);
}


@end
