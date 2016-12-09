//
//  NewCell.h
//  xunwen
//
//  Created by 小强 on 16/11/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "newModel.h"
#import "UIImageView+WebCache.h"

@interface NewCell : UITableViewCell

@property (nonatomic,strong) UIView *view;
//图片
@property (strong, nonatomic) UIImageView *NewImage;
 //标题
@property (strong, nonatomic)  UILabel *NewTitle;
 //摘要内容
@property (strong, nonatomic)  UILabel *NewHeadBody;
 //评论人数
@property (strong, nonatomic)  UILabel *NewReply;
 //评论
@property (strong, nonatomic)  UILabel *Newipadcomment;
 //发布时间
@property (strong, nonatomic)  UILabel *ptime;
//来源
@property (nonatomic,strong) UILabel *source;

@property (nonatomic,strong)newModel *model;

-(void)setModel:(newModel *)model;

@end
