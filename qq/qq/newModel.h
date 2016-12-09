//
//  newModel.h
//  xunwen
//
//  Created by 小强 on 16/11/11.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface newModel : NSObject
//标题
@property (nonatomic,strong)NSString *title;
//评论人数
@property (nonatomic,strong)NSString *replyCount;
//评论
@property (nonatomic,strong)NSString *ipadcomment;
//网页地址
@property (nonatomic,strong)NSString *url;
//发布时间
@property (nonatomic,strong)NSString *ptime;
//摘要内容
@property (nonatomic,strong)NSString *digest;
//图片
@property (nonatomic,strong)NSString *imgsrc;

//来源
@property (nonatomic,strong)NSString *source;
@property (nonatomic,strong)NSString *TitleName;
@property (nonatomic,strong)NSString *urlStr;


@end
