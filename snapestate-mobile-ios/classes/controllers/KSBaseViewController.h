//
//  SEBaseViewController.h
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-01-19.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEConstants.h"
#import "SEMacros.h"

@interface KSBaseViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

#pragma mark -
#pragma mark Navigation

- (void)pushNewController:(UIViewController *)viewController;
- (void)pushNewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)popViewController;

#pragma mark -
#pragma mark Side Menu

- (void)setupDrawerButton;
- (void)openDrawer;
- (void)closeDrawerWithCompletion:(void (^)(BOOL finished))completion;

#pragma mark -
#pragma mark Keyboard Events

- (void)registerKeyboardEvents;
- (void)removeKeyboardEvents;
- (void)keyboardWillShow:(NSNotification *)aNotification;
- (void)keyboardWillHide:(NSNotification *)aNotification;
- (void)keyboardWillToggle:(BOOL)willShow withNotification:(NSNotification *)aNotification animate:(BOOL)animate;


@end
