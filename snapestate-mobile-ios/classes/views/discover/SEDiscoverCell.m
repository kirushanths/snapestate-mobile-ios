//
//  SEDiscoverCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-08.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEDiscoverCell.h"

@interface SEDiscoverCell ()

@property (nonatomic, strong) UIImageView *discoverImage;

@end

@implementation SEDiscoverCell

- (void)designCell
{
	[super designCell];
	[self.cellBackground addSubview:self.discoverImage];
}

#pragma mark -
#pragma mark Property Accessors

- (UIImageView *)discoverImage
{
	CREATE_THREAD_SAFE_INSTANCE(_discoverImage, ^{
		_discoverImage = [[UIImageView alloc] initWithFrame:__blockself.bounds];
		_discoverImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		_discoverImage.contentMode = UIViewContentModeCenter;
		_discoverImage.image = [UIImage imageNamed:@"discoverbg.jpeg"];
	});
}

+ (CGFloat)heightForRow
{
	return 200;
}

@end
