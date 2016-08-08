//
//  MoodView.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/8.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "MoodView.h"

@implementation MoodView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self makeView];
    }
    return self;
}

-(void)makeView{
        //获取位置
    UIImageView *locationImage=[[UIImageView alloc]initWithFrame:CGRectMake(30, 10, 25, 25)];
    [locationImage setImage:[UIImage imageNamed:@""]];
    locationImage.backgroundColor=[UIColor redColor];
    [self addSubview:locationImage];
    
    UILabel *locationLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(locationImage.frame)+10, 10, 200, 25)];
    locationLabel.font=[UIFont systemFontOfSize:14];
    locationLabel.text=@"重庆市北部新区木星科技大厦";
    [self addSubview:locationLabel];
    
    xinqingview=[[MoodUnitView alloc]initWithFrame:CGRectMake(65, CGRectGetMaxY(locationLabel.frame)+20, self.frame.size.width-130, 25) count:5 subimagename:@""];
    xinqingview.titleLabel.text=@"心情：";
    [self addSubview:xinqingview];
    
    jiankangview=[[MoodUnitView alloc]initWithFrame:CGRectMake(65, CGRectGetMaxY(xinqingview.frame)+12,self.frame.size.width-130, 25) count:5 subimagename:@""];
    jiankangview.titleLabel.text=@"健康：";
    [self addSubview:jiankangview];
    
    UIButton *chakanBtn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame)-80, CGRectGetMaxY(jiankangview.frame)+8, 60, 25)];
    [chakanBtn setTitle:@"查看评分" forState:UIControlStateNormal];
    [chakanBtn addTarget:self action:@selector(seeGrade:) forControlEvents:UIControlEventTouchUpInside];
    chakanBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    chakanBtn.backgroundColor=[UIColor redColor];
    [self addSubview:chakanBtn];
    
    UIView *seg1=[[UIView alloc]initWithFrame:CGRectMake(8, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.frame)-16, 1)];
    seg1.backgroundColor=[UIColor lightGrayColor];
    [self addSubview:seg1];

}

#pragma mark-动作事件

-(void)seeGrade:(UIButton *)sender{
    [self.delegate goGradePage];
}
-(void)jiankangBtnClick:(UIButton *)sender{
    
}
@end
