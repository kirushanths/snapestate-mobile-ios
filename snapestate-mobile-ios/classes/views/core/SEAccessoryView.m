//
//  THMAccessoryView.m
//  thm-ios-iphone
//
//  Created by Kirushanth on 2013-05-31.
//  Copyright (c) 2013 THM. All rights reserved.
//

#import "SEAccessoryView.h"

@implementation SEAccessoryView

@synthesize accessoryColor = _accessoryColor;
@synthesize highlightedColor = _highlightedColor;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (SEAccessoryView *)accessoryWithColor:(UIColor *)color
{
    return [self accessoryWithColor:color andFrame:[self accessoryFrame]];
}

+ (SEAccessoryView *)accessoryWithColor:(UIColor *)color andFrame:(CGRect)frame
{
	SEAccessoryView *ret = [[[self class] alloc] initWithFrame:frame];
	ret.accessoryColor = color;
	return ret;
}

+ (CGRect)accessoryFrame
{
    return CGRectMake(0, 0, 11.0, 15.0);
}

- (void)drawRect:(CGRect)rect
{
	// (x,y) is the tip of the arrow
	CGFloat x = CGRectGetMaxX(self.bounds) - 3.0;
	CGFloat y = CGRectGetMidY(self.bounds);
	const CGFloat R = 7;
	CGContextRef ctxt = UIGraphicsGetCurrentContext();
	CGContextMoveToPoint(ctxt, x-R, y-R);
	CGContextAddLineToPoint(ctxt, x, y);
	CGContextAddLineToPoint(ctxt, x-R, y+R);
	CGContextSetLineCap(ctxt, kCGLineCapSquare);
	CGContextSetLineJoin(ctxt, kCGLineJoinMiter);
	CGContextSetLineWidth(ctxt, 1.5);
	
	if (self.highlighted) {
		[self.highlightedColor setStroke];
	} else {
		[self.accessoryColor setStroke];
	}
	
	CGContextStrokePath(ctxt);
}

- (void)setHighlighted:(BOOL)highlighted
{
	[super setHighlighted:highlighted];
	[self setNeedsDisplay];
}

- (UIColor *)accessoryColor
{
	if (!_accessoryColor) {
		return [UIColor grayColor];
	}
	
	return _accessoryColor;
}

- (UIColor *)highlightedColor
{
	if (!_highlightedColor) {
		return [UIColor blackColor];
	}
	
	return _highlightedColor;
}

@end
