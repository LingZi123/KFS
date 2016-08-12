//
//  FirstPageMainViewController.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/3.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "FirstPageMainViewController.h"
#import "AppDelegate.h"
#import "SetHelperViewController.h"

@interface FirstPageMainViewController ()

@end

@implementation FirstPageMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)makeView{
    UIScrollView *bgview=[[UIScrollView alloc]initWithFrame:self.view.frame];
    bgview.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+65);
    [self.view addSubview:bgview];
    //第一行面板
    firstView=[[MoodView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(bgview.frame), 160)];
    firstView.delegate=self;
    [bgview addSubview:firstView];
    
    //我的提醒
    remandView=[[RemainView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(firstView.frame)+1, CGRectGetWidth(bgview.frame), 165)];
    remandView.delegate=self;
    [bgview addSubview:remandView];
    //我的状态
    
    mystateView=[[MyStateView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(remandView.frame)+1, CGRectGetWidth(bgview.frame), 160)];
    [bgview addSubview:mystateView];
    
    UIImageView *endImage=[[UIImageView alloc]initWithFrame:CGRectMake(2, CGRectGetMaxY(mystateView.frame)+5, CGRectGetWidth(bgview.frame)-4, 65)];
    [endImage setImage:[UIImage imageNamed:@"任务"]];
    [bgview addSubview:endImage];
    
}

#pragma mark-RemainViewDelegate

-(void)goSetHelperPage{
    
    SetHelperViewController *setvc=[[self appdelegate].storyboard instantiateViewControllerWithIdentifier:@"SetHelperViewController"];
    setvc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:setvc animated:YES];
}

#pragma mark-MoodViewDelegate

-(void)goGradePage{
    UIViewController *vc=[[UIViewController alloc]init];
    vc.view.backgroundColor=[UIColor whiteColor];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark-appdelegate
-(AppDelegate *)appdelegate{
    return (AppDelegate *)[[UIApplication sharedApplication]delegate];
}


@end
