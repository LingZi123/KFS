//
//  GFDateView.h
//  KFS
//
//  Created by PC_201310113421 on 16/8/11.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GFDateViewDelegate <NSObject>

-(void)didDateSelectedFinished:(NSDate *)date dateStr:(NSString *)dateStr;

@end

@interface GFDateView : UIView
{
    
    __weak IBOutlet UIDatePicker *datePickview;
    NSDateFormatter *dateFormatter;
}

@property (nonatomic, strong)IBOutlet UIView *innerView;
@property (nonatomic, weak)UIViewController *parentVC;
@property(nonatomic,assign)id<GFDateViewDelegate> delegate;


- (IBAction)okBtnClick:(id)sender;

- (IBAction)cancelBtnClick:(id)sender;
+ (instancetype)defaultPopupView:(CGFloat)width;

@end
