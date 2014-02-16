//
//  SEBaseViewController.h
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-16.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "KSBaseViewController.h"

@interface SEBaseViewController : KSBaseViewController

#pragma mark -
#pragma mark Side Menu

- (void)enableSidebar:(BOOL)enable;
- (void)setupDrawerButton;
- (void)openDrawer;
- (void)closeDrawerWithCompletion:(void (^)(BOOL finished))completion;

@end
