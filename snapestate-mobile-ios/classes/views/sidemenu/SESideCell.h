//
//  SESideCell.h
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-08.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEBaseCell.h"

@interface SESideCell : SEBaseCell

@property (nonatomic, assign) int badgeValue;

- (void)setTitle:(NSString *)title;
- (void)setCurrent:(BOOL)current;
- (void)showBadge:(BOOL)show;

@end
