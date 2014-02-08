//
//  SETextFieldVIew.h
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-01.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SETextField.h"

@interface SETextFieldView : UIView

@property (nonatomic, strong) SETextField *textField;

- (void)resignKeyboard;

@end
