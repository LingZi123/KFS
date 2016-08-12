//
//  MyStateView.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/8.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "MyStateView.h"

@implementation MyStateView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self makeView];
    }
    return self;
}

-(void)makeView{
    
    UILabel *headlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 200, 21)];
    headlabel.font=DE_Font11;
    headlabel.text=@"我的状态";
    headlabel.textColor=DE_BgColorPink;
    [self addSubview:headlabel];
    
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(80, CGRectGetMaxY(headlabel.frame), CGRectGetWidth(self.frame)-160, 85)];
    [image setImage:[UIImage imageNamed:@"testimage"]];
    [self addSubview:image];

    UIButton *chakanBtn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)-80, CGRectGetMaxY(image.frame)+8, 60, 25)];
    [chakanBtn setTitle:@"查看历史" forState:UIControlStateNormal];
    chakanBtn.titleLabel.font=DE_Font11;
    [chakanBtn setBackgroundImage:[UIImage imageNamed:@"动态按钮"] forState:UIControlStateNormal];
    [chakanBtn setTitleColor:DE_BgColorPink forState:UIControlStateNormal];
    [self addSubview:chakanBtn];
    
    UIView *seg1=[[UIView alloc]initWithFrame:CGRectMake(8, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.frame)-16, 1)];
    seg1.backgroundColor=DE_SegColorGray;
//    [self addSubview:seg1];
    
}

@end
