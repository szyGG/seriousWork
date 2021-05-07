//
//  Wheel.h
//  seriousWork
//
//  Created by 史宗运 on 2021/4/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Wheel : UIView
@property (weak, nonatomic) IBOutlet UIImageView *backView;

- (void)startRotating;

- (void)stopRotating;

@end

NS_ASSUME_NONNULL_END
