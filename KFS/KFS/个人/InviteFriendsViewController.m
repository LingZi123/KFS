//
//  InviteFriendsViewController.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/5.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "InviteFriendsViewController.h"

@interface InviteFriendsViewController ()

@end

@implementation InviteFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    shareView=[[GFShareView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)-300, CGRectGetWidth(self.view.frame), 300)];
     self.isShowShareView=YES;
    shareView.hidden= self.isShowShareView;
    [self.view addSubview:shareView];
    origiColor=self.view.backgroundColor;
}

-(void)viewWillAppear:(BOOL)animated{
    [self addObserver:self forKeyPath:@"isShowShareView" options:NSKeyValueObservingOptionNew  context:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self removeObserver:self forKeyPath:@"isShowShareView"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    int x = point.x;
    int y = point.y;
    if (y<CGRectGetHeight(self.view.frame)-CGRectGetHeight(shareView.frame)) {
         self.isShowShareView=YES;
    }
}

- (IBAction)shareBtnClick:(id)sender {
    
    self.isShowShareView=NO;
    
}

#pragma mark-观察者
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"isShowShareView"]) {
       
        if (self.isShowShareView) {
            self.view.backgroundColor=origiColor;
            topView.alpha=1;
        }
        else{
            self.view.backgroundColor=[UIColor blackColor];
            topView.alpha=0.8;
        }
        if (!self.isShowShareView) {
            [UIView animateWithDuration:3.0 delay:0.5 usingSpringWithDamping:1.0 initialSpringVelocity:10.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                 shareView.hidden= self.isShowShareView;
            } completion:^(BOOL finished) {
                
            }];
        }
        else{
           
            shareView.hidden= self.isShowShareView;
        }
        
    }
    
}
@end
