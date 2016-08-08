//
//  SetHelperViewController.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/8.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "SetHelperViewController.h"

@interface SetHelperViewController ()

@end

@implementation SetHelperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIBarButtonItem *rigthBar=[[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addTask:)];
    self.navigationItem.rightBarButtonItem=rigthBar;
    tastTableview.tableFooterView=[[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark-添加任务
-(void)addTask:(UIBarButtonItem *)sender{
    
}

@end
