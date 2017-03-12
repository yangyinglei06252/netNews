//
//  NewsTableViewCell.m
//  netNews
//
//  Created by yangyinglei on 2017/3/11.
//  Copyright © 2017年 yangyinglei. All rights reserved.
//

#import "NewsTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "ImagesModel.h"
#import <YYModel.h>
/*
 /// 新闻标题
 @property (nonatomic,copy) NSString *title;
 /// 新闻图标
 @property (nonatomic,copy) NSString *imgsrc;
 /// 新闻来源
 @property (nonatomic,copy) NSString *source;
 /// 新闻回复数
 @property (nonatomic, assign)  NSInteger replyCount;
 /// 多张配图
 @property (nonatomic, strong) NSArray *imgextra;
 /// 大图标记
 @property (nonatomic, assign) BOOL imgType;
 
 */
@interface NewsTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UILabel *labSource;
@property (weak, nonatomic) IBOutlet UILabel *labReplyCount;
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imagesViewArr;

@end

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imgsrcView.contentMode = UIViewContentModeScaleAspectFill;
    self.imgsrcView.clipsToBounds = YES;
}

- (void)setNewsmodel:(newsModel *)newsmodel {
    _newsmodel = newsmodel;
    
    NSURL *url = [NSURL URLWithString:newsmodel.imgsrc];
    [_imgsrcView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    _labTitle.text = newsmodel.title;
    _labSource.text = newsmodel.source;
    _labReplyCount.text = [NSString stringWithFormat:@"%zd",newsmodel.replyCount];

    for (int i = 0; i < self.imagesViewArr.count; i++) {
        ImagesModel *imageModel = newsmodel.imgextra[i];
        
        UIImageView *imageView = self.imagesViewArr[i];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageModel.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
        imageView.clipsToBounds = YES;
    }
    
}


@end
