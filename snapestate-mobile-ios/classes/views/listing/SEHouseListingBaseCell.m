//
//  SEHouseListingBaseInfoCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-03-02.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEHouseListingBaseCell.h"

@implementation SEHouseListingBaseCell

- (void)designCell
{
	[super designCell];
	self.cellDivider.hidden = YES;
}

#pragma mark -
#pragma Props

- (UIImageView *)cellIcon
{
	CREATE_THREAD_SAFE_INSTANCE(_cellIcon, ^{
		_cellIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, LISTING_CELL_PADDING, LISTING_CELL_ICON_WIDTH, LISTING_CELL_ICON_HEIGHT)];
		_cellIcon.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
		_cellIcon.backgroundColor = [UIColor clearColor];
		_cellIcon.contentMode = UIViewContentModeCenter;
		_cellIcon.alpha = 0.2;
		_cellIcon.image = [UIImage imageNamed:@"icon_location.png"];
	});
}


@end
