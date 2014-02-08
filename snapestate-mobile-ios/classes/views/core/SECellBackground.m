//
//  THMCellBackground.m
//  thm-ios-iphone
//
//  Created by DontLoginHere on 2013-10-29.
//  Copyright (c) 2013 THM. All rights reserved.
//

#import "SECellBackground.h"

@interface SECellBackground ()

@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) BOOL highlighted;

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *highlightColor;
@property (nonatomic, strong) UIColor *selectedColor;

@end

@implementation SECellBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) { [self initialize]; }
    return self;
}

- (void)initialize
{
    [super setBackgroundColor:self.normalColor];
}

- (void)setBaseBackgroundColor:(UIColor *)color
{
    self.normalColor = color;
    [super setBackgroundColor:self.normalColor];
}

- (void)setSelectedBackgroundColor:(UIColor *)color
{
    self.selectedColor = color;
}

- (void)setHighlightedBackgroundColor:(UIColor *)color
{
    self.highlightColor = color;
}

#pragma mark -
#pragma mark Selection / Highlighted

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    self.backgroundColor = self.selectedColor;
}

- (void)setHighlighted:(BOOL)highlighted
{
    _highlighted = highlighted;
    self.backgroundColor = self.highlightColor;
}

#pragma mark -
#pragma mark Background Override

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    UIColor *targetColor;
    if (self.selected)          targetColor = self.selectedColor;
    else if (self.highlighted)  targetColor = self.highlightColor;
    else                        targetColor = self.normalColor;
    
    [UIView animateWithDuration:0.2f animations:^{
        [super setBackgroundColor:targetColor];
    }];
}

#pragma mark -
#pragma mark Property Accessors

- (UIColor *)highlightColor
{
    if (_highlightColor)    return _highlightColor;
    else                    return self.normalColor;
}

- (UIColor *)selectedColor
{
    if (_selectedColor)     return _selectedColor;
    else                    return self.normalColor;
}

- (UIColor *)normalColor
{
    if (_normalColor)       return _normalColor;
    else                    return [UIColor whiteColor];
}

@end
