//
//    UICheckbox.h
//
//    Author:    Brayden Wilmoth
//    Co-Author: Jordan Perry
//    Edited:    07/17/2012
//
//    Copyright (c) 2012 Brayden Wilmoth.  All rights reserved.
//    http://www.github.com/brayden/
//    http://www.github.com/jordanperry/
//

#import <UIKit/UIKit.h>

@interface SECheckbox : UIControl

@property (nonatomic, assign) BOOL checked;
@property (nonatomic, assign) BOOL disabled;
@property (nonatomic, assign) BOOL circle;
@property (nonatomic, strong) NSString *text;

- (void)setChecked:(BOOL)boolValue;
- (void)setDisabled:(BOOL)boolValue;
- (void)setCircle:(BOOL)boolValue;

@end
