//
//  NewCell.m
//  xunwen
//
//  Created by 小强 on 16/11/12.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "NewCell.h"

@interface NewCell()


@end

@implementation NewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.view = [[UIView alloc]initWithFrame:CGRectZero];
        self.view.layer.cornerRadius =20;
        self.view.layer.masksToBounds = YES;
        self.view.backgroundColor =[UIColor cyanColor];
        [self.contentView addSubview:self.view];
        
        self.NewImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.NewImage.layer.cornerRadius =10;
        self.NewImage.layer.masksToBounds =YES;
        [self.view addSubview:self.NewImage];
        
        self.NewTitle =[[UILabel alloc]initWithFrame:CGRectZero];
        self.NewTitle.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:13];
        self.NewTitle.numberOfLines = 0;
        [self.view addSubview:self.NewTitle];
        
        self.NewHeadBody =[[UILabel alloc]initWithFrame:CGRectZero];
        self.NewHeadBody.font = [UIFont fontWithName:@"STHeitiTC-Medium" size:12];
        self.NewHeadBody.numberOfLines =0;
        [self.view addSubview:self.NewHeadBody];
        
        self.source = [[UILabel alloc]initWithFrame:CGRectZero];
        self.source.font = [UIFont fontWithName:@"STHeitiTC-Medium" size:11];

        [self.view addSubview:self.source];
        
        self.NewReply =[[UILabel alloc]initWithFrame:CGRectZero];
        self.NewReply.font =[UIFont fontWithName:@"STHeitiSC-Medium" size:11];
        [self.view addSubview:self.NewReply];
        
        self.ptime = [[UILabel alloc]initWithFrame:CGRectZero];
        self.ptime.font =[UIFont fontWithName:@"STHeitiTC-Light" size:11];
        [self.view addSubview:self.ptime];
        
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)layoutSubviews
{
    
    CGFloat width=self.frame.size.width;
    CGFloat height=self.frame.size.height;
    
    self.view.frame =CGRectMake(10, 5, width-20, height-5);
    
    self.NewImage.frame = CGRectMake(10, 10, width/3, height/5*3+10);
    
    
    self.NewTitle.frame = CGRectMake(width/3+20, 5, width/5*3-20, height/5+10);
    
    self.NewHeadBody.frame = CGRectMake(width/3+20, height/5+10, width/5*3-10, height/5*3-10);
   
    
    self.source.frame =CGRectMake(10, height/5*3+30, width/5, height/5-10);
    self.NewReply.frame =CGRectMake(width/5+20, height/5*3+30, width/5, height/5-10);
     self.ptime.frame = CGRectMake(width/5*3+20, height/5*3+30, width/5*2, height/5-10);
}




-(void)setModel:(newModel *)model
{
    _model =model;
    self.selectionStyle = UITableViewCellAccessoryNone;
    
    [self.NewImage sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]placeholderImage:[UIImage imageNamed:@"Longing"]];
    self.NewTitle.text =model.title;
    self.NewReply.text =[NSString stringWithFormat:@"%@跟贴",model.replyCount];
    self.NewHeadBody.text =model.digest;
    self.ptime.text =model.ptime;
    self.source.text =model.source;
    self.ptime.text =model.ptime;

}




@end
