//
//  ScrollTableViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import "ScrollTableViewController.h"
#import "ScrollSonViewController.h"


@interface ScrollTableViewController ()<UIScrollViewDelegate,ScrollSonViewControllerDelegate>

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic ,strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray<ScrollSonViewController *> *vcArray;

@property (nonatomic ,assign) CGFloat startOffset;

@end

@implementation ScrollTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = TOPCAIL_COLOR;
    [self setHeadTitle];
    [self setSonController];
    [self makeScrollView];
}


- (void)setHeadTitle {
    ListHeaderView *headView = [[ListHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    self.headView = headView;
    [self.view addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(64);
    }];
    __weak typeof(self) weakSelf = self;
    headView.segmentControlSelect = ^(NSInteger index) {
        weakSelf.currentIndex = index;
        [weakSelf moveScrollView];
    };
    headView.segmentView.sectionTitles = self.titleArray;
    self.currentIndex = 0;
}

- (void)makeScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATOR_HEIGHT- self.headView.size.height)];
    self.scrollView.pagingEnabled  = YES;
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];
    [self.view sendSubviewToBack:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(self.headView.mas_bottom);
        make.bottom.offset(0);
    }];
    [self moveScrollView];
    
}


- (void)moveScrollView {
    self.scrollView.contentSize = CGSizeMake(self.titleArray.count * SCREEN_WIDTH, SCREEN_HEIGHT - self.headView.size.height - NAVIGATOR_HEIGHT);
    self.scrollView.contentOffset = CGPointMake(self.currentIndex * SCREEN_WIDTH, 0);
    [self setSonViewToScrollView];
}


- (void)setSonViewToScrollView {
    
    [self.vcArray enumerateObjectsUsingBlock:^(ScrollSonViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.scrollView addSubview:obj.view];
        [obj setNum:idx];
        [obj.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.height.offset(SCREEN_HEIGHT - self.headView.size.height - NAVIGATOR_HEIGHT);
            make.left.mas_equalTo(idx * SCREEN_WIDTH);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
    }];
}


- (NSArray *)titleArray
{
    return @[@"蔬菜",@"肉禽",@"水产",@"水果",@"食杂",@"鲜食",@"豆制"];
}


- (void)setSonController
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < self.titleArray.count; i++) {
        ScrollSonViewController *son = [[ScrollSonViewController alloc] init];
        son.delegate = self;
        [array addObject:son];
    }
    self.vcArray = array;
    
}


#pragma mark -- ScrollSonViewControllerDelegate
- (void)hiddenNavgation:(BOOL)show
{
    if (show && !self.navigationController.navigationBarHidden) {
        
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
        [self.headView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(20);
        }];
        [self.vcArray enumerateObjectsUsingBlock:^(ScrollSonViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj.view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.offset(SCREEN_HEIGHT - self.headView.size.height - 20);
            }];
        }];
        
    } else if (!show && self.navigationController.navigationBarHidden) {
        
        [self.vcArray enumerateObjectsUsingBlock:^(ScrollSonViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj.view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.offset(SCREEN_HEIGHT - self.headView.size.height - NAVIGATOR_HEIGHT);
            }];
        }];
        [self.headView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(0);
        }];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
        
    }
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
        if (offsety > self.startOffset && !self.navigationController.navigationBarHidden) {
            [self.navigationController setNavigationBarHidden:YES animated:YES];
            self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        }
        if (!IOS(11.0)) {
            [self.headView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_offset(20);
            }];
        }
    }
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    self.currentIndex = index;
    self.headView.segmentView.selectedSegmentIndex = index;
}


@end
