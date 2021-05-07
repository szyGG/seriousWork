//
//  ScrollSonViewController.h
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import "BaseViewController.h"

@protocol ScrollSonViewControllerDelegate <NSObject>

- (void)hiddenNavgation:(BOOL)show;

@end

@interface ScrollSonViewController : BaseViewController

@property (nonatomic ,assign) BOOL isInitial; //是否第一次初始化 默认NO

@property (nonatomic ,weak) id<ScrollSonViewControllerDelegate> delegate;

- (void)setNum:(NSInteger)type;



@end


