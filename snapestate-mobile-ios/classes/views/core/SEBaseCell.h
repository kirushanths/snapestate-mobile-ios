//
//  SEBaseCell.h
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-04.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SECellBackground.h"
#import "SERowSeparator.h"

@interface SEBaseCell : UITableViewCell

@property (nonatomic, strong) SECellBackground *cellBackground;
@property (nonatomic, strong) SERowSeparator *cellDivider;

-(id)init;
-(void)initialize;
-(void)designCell;

+(CGFloat)heightForRow;
+(NSString *)reuseIdentifier;
+(NSString *)reuseIdentifierWithExtra:(NSString *)extra;

+(float)expectedHeightForText:(NSString *)text contrainedToWidth:(float)width;

@end
