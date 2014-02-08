//
//  THMCellBackground.h
//  thm-ios-iphone
//
//  Created by DontLoginHere on 2013-10-29.
//  Copyright (c) 2013 THM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEConstants.h"

@interface SECellBackground : UIView

- (void)setSelected:(BOOL)selected;
- (void)setHighlighted:(BOOL)highlighted;

- (void)setBaseBackgroundColor:(UIColor *)color;
- (void)setSelectedBackgroundColor:(UIColor *)color;
- (void)setHighlightedBackgroundColor:(UIColor *)color;

@end
