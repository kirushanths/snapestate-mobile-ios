//
//  THMAccessoryView.h
//  thm-ios-iphone
//
//  Created by Kirushanth on 2013-05-31.
//  Copyright (c) 2013 THM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEAccessoryView : UIControl
{
	UIColor *_accessoryColor;
	UIColor *_highlightedColor;
}

@property (nonatomic, retain) UIColor *accessoryColor;
@property (nonatomic, retain) UIColor *highlightedColor;

+ (SEAccessoryView *)accessoryWithColor:(UIColor *)color andFrame:(CGRect)frame;
+ (SEAccessoryView *)accessoryWithColor:(UIColor *)color;
+ (CGRect)accessoryFrame;

@end
