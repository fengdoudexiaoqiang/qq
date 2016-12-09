//
//  ViewController.m
//  qq
//
//  Created by 小强 on 16/11/28.
//  Copyright © 2016年 xiao. All rights reserved.
//

#import "ViewController.h"
#import "NewCell.h"
#import "SessionManager.h"
#import "NewTableViewController.h"


#define SKWidth  [UIScreen mainScreen].bounds.size.width
#define SKHeight [UIScreen mainScreen].bounds.size.height

#define history @"http://c.m.163.com/nc/ipadarticle/list/T1368497029546/0-20.html"
#define pe      @"http://c.m.163.com/nc/ipadarticle/list/T1348649079062/0-20.html"
#define sciect  @"http://c.m.163.com/nc/ipadarticle/list/T1348649580692/0-20.html"
#define dujia   @"http://c.m.163.com/nc/ipadarticle/list/T1370583240249/0-20.html"
#define picture @"http://c.m.163.com/nc/ipadarticle/list/T1348650593803/0-20.html"
#define economy @"http://c.m.163.com/nc/ipadarticle/list/T1348648756099/0-20.html"

@interface ViewController ()<UIScrollViewDelegate>


{
    NSString * urlStr;
    NSMutableArray *dataArray;
}
@property (nonatomic,strong)UIView *lineView;
@property (nonatomic,strong)UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 32, SKWidth, SKHeight)];
    _scrollView.delegate =self;
    _scrollView.pagingEnabled=YES;
    _scrollView.contentSize =CGSizeMake(SKWidth*6, SKHeight-20);
    [self.view addSubview:_scrollView];
    
    NSArray *arr =@[history,pe,sciect,dujia,picture,economy];
    NSArray *array = @[@"历史",@"体育",@"科技",@"独家",@"图片",@"经济"];
    CGFloat w =CGRectGetWidth([UIScreen mainScreen].bounds)/8;
    for (int i =0; i<6; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(w*(1+i), 30, w, 30);
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [self.view addSubview:_scrollView];
        
        NewTableViewController *NVC=[[NewTableViewController alloc]init];
        NVC.urlStr =arr[i];
        NVC.view.frame =CGRectMake(SKWidth*i, 32, SKWidth, SKHeight);
        //把NVC的控制器加到Viewcontroller上
        [self addChildViewController:NVC];
        [_scrollView addSubview:NVC.view];
    }
    _lineView =[[UIView alloc]initWithFrame:CGRectMake(w, 60, w, 3)];
    _lineView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_lineView];
    
    }



-(void)btnAction:(UIButton *)sender
{
    CGFloat w =CGRectGetWidth([UIScreen mainScreen].bounds)/8;
    [UIView animateWithDuration:0.1 animations:^{
        _lineView.frame = CGRectMake(sender.frame.origin.x, 60, w, 3);
    }];
    //btn 从一开始sender.frame.origin.x/w-1  sender.frame.origin.x/w==btn的位置
    [_scrollView setContentOffset:CGPointMake((sender.frame.origin.x/w-1)*CGRectGetWidth([UIScreen mainScreen].bounds),0) animated:YES];
    NSLog(@"%f",sender.frame.origin.x);
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float  w =CGRectGetWidth([UIScreen mainScreen].bounds);
    float page = scrollView.contentOffset.x/w;
    [scrollView setContentOffset:CGPointMake(w*page, 0) animated:YES];
    [UIView animateWithDuration:0.3 animations:^{
        //UIview的偏移量
        _lineView.frame= CGRectMake((page+1)*(w/8), 60, w/8, 3);
    } completion:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
