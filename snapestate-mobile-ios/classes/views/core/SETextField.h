//
//  SETextField.h
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-01.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SETextField : UITextField

-(void)resignKeyboard;
-(void)clearText;
-(void)ignoreTextInput;

@end
