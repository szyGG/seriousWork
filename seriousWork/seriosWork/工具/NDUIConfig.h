//
//  NDUIConfig.h
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import <Foundation/Foundation.h>
#define NDUICONFIG [NDUIConfig shareInstance]

@interface NDUIConfig : NSObject


+(instancetype)shareInstance;

/**
    topicClolor
 */
@property (nonatomic,strong)UIColor * topicClolor;

/**
    backgroundCololr
 */
@property (nonatomic,strong)UIColor * backgroundCololr;




/**
 navigaBarTextColor 默认:白色
 */
@property (nonatomic,strong)UIColor * navigaBarTextColor;

/**
 navigaBarColor 默认:平台主题色
 */
@property (nonatomic,strong)UIColor * navigaBarColor;


/**
 navigaBarColor 默认:19
 */
@property (nonatomic,strong)UIFont * navigaTitleFont;

/**
    cell titleFont 默认15
 */
@property (nonatomic,strong)UIFont * titleFont;

/**
    cell detailFont 默认13
 */
@property (nonatomic,strong)UIFont * detailFont;

/**
  barBtnLabelFont 默认16
 */
@property (nonatomic,strong)UIFont * barBtnLabelFont;

/**
    titleColor  TEXT_COLOR_1
 */
@property (nonatomic,strong)UIColor * titleColor;

/**
    detailColor  TEXT_COLOR_3
 */
@property (nonatomic,strong)UIColor * detailColor;

/**
    barBtnLabelColor TEXT_COLOR_7
 */
@property (nonatomic,strong)UIColor * barBtnLabelColor;
@end

