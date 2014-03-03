//
//  SEHouseListingAddressCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-03-02.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEHouseListingAddressCell.h"

@interface SEHouseListingAddressCell ()

@property (nonatomic, strong) UILabel *streeLabel;
@property (nonatomic, strong) UILabel *locationLabel;

@end

@implementation SEHouseListingAddressCell

- (void)layoutSubviews
{
	[super layoutSubviews];
	self.cellIcon.image = [UIImage imageNamed:@"icon_location.png"];
	self.cellIcon.alpha = 0.2f;
	[self.cellBackground addSubview:self.cellIcon];
	[self.cellBackground addSubview:self.streeLabel];
	[self.cellBackground addSubview:self.locationLabel];
}

#pragma mark -
#pragma mark Props

- (UILabel *)streeLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_streeLabel, ^{
		_streeLabel = [[UILabel alloc] initWithFrame:CGRectMake(LISTING_CELL_ICON_WIDTH,
																LISTING_CELL_PADDING,
																ViewWidth(__blockself.cellBackground) - LISTING_CELL_PADDING - LISTING_CELL_ICON_HEIGHT,
																LISTING_CELL_ICON_HEIGHT)];
		_streeLabel.backgroundColor = [UIColor clearColor];
		_streeLabel.textColor = [UIColor grayColor];
		[_streeLabel setFontRegularSize:20.0f];
		_streeLabel.text = @"123 BAKER STREET";
	});
}

- (UILabel *)locationLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_locationLabel, ^{
		_locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(LISTING_CELL_ICON_WIDTH,
																   LISTING_CELL_PADDING + (LISTING_CELL_ICON_HEIGHT),
																   ViewWidth(__blockself.cellBackground) - LISTING_CELL_PADDING - LISTING_CELL_ICON_HEIGHT,
																   LISTING_CELL_ICON_HEIGHT)];
		_locationLabel.backgroundColor = [UIColor clearColor];
		_locationLabel.textColor = [UIColor grayColor];
		[_locationLabel setFontSize:16.0f];
		_locationLabel.text = @"Toronto, ON";
	});
}

+ (CGFloat)heightForRow
{
	return 2 * (LISTING_CELL_PADDING + LISTING_CELL_ICON_HEIGHT);
}

@end
