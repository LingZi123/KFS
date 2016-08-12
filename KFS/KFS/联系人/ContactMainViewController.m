//
//  ContactMainViewController.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/3.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "ContactMainViewController.h"

@interface ContactMainViewController ()

@end

@implementation ContactMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray=[[NSArray alloc]initWithObjects:@"消息",@"联系人", nil];
    UISegmentedControl *seg=[[UISegmentedControl alloc]initWithItems:titleArray];
    seg.selectedSegmentIndex=0;
    self.navigationItem.titleView=seg;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
