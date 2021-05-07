//
//  SegmentView.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import "SegmentView.h"

@implementation SegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}


- (void)configUI
{
    self.type = HMSegmentedControlTypeText;
    self.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationBottom;
    self.selectionIndicatorColor = UIColor.redColor;
    self.selectionIndicatorHeight = 2.0;
    self.titleTextAttributes = @{NSFontAttributeName: TEXT_FONT_17,NSForegroundColorAttributeName: UIColor.redColor};
    self.stretchSegmentsToScreenSize = YES;
    
}


@end
