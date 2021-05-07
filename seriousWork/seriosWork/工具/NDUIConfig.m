//
//  NDUIConfig.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import "NDUIConfig.h"
#import "NDColorTool.h"

@implementation NDUIConfig
static NDUIConfig *_config = nil;
+(instancetype)alloc
{
    if (_config == nil)
    {
        _config = [super alloc];
    }
    return _config;
}
// 为了使实例易于外界访问 我们一般提供一个类方法
// 类方法命名规范 share类名|default类名|类名
+(instancetype)shareInstance
{
    // 也可以使用一次性代码
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_config == nil) {
            _config = [[super alloc] init];
        }
    });
    return _config;
}
// 为了严谨，也要重写copyWithZone 和 mutableCopyWithZone
-(id)copyWithZone:(NSZone *)zone
{
    return _config;
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return _config;
}
/**
 一些配置的相关初始化
 
 */
- (instancetype)init
{
    if (_config == nil)
    {
        _config = [super init];
        
        self.topicClolor = COLOR(@"0x35BBFF");
        self.backgroundCololr = COLOR(@"0xf5f5f5");
        self.navigaBarTextColor = [UIColor whiteColor];
        self.navigaBarColor =  COLOR(@"0x35BBFF");
        self.titleColor = COLOR(@"0x222222");
        self.detailColor = TEXT_COLOR_FF8181;
        self.barBtnLabelColor = COLOR(@"0x323232");
        
        
        self.navigaTitleFont = FONT(19);
        self.titleFont = FONT(15);
        self.detailFont = FONT(13);
        self.barBtnLabelFont = FONT(16);
    }
    return _config;
}
@end

