//
//  SETextFieldVIew.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-01.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SETextFieldView.h"

@implementation SETextFieldView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.layer.cornerRadius = 2.0;
		self.backgroundColor = [UIColor whiteColor];
		self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
		self.textField = [[SETextField alloc] initWithFrame:CGRectInset(self.bounds, 5.0f, 10.0f)];
		[self addSubview:self.textField];
    }
    return self;
}

- (void)resignKeyboard
{
	[self.textField resignKeyboard];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textField becomeFirstResponder];
}


@end
