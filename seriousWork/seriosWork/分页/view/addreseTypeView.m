//
//  addreseTypeView.m
//  seriousWork
//
//  Created by 史宗运 on 2021/4/15.
//

#import "addreseTypeView.h"
#import "AddreseCollectionViewCell.h"

@interface addreseTypeView()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) UICollectionView *collectionView;

@property (nonatomic ,strong) NSArray *dataArray;

@end

@implementation addreseTypeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialUI];
    }
    return self;
}


- (void)initialUI
{
    self.backgroundColor = TOPCAIL_COLOR;
    [self.collectionView registerClass:[AddreseCollectionViewCell class] forCellWithReuseIdentifier:@"AddreseCollectionViewCell"];
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.right.offset(-100);
    }];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.top.offset(20);
        make.bottom.offset(-20);
        make.left.equalTo(self.collectionView.mas_right).offset(20);
    }];
    btn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    btn.titleLabel.font = TEXT_FONT_15;
    btn.layer.cornerRadius = 10;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"筛选 ^" forState:UIControlStateNormal];
    [btn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
    
}


-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //设置同一列中间隔的cell最小间距
        layout.minimumInteritemSpacing = 5.f;
        //设置最小行间距
        layout.minimumLineSpacing = 5.f;
        layout.sectionInset = UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f);
        layout.itemSize = CGSizeMake(80, 60);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = TOPCAIL_COLOR;
        
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
    
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   // AddreseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddreseCollectionViewCell" forIndexPath:indexPath];
    AddreseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddreseCollectionViewCell" forIndexPath:indexPath];
  // cell.name.text = @"全部大区";
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, self.height);
}


- (void)select
{
    
}

@end
