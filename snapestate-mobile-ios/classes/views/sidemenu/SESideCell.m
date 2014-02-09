//
//  SESideCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-08.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SESideCell.h"

@interface SESideCell ()

@property (nonatomic, strong) UILabel *menuLabel;

@end

@implementation SESideCell

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self.cellDivider setHidden:YES];
	[self.cellBackground addSubview:self.menuLabel];
	[self.cellBackground setBaseBackgroundColor:[UIColor clearColor]];
}

- (void)setTitle:(NSString *)title
{
	self.menuLabel.text = title;
}

#pragma mark -
#pragma mark Property Accessors

- (UILabel *)menuLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_menuLabel, ^{
		_menuLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0,
															   __blockself.bounds.size.width - 40
															   , __blockself.bounds.size.height)];
		[_menuLabel setFontSize:18.0f];
		_menuLabel.textColor = [UIColor whiteColor];
		_menuLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		_menuLabel.text = @"Home";
	});
}

+ (CGFloat)heightForRow
{
	return 45;
}

@end
