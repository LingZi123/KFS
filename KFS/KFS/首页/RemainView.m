//
//  RemainView.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/8.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "RemainView.h"


@implementation RemainView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self makeView];
    }
    return self;
}

-(void)makeView{
    
    UILabel *headlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 21)];
    headlabel.font=DE_Font14;
    headlabel.text=@"我的提醒";
    headlabel.textColor=[UIColor redColor];
    [self addSubview:headlabel];
    
    view1=[[RemandUnitView alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.frame)-240)/2, CGRectGetMaxY(headlabel.frame)+25, 100, 55)];
    view1.titleLabel.text=@"跑步";
    view1.timeLabel.text=@"5min";
    [self addSubview:view1];
    
    view2=[[RemandUnitView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(view1.frame)+40, CGRectGetMaxY(headlabel.frame)+25, 100, 55)];
    view2.titleLabel.text=@"吃药";
    view2.timeLabel.text=@"14:00";
    [self addSubview:view2];

    UIButton *settingBtn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)-80, CGRectGetMaxY(view2.frame)+20, 60, 25)];
    [settingBtn setTitle:@"助手设置" forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(setBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    settingBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    settingBtn.backgroundColor=[UIColor redColor];
    [self addSubview:settingBtn];
    
    UIView *seg1=[[UIView alloc]initWithFrame:CGRectMake(8, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.frame)-16, 1)];
    seg1.backgroundColor=[UIColor lightGrayColor];
    [self addSubview:seg1];
}

-(void)setBtnClick:(UIButton *)sender{
    [self.delegate goSetHelperPage];
}


@end
