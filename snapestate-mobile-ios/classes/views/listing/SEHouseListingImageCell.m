//
//  SEHouseListingImageCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-03-02.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEHouseListingImageCell.h"

@interface SEHouseListingImageCell ()

@property (nonatomic, strong) UIImageView *previewImage;

@end

@implementation SEHouseListingImageCell

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self.cellBackground addSubview:self.previewImage];
}

#pragma mark -
#pragma mark Props

- (UIImageView *)previewImage
{
	CREATE_THREAD_SAFE_INSTANCE(_previewImage, ^{
		_previewImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,
																	  __blockself.cellBackground.bounds.size.width,
																	  [SEHouseListingImageCell heightForRow])];
		_previewImage.contentMode = UIViewContentModeCenter;
		_previewImage.clipsToBounds = YES;
		_previewImage.backgroundColor = [UIColor blackColor];
		_previewImage.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		_previewImage.image = [UIImage imageNamed:@"discoverbg.jpeg"];
	});
}

+ (CGFloat)heightForRow
{
	return 200;
}

@end
