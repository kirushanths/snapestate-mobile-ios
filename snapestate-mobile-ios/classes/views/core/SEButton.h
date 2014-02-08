//
//  SEButton.h
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-01.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEButton : UIButton

@property (nonatomic, strong) UIColor *origBGColor;
@property (nonatomic, strong) UIColor *disabledBGColor;
@property (nonatomic, strong) UIColor *selectedBGColor;

- (id)initWithTitle:(NSString *)title andTarget:(id)target andAction:(SEL)action;

- (void)setBaseBackgroundColor:(UIColor *)backgroundColor;
- (void)setDisabledBackgroundColor:(UIColor *)backgroundColor;
- (void)setSelectedBackgroundColor:(UIColor *)backgroundColor;

@end
