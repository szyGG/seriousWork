//
//  ListHeaderView.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import "ListHeaderView.h"

@implementation ListHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WHITE_COLOR;
        self.segmentView = [[SegmentView alloc] init];
        [self addSubview:_segmentView];
        [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        __weak typeof(self) weakSelf = self;
        self.segmentView.indexChangeBlock = ^(NSUInteger index) {
            if (weakSelf.segmentControlSelect) {
                weakSelf.segmentControlSelect(index);
            }
        };
        self.segmentView.backgroundColor = TOPCAIL_COLOR;
    }
    return self;
}

@end
