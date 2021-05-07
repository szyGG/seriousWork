//
//  currentTimeView.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/16.
//

#import "currentTimeView.h"

@implementation currentTimeView

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
    CGFloat width = self.width / 5;
    for (int i = 0; i < 5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.tag = i + 999;
        [btn setBackgroundColor:BACKGROUND_COLOR];
        [btn setTitle:[self btnString:i] forState:UIControlStateNormal];
        [btn setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.offset(0);
            make.width.offset(width);
            make.left.offset(i * width);
        }];
        if (i == 0) {
            [btn setBackgroundColor:WHITE_COLOR];
        }
    }
}


- (NSString *)btnString:(NSInteger)tag
{
    NSString *day = @"";
    switch (tag) {
        case 0:
            day = @"实时";
            break;
        case 1:
            day = @"昨日";
            break;
        case 2:
            day = @"本周";
            break;
        case 3:
            day = @"本月";
            break;
        case 4:
            day = @"自定义";
            break;

        default:
            break;
    }
    return day;
}


@end
