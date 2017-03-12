//
//  HomeViewController.m
//  netNews
//
//  Created by yangyinglei on 2017/3/10.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "HomeViewController.h"
#import "MuLuNewsModel.h"
#import <YYModel.h>
#import "YYLCollectionViewCell.h"
#import "MuluLable.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *MuluScrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray<MuLuNewsModel *> *muluArray;
@property (nonatomic, strong) MuluLable *muluLable;
@property (nonatomic, strong) NSMutableArray<MuluLable *> *muluLableArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadData];
    [self setupMuluScrollView];
    [self setupCollectionView];
}

-(void) loadData{
    
    _muluArray = [MuLuNewsModel loadMuluData];
    _muluLableArr = [NSMutableArray array];
}

-(void) setupMuluScrollView{
    
    CGFloat labelW = 100;
    CGFloat labelH = 44;
    for (int i = 0; i < _muluArray.count; i++) {
        _muluLable = [[MuluLable alloc] initWithFrame:CGRectMake(labelW * i, 0, labelW, labelH)];
        _muluLable.text = _muluArray[i].tname;
        [_muluLableArr addObject:_muluLable];
        
        _muluLable.backgroundColor = [UIColor lightGrayColor];
        [_MuluScrollView addSubview: _muluLable];
        _muluLable.textAlignment = NSTextAlignmentCenter;
        _muluLable.font = [UIFont systemFontOfSize:15];
        _muluLable.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabelAction:)];
        [_muluLable addGestureRecognizer:tap];
        _muluLable.tag = i;
        if (_muluLable.tag == 0) {
            [_muluLable setStateWithPercent:1];
        }
    }
    _MuluScrollView.contentSize = CGSizeMake(labelW * _muluArray.count, 0);
    _MuluScrollView.showsVerticalScrollIndicator = NO;
    _MuluScrollView.showsHorizontalScrollIndicator = NO;
    _MuluScrollView.bounces = NO;
    
    
}
#pragma mark - 1.0点击Label的事件
-(void) tapLabelAction:(UITapGestureRecognizer *)tapGesture{
    
    MuluLable *muluLabel = (MuluLable *)tapGesture.view;

    [self labelMoveAction:muluLabel];

    CGFloat offsetX = muluLabel.tag * self.view.bounds.size.width;
    [self.collectionView setContentOffset:CGPointMake(offsetX, 0) animated:NO];
    
    for (MuluLable *label in _muluLableArr) {
        if (label == muluLabel) {
            [label setStateWithPercent:1];
        }else {
            [label setStateWithPercent:0];
        }
    }
    
    
}
//label滚动的动画
-(void) labelMoveAction:(MuluLable *)muluLabel{
    
    CGFloat offsetX = muluLabel.center.x - self.view.bounds.size.width *0.5;
    
    CGFloat offsetMinX = 0;
    CGFloat offsetMaxX = _MuluScrollView.contentSize.width - self.view.bounds.size.width;
    if (offsetX < offsetMinX) {
        offsetX = offsetMinX;
    }else if (offsetX > offsetMaxX){
        offsetX = offsetMaxX;
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        
        _MuluScrollView.contentOffset = CGPointMake(offsetX, 0);
    }];
}



-(void) setupCollectionView{
    
    self.flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - 44 - 64);
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //关闭预加载
    self.collectionView.prefetchingEnabled = NO;
    self.collectionView.bounces = NO;
}
#pragma mark - 数据源方法 及 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.muluArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    YYLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    MuLuNewsModel *muluModel = _muluArray[indexPath.item];
    NSString *urlStr = [NSString stringWithFormat:@"%@/0-20.html",muluModel.tid];
    cell.urlStr = urlStr;
    
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int intIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    MuluLable *muluLabel = _muluLableArr[intIndex];
    [self labelMoveAction:muluLabel];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat floatIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    int intIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    CGFloat percent = floatIndex - intIndex;
    CGFloat rightPercent = percent;
    CGFloat leftPercent = 1 - percent;
    
    MuluLable *leftLabel = _muluLableArr[intIndex];
    if (intIndex < _muluLableArr.count - 1) {
        MuluLable *rightLabel = _muluLableArr[intIndex + 1];
        [leftLabel setStateWithPercent:leftPercent];
        [rightLabel setStateWithPercent:rightPercent];
    }
  
}


@end
