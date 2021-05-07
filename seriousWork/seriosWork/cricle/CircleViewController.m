//
//  CircleViewController.m
//  seriousWork
//
//  Created by 史宗运 on 2020/12/28.
//

#import "CircleViewController.h"
#import "DataCollectionViewCell.h"

@interface CircleViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic ,strong) UICollectionView *collectionView;

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息";
    // Do any additional setup after loading the view.
}
//
//
//- (UICollectionView *)collectionView
//{
//    if (!_collectionView) {
//        UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
//        layout.collectionView.
//        
//        
//    }
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
