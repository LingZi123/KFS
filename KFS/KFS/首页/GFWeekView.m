//
//  GFWeekView.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/11.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "GFWeekView.h"
#import "LewPopupViewAnimationSpring.h"

@implementation GFWeekView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        [[NSBundle mainBundle] loadNibNamed:[[self class] description] owner:self options:nil];
        _innerView.frame = frame;
        [self addSubview:_innerView];
    }
    return self;
}
+ (instancetype)defaultPopupView:(CGFloat)width{
    GFWeekView *v=[[GFWeekView alloc]initWithFrame:CGRectMake(0, 0, width, 230)];
    return v;
}

- (IBAction)cancelBtnClick:(id)sender {
    [_parentVC lew_dismissPopupViewWithanimation:[LewPopupViewAnimationSpring new]];
}

- (IBAction)okBtnClick:(id)sender {
    resultStr=@"";
    if (btnArray) {
        if (btnArray.count==7) {
            resultStr=@"每天";
        }
        else if (btnArray.count==5&&![btnArray containsObject:satBtn]&&![btnArray containsObject:weekendBtn]){
            resultStr=@"工作日";
        }
        else if (btnArray.count==2&&[btnArray containsObject:satBtn]&&[btnArray containsObject:weekendBtn]){
            resultStr=@"周末";
        }
        else{
            for (UIButton *item in btnArray) {
                
                resultStr=[resultStr stringByAppendingString:[NSString stringWithFormat:@"%@、",item.titleLabel.text]];
                
            }
            resultStr=[resultStr substringToIndex:resultStr.length-1];
        }
    }
    
    [self.delegate didWeekSelectedFinished:btnArray weekStr:resultStr];
     [_parentVC lew_dismissPopupViewWithanimation:[LewPopupViewAnimationSpring new]];
}

- (IBAction)weekBtnClick:(id)sender {
    
    UIButton *btn=(UIButton *)sender;
    if (satBtn==nil&&btn.tag==106) {
        satBtn=btn;
    }
    if (weekendBtn==nil&&btn.tag==107) {
        weekendBtn=btn;
    }
    if (btnArray==nil) {
        btnArray=[[NSMutableArray alloc]init];
    }
    if ([btnArray containsObject:btn]) {
        btn.selected=NO;
        //背景图片改变
        [btnArray removeObject:btn];
    }
    else{
        //btn图片改变
        btn.selected=YES;
        [btnArray addObject:btn];
    }
    
}
@end
