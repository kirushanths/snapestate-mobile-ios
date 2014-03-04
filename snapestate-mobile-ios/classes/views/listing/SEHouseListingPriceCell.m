//
//  SEHouseListingPriceCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-03-03.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEHouseListingPriceCell.h"

@interface SEHouseListingPriceCell ()

@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *sizeLabel;
@property (nonatomic, strong) UILabel *lotSizeLabel;

@end

@implementation SEHouseListingPriceCell

- (void)layoutSubviews
{
	[super layoutSubviews];
	self.cellDivider.hidden = NO;
	[self.cellBackground addSubview:self.priceLabel];
	[self.cellBackground addSubview:self.sizeLabel];
}

#pragma mark -
#pragma mark Props

- (UILabel *)priceLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_priceLabel, ^{
		_priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,
																LISTING_CELL_PADDING,
																ViewWidth(__blockself.cellBackground) - 2 * 20,
																LISTING_CELL_ICON_HEIGHT)];
		_priceLabel.backgroundColor = [UIColor clearColor];
		_priceLabel.textColor = [UIColor grayColor];
		[_priceLabel setFontRegularSize:26.0f];
		_priceLabel.text = @"$590,000";
	});
}

- (UILabel *)sizeLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_sizeLabel, ^{
		_sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,
															   LISTING_CELL_PADDING + (LISTING_CELL_ICON_HEIGHT),
															   ViewWidth(__blockself.cellBackground) - 2 * 20,
															   LISTING_CELL_ICON_HEIGHT)];
		_sizeLabel.backgroundColor = [UIColor clearColor];
		_sizeLabel.textColor = [UIColor grayColor];
		[_sizeLabel setFontSize:16.0f];
		_sizeLabel.text = @"60 x 125 ft - 1500 sq ft";
	});
}

+ (CGFloat)heightForRow
{
	return 2 * (LISTING_CELL_PADDING + LISTING_CELL_ICON_HEIGHT);
}

@end
