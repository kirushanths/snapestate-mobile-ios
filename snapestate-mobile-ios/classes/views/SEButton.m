//
//  SEButton.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-01.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEButton.h"
#import "SEConstants.h"

@implementation SEButton

- (id)initWithTitle:(NSString *)title andTarget:(id)target andAction:(SEL)action
{
    self = [SEButton buttonWithType:UIButtonTypeCustom];
    if (self) {
		self.origBGColor = self.backgroundColor = SE_COLOR_BLUE;
        self.disabledBGColor = SE_COLOR_GRAY_BLUE_LIGHT;
        self.selectedBGColor = SE_COLOR_GRAY_BLUE;
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setShowsTouchWhenHighlighted:NO];
        [self setAdjustsImageWhenDisabled:NO];
        [self setAdjustsImageWhenHighlighted:NO];
		
		self.layer.cornerRadius = 2.0f;
        
        [self addTarget:target
                 action:action
       forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(setHighlightBG) forControlEvents:UIControlEventTouchDown];
        self.frame = CGRectMake(0, 0, 55, 30);
    }
    return self;
}

-(void)setHighlightBG
{
    self.backgroundColor = self.selectedBGColor;
    [UIView animateWithDuration:0.3f animations:^{
        self.backgroundColor = self.origBGColor;
    }];
}

-(void)setNormalBG
{
    self.backgroundColor = self.origBGColor;
}

- (void)setBaseBackgroundColor:(UIColor *)backgroundColor
{
    self.origBGColor = backgroundColor;
    self.backgroundColor = self.origBGColor;
}

- (void)setDisabledBackgroundColor:(UIColor *)backgroundColor
{
    self.disabledBGColor = backgroundColor;
}

- (void)setSelectedBackgroundColor:(UIColor *)backgroundColor
{
    self.selectedBGColor = backgroundColor;
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    self.userInteractionEnabled = enabled;
    
    if (enabled) {
        self.backgroundColor = self.origBGColor;
    } else {
        self.backgroundColor = self.disabledBGColor;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect frame = CGRectInset(self.bounds, -5.0f, -10.0f);
    
    if (CGRectContainsPoint(frame, point)) {
        return self;
    }
    
    return nil;
}

@end
