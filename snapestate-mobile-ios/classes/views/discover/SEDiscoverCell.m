//
//  SEDiscoverCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-08.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEDiscoverCell.h"
#import <QuartzCore/QuartzCore.h>

#define MAIN_LABEL_HEIGHT 25
#define SECOND_LABEL_HEIGHT 25
#define PADDING 10

@interface SEDiscoverCell ()

@property (nonatomic, strong) UIImageView *discoverImage;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIView *shadowFade;

@end

@implementation SEDiscoverCell

- (void)designCell
{
	[super designCell];
	[self.cellBackground addSubview:self.discoverImage];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self.cellBackground addSubview:self.shadowFade];
	[self.cellBackground addSubview:self.cityLabel];
	[self.cellBackground addSubview:self.infoLabel];
	[self.cellBackground addSubview:self.priceLabel];
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

- (UIView *)shadowFade
{
	CREATE_THREAD_SAFE_INSTANCE(_shadowFade, ^{
		_shadowFade = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 320, 100)];
		_shadowFade.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
		CAGradientLayer *gradientLayer = [CAGradientLayer layer];
		gradientLayer.masksToBounds = NO;
		gradientLayer.frame = _shadowFade.bounds;
		
		NSMutableArray *colors = [NSMutableArray array];
		[colors addObject:(id)[UIColor colorWithWhite:0.0f alpha:0.0f].CGColor];
		[colors addObject:(id)[UIColor colorWithWhite:0.0f alpha:1.0f].CGColor];
		
		gradientLayer.colors = colors;
		
		NSMutableArray *locations = [NSMutableArray array];
		[locations addObject:[NSNumber numberWithFloat:0.0f]];
		[locations addObject:[NSNumber numberWithFloat:1.0f]];
		
		gradientLayer.locations = locations;

		[_shadowFade.layer addSublayer:gradientLayer];
	});
}

- (UILabel *)priceLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_priceLabel, ^{
		float height = 40;
		float yloc = __blockself.bounds.size.height - height - (PADDING);
		_priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, yloc, __blockself.bounds.size.width - (PADDING * 2), height)];
		_priceLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
		[_priceLabel setFontRegularSize:25.0f];
		_priceLabel.text = @"$380,000";
		_priceLabel.textAlignment = NSTextAlignmentRight;
		[_priceLabel setTextColor:[UIColor whiteColor]];
	});
}

- (UILabel *)infoLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_infoLabel, ^{
		float yloc = __blockself.bounds.size.height - SECOND_LABEL_HEIGHT - (PADDING);
		_infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, yloc, __blockself.bounds.size.width - (PADDING * 2), SECOND_LABEL_HEIGHT)];
		_infoLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
		[_infoLabel setFontSize:18.0f];
		_infoLabel.text = @"2300 sq";
		[_infoLabel setTextColor:[UIColor whiteColor]];
	});
}

- (UILabel *)cityLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_cityLabel, ^{
		float yloc = __blockself.bounds.size.height - MAIN_LABEL_HEIGHT - SECOND_LABEL_HEIGHT - (PADDING);
		_cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, yloc, __blockself.bounds.size.width - (PADDING * 2), MAIN_LABEL_HEIGHT)];
		_cityLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
		[_cityLabel setFontSize:18.0f];
		_cityLabel.text = @"Toronto, ON";
		[_cityLabel setTextColor:[UIColor whiteColor]];
	});
}

+ (CGFloat)heightForRow
{
	return 200;
}

@end
