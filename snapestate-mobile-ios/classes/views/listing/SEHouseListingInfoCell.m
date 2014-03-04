//
//  SEHouseListingInfoCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-03-02.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEHouseListingInfoCell.h"

@interface SEHouseListingInfoCell ()

@property (nonatomic, strong) UILabel *houseLabel;
@property (nonatomic, strong) UILabel *bedroomLabel;
@property (nonatomic, strong) UILabel *restroomLabel;

@end

@implementation SEHouseListingInfoCell

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	self.cellIcon.image = [UIImage imageNamed:@"icon_details.png"];
	[self.cellBackground addSubview:self.cellIcon];
	[self.cellBackground addSubview:self.houseLabel];
	[self.cellBackground addSubview:self.bedroomLabel];
	[self.cellBackground addSubview:self.restroomLabel];
}

#pragma mark -
#pragma mark Props

- (UILabel *)houseLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_houseLabel, ^{
		_houseLabel = [[UILabel alloc] initWithFrame:CGRectMake(LISTING_CELL_ICON_WIDTH, LISTING_CELL_PADDING,
																  ViewWidth(__blockself.cellBackground) - LISTING_CELL_ICON_WIDTH,
																  LISTING_CELL_ICON_HEIGHT)];
		[_houseLabel setFontSize:16.0f];
		_houseLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
		_houseLabel.text = @"Residental, Detached";
		_houseLabel.textColor = [UIColor grayColor];
	});
}

- (UILabel *)bedroomLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_bedroomLabel, ^{
		_bedroomLabel = [[UILabel alloc] initWithFrame:CGRectMake(LISTING_CELL_ICON_WIDTH,
																LISTING_CELL_PADDING + (LISTING_CELL_PADDING + LISTING_CELL_ICON_HEIGHT),
																 ViewWidth(__blockself.cellBackground) - LISTING_CELL_ICON_WIDTH - LISTING_CELL_PADDING,
																  LISTING_CELL_ICON_HEIGHT)];
		[_bedroomLabel setFontSize:16.0f];
		_bedroomLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
		_bedroomLabel.text = @"3 Bedrooms, 2 Bathrooms";
		_bedroomLabel.textColor = [UIColor grayColor];
	});
}

- (UILabel *)restroomLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_restroomLabel, ^{
		_restroomLabel = [[UILabel alloc] initWithFrame:CGRectMake(LISTING_CELL_ICON_WIDTH,
																   LISTING_CELL_PADDING + 2 * (LISTING_CELL_PADDING + LISTING_CELL_ICON_HEIGHT),
																   ViewWidth(__blockself.cellBackground) - LISTING_CELL_ICON_WIDTH - LISTING_CELL_PADDING,
																   LISTING_CELL_ICON_HEIGHT)];
		_restroomLabel.backgroundColor = [UIColor clearColor];
		_restroomLabel.textColor = [UIColor grayColor];
		[_restroomLabel setFontSize:16.0f];
		_restroomLabel.text = @"Finished Basement";
	});
}

+ (CGFloat)heightForRow
{
	return LISTING_CELL_PADDING + 3 * (LISTING_CELL_PADDING + LISTING_CELL_ICON_HEIGHT);
}

@end
