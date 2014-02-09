//
//  SEDiscoverCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-08.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEDiscoverCell.h"
#import <QuartzCore/QuartzCore.h>

#define MAIN_LABEL_HEIGHT 20
#define SECOND_LABEL_HEIGHT 20
#define PADDING 10
#define HEART_WIDTH 60

@interface SEDiscoverCell ()

@property (nonatomic, strong) UIImageView *discoverImage;

@property (nonatomic, strong) UIImageView *heartIcon;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIView *shadowFade;

@end

@implementation SEDiscoverCell

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self.cellBackground addSubview:self.discoverImage];
	[self.cellBackground addSubview:self.shadowFade];
	[self.cellBackground addSubview:self.heartIcon];
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

- (UIImageView *)heartIcon
{
	CREATE_THREAD_SAFE_INSTANCE(_heartIcon, ^{
		float xloc = __blockself.bounds.size.width - HEART_WIDTH;
		float yloc = __blockself.bounds.size.height - HEART_WIDTH;
		_heartIcon = [[UIImageView alloc] initWithFrame:CGRectMake(xloc, yloc, HEART_WIDTH, HEART_WIDTH)];
		_heartIcon.contentMode = UIViewContentModeCenter;
		_heartIcon.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
		_heartIcon.image = [UIImage imageNamed:@"icon_heart.png"];
		[_heartIcon setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.5f]];
	});
}

- (UIView *)shadowFade
{
	CREATE_THREAD_SAFE_INSTANCE(_shadowFade, ^{
		_shadowFade = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
		_shadowFade.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
		CAGradientLayer *gradientLayer = [CAGradientLayer layer];
		gradientLayer.masksToBounds = NO;
		gradientLayer.frame = _shadowFade.bounds;
		
		NSMutableArray *colors = [NSMutableArray array];
		[colors addObject:(id)[UIColor colorWithWhite:0.0f alpha:0.0f].CGColor];
		[colors addObject:(id)[UIColor colorWithWhite:0.0f alpha:1.0f].CGColor];
		
		gradientLayer.colors = colors;
		
		NSMutableArray *locations = [NSMutableArray array];
		[locations addObject:[NSNumber numberWithFloat:0.5f]];
		[locations addObject:[NSNumber numberWithFloat:1.0f]];
		
		gradientLayer.locations = locations;

		[_shadowFade.layer addSublayer:gradientLayer];
	});
}

- (UILabel *)priceLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_priceLabel, ^{
		float width = __blockself.bounds.size.width - HEART_WIDTH - (PADDING);
		float yloc = __blockself.bounds.size.height - HEART_WIDTH;
		_priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, yloc, width, HEART_WIDTH)];
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
		[_infoLabel setFontSize:15.0f];
		_infoLabel.text = @"2300 sq";
		[_infoLabel setTextColor:[UIColor whiteColor]];
//		[_infoLabel setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.5f]];
	});
}

- (UILabel *)cityLabel
{
	CREATE_THREAD_SAFE_INSTANCE(_cityLabel, ^{
		float yloc = __blockself.bounds.size.height - MAIN_LABEL_HEIGHT - SECOND_LABEL_HEIGHT - (PADDING);
		_cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(PADDING, yloc, __blockself.bounds.size.width - (PADDING * 2), MAIN_LABEL_HEIGHT)];
		_cityLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
		[_cityLabel setFontSize:15.0f];
		_cityLabel.text = @"Toronto, ON";
		[_cityLabel setTextColor:[UIColor whiteColor]];
//		[_cityLabel setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.5f]];
	});
}

+ (CGFloat)heightForRow
{
	return 200;
}

@end
