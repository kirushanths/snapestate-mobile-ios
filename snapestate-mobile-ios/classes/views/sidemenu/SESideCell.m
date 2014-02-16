//
//  SESideCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-08.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SESideCell.h"

#define BADGE_WIDTH 70

@interface SESideCell ()

@property (nonatomic, strong) UILabel *menuLabel;
@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation SESideCell

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self.cellDivider setHidden:YES];
	[self.cellBackground addSubview:self.menuLabel];
	[self.cellBackground addSubview:self.countLabel];
	[self.cellBackground setBaseBackgroundColor:[UIColor clearColor]];
}

- (void)setTitle:(NSString *)title
{
	self.menuLabel.text = title;
	self.badgeValue = 1;
}

- (void)setCurrent:(BOOL)current
{
	[self.menuLabel setFontSize:current ? 25.0f : 18.0f];
	CGRect frame = self.menuLabel.frame;
	frame.origin.x = current ? BADGE_WIDTH - 5: BADGE_WIDTH;
	self.menuLabel.frame = frame;
	
	[self.cellBackground setBaseBackgroundColor:current ? SE_COLOR_GRAY_BLUE : [UIColor clearColor]];
	[self.cellBackground setBackgroundColor:current ? SE_COLOR_GRAY_BLUE : [UIColor clearColor]];
}

- (void)showBadge:(BOOL)show
{
	self.countLabel.hidden = !show;
}

- (void)setBadgeValue:(int)badgeValue
{
    _badgeValue = badgeValue;
    self.countLabel.backgroundColor = badgeValue == 0 ? SE_COLOR_GRAY_BLUE_LIGHTER : SE_COLOR_GRAY_BLUE;
    self.countLabel.textColor = badgeValue == 0 ? SE_COLOR_GRAY_BLUE_LIGHTER : [UIColor whiteColor];
    
    self.countLabel.text = [NSString stringWithFormat:@"%d", badgeValue];
    CGSize size = [self.countLabel sizeThatFits:self.bounds.size];
    size.height += 6.0f;
    size.width += 14.0f;
    CGRect rect = CGRectMake(BADGE_WIDTH - size.width - 20.0f, (self.bounds.size.height - size.height) / 2.0f, size.width, size.height);
    self.countLabel.frame = rect;
}

#pragma mark -
#pragma mark Property Accessors

- (UILabel *)countLabel
{
    CREATE_THREAD_SAFE_INSTANCE(_countLabel, ^{
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, BADGE_WIDTH, self.bounds.size.height)];
        _countLabel.autoresizesSubviews = YES;
        _countLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;	
        _countLabel.textColor = [UIColor whiteColor];
		_countLabel.backgroundColor = [UIColor clearColor];
        [_countLabel setFontRegularSize:12.0f];
		_countLabel.text = @"0";
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.layer.cornerRadius = 2;
    });
}

- (UILabel *)menuLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_menuLabel, ^{
		float padding = 30;
		_menuLabel = [[UILabel alloc] initWithFrame:CGRectMake(BADGE_WIDTH, 0,
															   __blockself.bounds.size.width - (padding)
															   , __blockself.bounds.size.height)];
		[_menuLabel setFontRegularSize:18.0f];
		_menuLabel.backgroundColor = [UIColor clearColor];
		_menuLabel.textColor = [UIColor whiteColor];
		_menuLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		_menuLabel.text = @"Home";
	});
}

+ (CGFloat)heightForRow
{
	return 55;
}

@end
