//
//  SEBaseCell.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-04.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEBaseCell.h"

@implementation SEBaseCell


-(id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[[self class] reuseIdentifier]];
    if (self) {
        [self initialize];
        [self designCell];
    }
    return self;
}

-(void)initialize
{
    self.clipsToBounds = YES;
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.autoresizesSubviews = YES;
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.contentView.autoresizesSubviews = YES;
    self.contentView.clipsToBounds = YES;
}

-(void)designCell {}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	UIView *bgColorView = [[UIView alloc] init];
	[self setSelectedBackgroundView:bgColorView];
	
	UIView *bgView = [[UIView alloc] initWithFrame:self.frame];
	self.backgroundView = bgView;
    
    [self.contentView addSubview:self.cellBackground];
    [self.contentView addSubview:self.cellDivider];
}

#pragma mark -
#pragma mark Selection / Highlight

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    [self.cellBackground setSelected:selected];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    [self.cellBackground setHighlighted:highlighted];
}

#pragma mark -
#pragma mark Property Accessors

- (SECellBackground *)cellBackground
{
    CREATE_THREAD_SAFE_INSTANCE(_cellBackground, ^{
        _cellBackground = [[SECellBackground alloc] initWithFrame:__blockself.bounds];
        _cellBackground.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _cellBackground.autoresizesSubviews = YES;
    });
}

- (SERowSeparator *)cellDivider
{
    CREATE_THREAD_SAFE_INSTANCE(_cellDivider, ^{
        _cellDivider = [[SERowSeparator alloc] initWithFrame:CGRectMake(0, __blockself.bounds.size.height - 1, __blockself.bounds.size.width, 1)];
        _cellDivider.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    });
}

#pragma mark -
#pragma mark Height/Reuse

+(CGFloat)heightForRow                                      { ThrowError(@"Not defined"); return 0; }
+(NSString *)reuseIdentifier                                { return NSStringFromClass([self class]); }
+(NSString *)reuseIdentifierWithExtra:(NSString *)extra     { return [NSString stringWithFormat:@"%@%@", [self reuseIdentifier], extra]; }

+(float)expectedHeightForText:(NSString *)text contrainedToWidth:(float)width { AbstractClassRequiresOverride; return 0; };



@end
