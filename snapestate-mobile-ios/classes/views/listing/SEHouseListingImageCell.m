//
//  SEHouseListingImageCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-03-02.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEHouseListingImageCell.h"
#import "iCarousel.h"
#import "FXPageControl.h"
#import "ILTranslucentView.h"

#define PAGE_CONTROL_HEIGHT 36

@interface SEHouseListingImageCell () <iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, strong) FXPageControl *pageControl;
@property (nonatomic, strong) UIView *shadowFade;
@property (nonatomic, strong) ILTranslucentView *blurView;

@end

@implementation SEHouseListingImageCell

- (void)initialize
{
	[super initialize];
	self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self.cellBackground setBaseBackgroundColor:SE_COLOR_GRAY_BLUE_DARK];
	[self.cellBackground addSubview:self.carousel];
//	[self.cellBackground addSubview:self.shadowFade];
	[self.cellBackground addSubview:self.blurView];
	[self.cellBackground addSubview:self.pageControl];
}

#pragma mark -
#pragma mark Carousel Delegate

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
	return [self createTempImage:index + 2];
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
	self.pageControl.currentPage = carousel.currentItemIndex;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
	switch (option) {
		case iCarouselOptionSpacing:
			return 1.00;
		case iCarouselOptionWrap:
			return 0;
		case iCarouselOptionFadeMin:
			return 0.0f;
		case iCarouselOptionFadeMax:
			return 0.0f;
		case iCarouselOptionFadeMinAlpha:
			return 1.0f;
		default:
			return value;
	}
}

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
	return 3;
}

#pragma mark -
#pragma mark Props

- (iCarousel *)carousel
{
	CREATE_THREAD_SAFE_INSTANCE(_carousel, ^{
		_carousel = [[iCarousel alloc] initWithFrame:__blockself.cellBackground.bounds];
		_carousel.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.8f];
		_carousel.type = iCarouselTypeLinear;
		_carousel.delegate = __blockself;
		_carousel.dataSource = __blockself;
		_carousel.decelerationRate = 0.3;
		_carousel.pagingEnabled = YES;
		_carousel.bounces = YES;
		_carousel.bounceDistance = 0.10;
		_carousel.stopAtItemBoundary = YES;
		_carousel.ignorePerpendicularSwipes = YES;
		_carousel.vertical = NO;
		_carousel.scrollSpeed = 2.0;
		_carousel.clipsToBounds = YES;
	});
}

- (UIImageView *)createTempImage:(int)index
{
	UIImageView *_previewImage;
	_previewImage = [[UIImageView alloc] initWithFrame:self.carousel.bounds];
	_previewImage.contentMode = UIViewContentModeCenter;
	_previewImage.clipsToBounds = YES;
	_previewImage.backgroundColor = [UIColor blackColor];
	_previewImage.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	_previewImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"home%d.jpg", index]];
	return _previewImage;
}

- (FXPageControl *)pageControl
{
	CREATE_THREAD_SAFE_INSTANCE(_pageControl, ^{
		_pageControl = [[FXPageControl alloc] initWithFrame:CGRectMake(0, ViewHeight(__blockself.cellBackground) - PAGE_CONTROL_HEIGHT,
																	   ViewWidth(__blockself.cellBackground),
																	   PAGE_CONTROL_HEIGHT)];
		_pageControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
		_pageControl.numberOfPages = 3;
		_pageControl.backgroundColor = [UIColor clearColor];
		[_pageControl setDotColor:[UIColor colorWithWhite:1.0f alpha:0.5f]];
		[_pageControl setSelectedDotColor:[UIColor whiteColor]];
		[_pageControl setUp];
	});
}

- (UIView *)shadowFade
{
	CREATE_THREAD_SAFE_INSTANCE(_shadowFade, ^{
		_shadowFade = [[UIView alloc] initWithFrame:__blockself.cellBackground.bounds];
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

- (ILTranslucentView *)blurView
{
	CREATE_THREAD_SAFE_INSTANCE(_blurView, ^{
		_blurView = [[ILTranslucentView alloc] initWithFrame:__blockself.pageControl.frame];
		if (SYSTEM_VERSION_MIN_SDK_7) {
			_blurView.translucentAlpha = 1.0f;
			_blurView.translucentTintColor = [UIColor clearColor];
			_blurView.backgroundColor = [SE_COLOR_GRAY_BLUE_DARK colorWithAlphaComponent:0.3f]; // [UIColor colorWithRed:0.93f green:0.95f blue:0.96f alpha:0.4f];
		} else {
			_blurView.backgroundColor = [SE_COLOR_GRAY_BLUE_DARK colorWithAlphaComponent:0.9f]; // [UIColor colorWithRed:0.93f green:0.95f blue:0.96f alpha:0.8f];
		}
	});
}

+ (CGFloat)heightForRow
{
	return 200;
}

@end
