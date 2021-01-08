//
//  NDPopView.h
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import <UIKit/UIKit.h>
@class NDPopView;

typedef void(^__NDPopupDidShowBlock)(NDPopView *view);
typedef void(^__NDPopupDidHiddenBlock)(NDPopView *view);

@interface NDPopView : UIView

@property (nonatomic ,strong) UIView *contentView;

@property (nonatomic ,strong) UIView *backgroundView;

@property (nonatomic,assign) CGFloat alphaComponent;

/**
 显示的偏移量
 */
@property (nonatomic,assign)UIEdgeInsets insets;

-(void)addInView:(UIView *)view withContentView:(UIView *)contentView;

-(void)showWithDidShowBlock:(__NDPopupDidShowBlock)block;

-(void)hiddenWithDidHiddenBlock:(__NDPopupDidHiddenBlock)hidenBlock;

@end


