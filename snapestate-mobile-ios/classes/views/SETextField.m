//
//  SETextField.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-01.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SETextField.h"
#import "SEConstants.h"

@implementation SETextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		self.borderStyle = UITextBorderStyleNone;
		self.placeholder = @"Type your response";
		self.keyboardAppearance = UIKeyboardAppearanceDefault;
		self.clearsOnBeginEditing = NO;
		self.clearButtonMode = UITextFieldViewModeAlways;
		self.backgroundColor = [UIColor clearColor];
		
		self.spellCheckingType = UITextSpellCheckingTypeYes;
		self.autocapitalizationType = UITextAutocapitalizationTypeSentences;
		self.autocorrectionType = UITextAutocorrectionTypeYes;
		self.returnKeyType = UIReturnKeyGo;
		
		[self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
		
		//		self.inputAccessoryView = [self keyboardToolbar];
		
		if (SYSTEM_VERSION_MIN_SDK_6) {
			self.clearsOnInsertion = NO;
		}
    }
    return self;
}

-(void)ignoreTextInput
{
    self.spellCheckingType = UITextSpellCheckingTypeNo;
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
}

#pragma mark KeyboardToolBar Actions

-(void)resignKeyboard
{
	[self resignFirstResponder];
}

-(void)clearText
{
    self.text = @"";
}

#pragma mark Property Accessors

-(UIToolbar *)keyboardToolbar
{
    UIToolbar *keyboardToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
    
//    THMSmallButton *clearButton = [[THMSmallButton alloc] initWithTitle:@"Clear" andTarget:self andAction:@selector(clearText)];
//    THMSmallButton *doneButton = [[THMSmallButton alloc] initWithTitle:@"Done" andTarget:self andAction:@selector(resignKeyboard)];
//    
//    UIBarButtonItem *leftSep = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    leftSep.width = -10;
//    UIBarButtonItem *rightSep = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    rightSep.width = -10;
//    
//    keyboardToolbar.items = [NSArray arrayWithObjects:leftSep,
//                             [[UIBarButtonItem alloc] initWithCustomView:clearButton],
//                             [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
//                             [[UIBarButtonItem alloc] initWithCustomView:doneButton], rightSep, nil];
    [keyboardToolbar sizeToFit];
    return keyboardToolbar;
}


@end
