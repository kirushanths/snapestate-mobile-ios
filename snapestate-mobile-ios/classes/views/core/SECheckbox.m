//
//    UICheckbox.m
//
//    Author:    Brayden Wilmoth
//    Co-Author: Jordan Perry
//    Edited:    07/17/2012
//
//    Copyright (c) 2012 Brayden Wilmoth.  All rights reserved.
//    http://www.github.com/brayden/
//    http://www.github.com/jordanperry/
//

#import "SECheckbox.h"
#import "SEConstants.h"

#define THM_CHECKBOX_PADDING 5.0f

@interface SECheckbox ()
{
    BOOL loaded;
}

@end

@implementation SECheckbox

-(void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
}

-(void)drawRect:(CGRect)rect
{
    float radius = 2 * 2;
    UIColor *outerColor = SE_COLOR_BLUE_LIGHT_BG;
    UIColor *innerColor = SE_COLOR_BLUE;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
	
	float checkboxRadius = 20.0f;
	CGRect checkboxRect = CGRectMake((self.bounds.size.width - checkboxRadius) / 2.0f,
									 (self.bounds.size.height - checkboxRadius) / 2.0f, checkboxRadius, checkboxRadius);
    
    if (self.circle) {
        [outerColor setFill];
        CGContextFillEllipseInRect(context, checkboxRect);
        
         if (self.checked) {
             CGRect innerRect = CGRectInset(checkboxRect, 3.0f, 3.0f);
             [innerColor setFill];
             CGContextFillEllipseInRect(context, innerRect);
         }
    } else {
        CGContextBeginPath(context);
        [outerColor setFill];
        CGContextMoveToPoint(context, CGRectGetMinX(checkboxRect) + radius, CGRectGetMinY(checkboxRect));
        CGContextAddArc(context, CGRectGetMaxX(checkboxRect) - radius, CGRectGetMinY(checkboxRect) + radius, radius, 3 * M_PI / 2, 0, 0);
        CGContextAddArc(context, CGRectGetMaxX(checkboxRect) - radius, CGRectGetMaxY(checkboxRect) - radius, radius, 0, M_PI / 2, 0);
        CGContextAddArc(context, CGRectGetMinX(checkboxRect) + radius, CGRectGetMaxY(checkboxRect) - radius, radius, M_PI / 2, M_PI, 0);
        CGContextAddArc(context, CGRectGetMinX(checkboxRect) + radius, CGRectGetMinY(checkboxRect) + radius, radius, M_PI, 3 * M_PI / 2, 0);
        CGContextClosePath(context);
        CGContextFillPath(context);
    
        if (self.checked) {
            CGRect innerRect = CGRectInset(checkboxRect, 3.0f, 3.0f);
            
            context = UIGraphicsGetCurrentContext();
            CGContextBeginPath(context);
            [innerColor setFill];
            CGContextMoveToPoint(context, CGRectGetMinX(innerRect) + radius, CGRectGetMinY(innerRect));
            CGContextAddArc(context, CGRectGetMaxX(innerRect) - radius, CGRectGetMinY(innerRect) + radius, radius, 3.0f * M_PI / 2.0f, 0, 0);
            CGContextAddArc(context, CGRectGetMaxX(innerRect) - radius, CGRectGetMaxY(innerRect) - radius, radius, 0, M_PI / 2.0f, 0);
            CGContextAddArc(context, CGRectGetMinX(innerRect) + radius, CGRectGetMaxY(innerRect) - radius, radius, M_PI / 2.0f, M_PI, 0);
            CGContextAddArc(context, CGRectGetMinX(innerRect) + radius, CGRectGetMinY(innerRect) + radius, radius, M_PI, 3.0f * M_PI / 2.0f, 0);
            CGContextClosePath(context);
            CGContextFillPath(context);
        }
    }
    
    if (self.disabled) {
        self.userInteractionEnabled = YES;
        self.alpha = 0.7f;
    } else {
        self.userInteractionEnabled = NO;
        self.alpha = 1.0f;
    }
}

-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self setChecked:!self.checked];
    return TRUE;
}

-(void)setChecked:(BOOL)boolValue
{
    _checked = boolValue;
    [self setNeedsDisplay];
}

-(void)setDisabled:(BOOL)boolValue
{
    _disabled = boolValue;
    [self setNeedsDisplay];
}

@end

