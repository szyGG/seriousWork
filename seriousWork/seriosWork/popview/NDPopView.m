//
//  NDPopView.m
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import "NDPopView.h"
#import "UIView+ViewFrameGeometry.h"
//#import "Masonry.h"
#import "SeriousHeader.h"
@implementation NDPopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.alphaComponent = 0.4;
        
    }
    return self;
}


-(void)addInView:(UIView *)view withContentView:(UIView *)contentView
{
    self.contentView = contentView;
    self.backgroundView = view;
    
    self.frame = view.bounds;
    [self addSubview:contentView];
    self.hidden = YES;
    self.contentView.hidden = YES;
    
    [view addSubview:self];
    [view bringSubviewToFront:self];
    
    contentView.top = self.height;
    contentView.left = (self.width - contentView.width) / 2.0;
}


- (void)showWithDidShowBlock:(__NDPopupDidShowBlock)block {
    
    self.hidden = NO;
    self.contentView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.top = self.height - self.contentView.height - self.insets.bottom;
    }];
    if (block) {
        block(self);
    }
}


@end
