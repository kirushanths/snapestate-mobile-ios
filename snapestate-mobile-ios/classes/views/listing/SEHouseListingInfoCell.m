//
//  SEHouseListingInfoCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-03-02.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEHouseListingInfoCell.h"

@implementation SEHouseListingInfoCell

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	self.cellIcon.image = [UIImage imageNamed:@"icon_details.png"];
	[self.cellBackground addSubview:self.cellIcon];
}

#pragma mark -
#pragma mark Props

+ (CGFloat)heightForRow
{
	return 50;
}

@end
