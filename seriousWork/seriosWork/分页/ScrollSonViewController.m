//
//  ScrollSonViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import "ScrollSonViewController.h"
#import "addreseTypeView.h"
#import "currentTimeView.h"
#import "ThreeButtonView.h"
#import "ThreeButtonTableViewCell.h"

@interface ScrollSonViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) addreseTypeView *addreseView;

@property (nonatomic ,strong) currentTimeView *currentTimeView;

@property (nonatomic ,strong) ThreeButtonView *ThreeButtonView;

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,assign) CGFloat startOffset;


@end

@implementation ScrollSonViewController {
    CGFloat _firstOffset; //第一个需要变化的偏移量
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _firstOffset = 80;
    
    [self initialUI];
}


- (void)initialUI
{
    self.addreseView = [[addreseTypeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    [self.view addSubview:self.addreseView];
    [self.addreseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(60);
    }];
    
    self.currentTimeView = [[currentTimeView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 50)];
    [self.view addSubview:self.currentTimeView];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.currentTimeView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.currentTimeView.bounds;
    layer.path = maskPath.CGPath;
    self.currentTimeView.layer.mask = layer;
    [self.currentTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.mas_equalTo(self.addreseView.mas_bottom);
        make.height.offset(50);
    }];
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.equalTo(self.currentTimeView.mas_bottom).offset(0);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:@"ThreeButtonTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThreeButtonTableViewCell"];
    
    self.ThreeButtonView = [[ThreeButtonView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [self.view addSubview:self.ThreeButtonView];
    self.ThreeButtonView.hidden = YES;
    [self.ThreeButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.offset(44);
        make.top.equalTo(self.currentTimeView.mas_bottom).offset(0);
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThreeButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeButtonTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return UIView.new;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, SCREEN_WIDTH - 30, 100)];
        img.image = [UIImage imageNamed:@"sale"];
        return img;
    }
    return UIView.new;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 125;
    }
    return CGFLOAT_MIN;
}


- (void)setNum:(NSInteger)type
{
    switch (type) {
        case 0:
            self.view.backgroundColor = TOPCAIL_COLOR;
            break;
        case 1:
            self.view.backgroundColor = RED_COLOR;
            break;
        case 2:
            self.view.backgroundColor = GREEN_HIGHLIGHTED;
            break;
        default:
            self.view.backgroundColor = BACKGROUND_COLOR;
            break;
    }
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = WHITE_COLOR;
        _tableView.estimatedRowHeight = 44;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
    }
    return _tableView;
}


#pragma mark -- scrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:UITableView.class]) {
        self.startOffset = scrollView.contentOffset.y;
    }
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsety = scrollView.contentOffset.y;
    if ([scrollView isKindOfClass:UITableView.class] && scrollView.dragging) {
        //导航的
        if (offsety > self.startOffset) {
            if ([self.delegate respondsToSelector:@selector(hiddenNavgation:)]) {
                [self.delegate hiddenNavgation:YES];
            }
        } else if (offsety < self.startOffset) {
            if ([self.delegate respondsToSelector:@selector(hiddenNavgation:)]) {
                [self.delegate hiddenNavgation:NO];
            }
        }
        
        //第一行偏移监听
        if (offsety > _firstOffset) {
            [UIView animateWithDuration:0.5 animations:^{
                self.addreseView.hidden = YES;
                [self.addreseView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.offset(0);
                }];
            } completion:^(BOOL finished) {
                self.ThreeButtonView.hidden = NO;
            }];
        } else {
            [UIView animateWithDuration:0.5 animations:^{
                self.ThreeButtonView.hidden = YES;
                self.addreseView.hidden = NO;
                [self.addreseView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.offset(60);
                }];
            } completion:^(BOOL finished) {

            }];
        }
        
        
    }

    
}


@end
