//
//  draw2ViewController.h
//  seriousWork
//
//  Created by 史宗运 on 2021/4/18.
//

#import <UIKit/UIKit.h>
#import "MyPaintView2.h"
NS_ASSUME_NONNULL_BEGIN

@interface draw2ViewController : UIViewController

@property (weak, nonatomic) IBOutlet MyPaintView2 *paintView;
@property (weak, nonatomic) IBOutlet UISlider *slider;


@end

NS_ASSUME_NONNULL_END
