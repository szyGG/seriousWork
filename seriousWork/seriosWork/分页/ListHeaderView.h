//
//  ListHeaderView.h
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import <UIKit/UIKit.h>
#import "SegmentView.h"


@interface ListHeaderView : UIView

@property (nonatomic ,strong) SegmentView *segmentView;

@property (nonatomic ,copy) void(^segmentControlSelect)(NSInteger index);

@end


