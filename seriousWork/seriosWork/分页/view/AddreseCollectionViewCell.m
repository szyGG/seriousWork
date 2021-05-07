//
//  AddreseCollectionViewCell.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import "AddreseCollectionViewCell.h"

@implementation AddreseCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle]loadNibNamed:@"AddreseCollectionViewCell" owner:self options:nil].lastObject;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = TOPCAIL_COLOR;
    self.nameLabel.text = @"全部大区";
    self.nameLabel.textColor = WHITE_COLOR;
    
}

@end
