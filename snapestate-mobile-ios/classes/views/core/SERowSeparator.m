//
//  THMRowSeparator.m
//  thm-ios-iphone
//
//  Created by Kiru on 2013-10-09.
//  Copyright (c) 2013 THM. All rights reserved.
//

#import "SERowSeparator.h"
#import "SEConstants.h"

@interface SERowSeparator ()

@property (nonatomic, strong) UIColor *baseBGColor;

@end

@implementation SERowSeparator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setBaseBackgroundColor:SE_COLOR_GRAY_SEPARATOR];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

- (void)setBaseBackgroundColor:(UIColor *)color
{
	_baseBGColor = color;
	[super setBackgroundColor:_baseBGColor];
}

-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:self.baseBGColor];
}

@end
