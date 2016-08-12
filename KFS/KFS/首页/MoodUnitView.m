//
//  MoodUnitView.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/8.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "MoodUnitView.h"

@implementation MoodUnitView

-(instancetype)initWithFrame:(CGRect)frame count:(NSInteger)count subimagename:(NSString *)subimagename{
    self=[super initWithFrame:frame];
    if (self) {
        _btnCount=count;
        _subImageName=subimagename;
        [self makeView];
    }
    return self;
}

-(void)makeView{
    
    _headImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 4, 19, 16.5)];
    [self addSubview:_headImageView];
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImageView.frame)+8, 2, 43, 21)];
    _titleLabel.font=DE_Font11;
    _titleLabel.textColor=DE_BgColorPink;
    [self addSubview:_titleLabel];
    
    for (int i=0; i<_btnCount; i++) {
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame)+8+i*(13+10), 5, 13, 13)];
        btn.tag=100+i;
        [btn setImage:[UIImage imageNamed:@"星星"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"星星填充"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    

}

-(void)btnClick:(UIButton *)sender{
    
}
@end
