//
//  ThreeButtonView.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/17.
//

#import "ThreeButtonView.h"

@implementation ThreeButtonView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WHITE_COLOR;
        [self initialUI];
    }
    return self;
}


- (void)initialUI
{
    CGFloat width = self.width / 3;
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.tag = i + 999;
        [btn setBackgroundColor:WHITE_COLOR];
        [btn setTitle:[self btnString:i] forState:UIControlStateNormal];
        [btn setTitleColor:TEXT_COLOR_3 forState:UIControlStateNormal];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.offset(0);
            make.width.offset(width);
            make.left.offset(i * width);
        }];
        if (i == 0) {
            [btn setTitleColor:TOPCAIL_COLOR forState:UIControlStateNormal];
        }
    }
    
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.offset(2);
    }];
    line.backgroundColor = BACKGROUND_COLOR;
}


- (NSString *)btnString:(NSInteger)tag
{
    NSString *day = @"";
    switch (tag) {
        case 0:
            day = @"销售";
            break;
        case 1:
            day = @"毛利";
            break;
        case 2:
            day = @"订货";
            break;

        default:
            break;
    }
    return day;
}

@end
