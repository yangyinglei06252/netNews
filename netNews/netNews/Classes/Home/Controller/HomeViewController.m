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

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIScrollView *MuluScrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray<MuLuNewsModel *> *muluArray;

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
    
}

-(void) setupMuluScrollView{
    
    CGFloat labelW = 100;
    CGFloat labelH = 44;
    for (int i = 0; i < _muluArray.count; i++) {
        UILabel *muluLable = [[UILabel alloc] initWithFrame:CGRectMake(labelW * i, 0, labelW, labelH)];
        muluLable.text = _muluArray[i].tname;

        muluLable.backgroundColor = [UIColor lightGrayColor];
        [_MuluScrollView addSubview: muluLable];
        muluLable.textAlignment = NSTextAlignmentCenter;
        muluLable.font = [UIFont systemFontOfSize:15];
    }
    _MuluScrollView.contentSize = CGSizeMake(labelW * _muluArray.count, 0);
    _MuluScrollView.showsVerticalScrollIndicator = NO;
    _MuluScrollView.showsHorizontalScrollIndicator = NO;
    _MuluScrollView.bounces = NO;
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
#pragma mark - 1.0数据源方法
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
@end
