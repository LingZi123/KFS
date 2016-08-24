//
//  AddRemandViewController.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/11.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "AddRemandViewController.h"
#import "GFDateView.h"
#import "LewPopupViewAnimationSpring.h"
#import "GFWeekView.h"

@interface AddRemandViewController ()<GFDateViewDelegate,GFWeekViewDelegate>

@end

@implementation AddRemandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"添加提醒";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [nameTextField resignFirstResponder];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 6;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [nameTextField resignFirstResponder];
}
#pragma mark-动作
- (IBAction)dateBtnClick:(id)sender {
    [nameTextField resignFirstResponder];
    GFDateView *v=[GFDateView defaultPopupView:CGRectGetWidth(self.view.frame) datemode:UIDatePickerModeDate];
    v.titleLabel.text=@"添加日期";
    v.parentVC=self;
    v.delegate=self;
    [self lew_presentPopupView:v position:1  animation:[LewPopupViewAnimationSpring new] dismissed:^{
        
    }];
    
}

- (IBAction)timeBtnClick:(id)sender {
    [nameTextField resignFirstResponder];
    GFDateView *v=[GFDateView defaultPopupView:CGRectGetWidth(self.view.frame) datemode:UIDatePickerModeTime];
    v.titleLabel.text=@"添加时间";
    v.parentVC=self;
    v.delegate=self;
    [self lew_presentPopupView:v position:1  animation:[LewPopupViewAnimationSpring new] dismissed:^{
        
    }];
}

- (IBAction)repeatBtnClick:(id)sender {
    [nameTextField resignFirstResponder];
    GFWeekView *v=[GFWeekView defaultPopupView:CGRectGetWidth(self.view.frame)];
    v.parentVC=self;
    v.delegate=self;
    [self lew_presentPopupView:v position:1  animation:[LewPopupViewAnimationSpring new] dismissed:^{
        
    }];
}


- (IBAction)changeBtnClick:(id)sender {
}

- (IBAction)saveBtnClick:(id)sender {
    
    NSDate *today=[NSDate new];
    
//    if ([beginDate compare:today]) {
//        return;
//    }
//    
//    if (datamdic==nil) {
//        datamdic=[[NSMutableDictionary alloc]init];
//    }
    imagename=@"";
    [datamdic setObject:nameTextField.text forKey:@"name"];
    [datamdic setObject:imagename forKey:@"imageName"];
    [datamdic setObject:beginDate forKey:@"beginDate"];
    [datamdic setObject:dateBtn.titleLabel.text forKey:@"beginDateStr"];
    [datamdic setObject:beginTime forKey:@"beginTime"];
    [datamdic setObject:timeBtn.titleLabel.text forKey:@"beginTimeStr"];
    [datamdic setObject:repeatArray forKey:@"repeat"];
    [datamdic setObject:[NSNumber numberWithBool:YES] forKey:@"isOpen"];
    [datamdic setObject:@"医生" forKey:@"from"];
    
    
    // 添加通知
    UILocalNotification *notification=[[UILocalNotification alloc]init];
    notification.timeZone=[NSTimeZone defaultTimeZone];
    notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:60];//10秒后通知
    notification.repeatInterval=kCFCalendarUnitHour;//循环次数，kCFCalendarUnitWeekday一周一次
   
    notification.applicationIconBadgeNumber++; //应用的红色数字
    NSString *path = [[NSBundle mainBundle]pathForResource:@"短信08" ofType:@"caf"];
    NSLog(@"path-------------%@",path);
    notification.soundName=@"故事03.m4a";
    //[NSString stringWithFormat:@"/System/Library/Audio/UISounds/%@.%@",@"sms-received2",@".caf"];
                            //@"夏薇青 - 致爱丽丝.mp3";//UILocalNotificationDefaultSoundName;//声音，可以换成alarm.soundName = @"myMusic.caf"
    
    //去掉下面2行就不会弹出提示框
    notification.alertTitle=@"任务通知";
    notification.alertBody=nameTextField.text;//提示信息 弹出提示框
    notification.alertAction = @"打开";  //提示框按钮
    notification.hasAction = YES; //是否显示额外的按钮，为no时alertAction消失
    NSDictionary*infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
    notification.userInfo = infoDict; //添加额外的信息
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)deleteBtnClick:(id)sender {
}

#pragma mark-GFDateViewDelegate
-(void)didDateSelectedFinished:(NSDate *)date dateStr:(NSString *)dateStr{
    [dateBtn setTitle:dateStr forState:UIControlStateNormal];
    beginDate=date;
}
-(void)didTimeSelectedFinished:(NSDate *)date dateStr:(NSString *)dateStr{
    [timeBtn setTitle:dateStr forState:UIControlStateNormal];
    beginTime=date;
    
}
#pragma mrak-GFWeekViewDelegate
-(void)didWeekSelectedFinished:(NSMutableArray *)array weekStr:(NSString *)weekStr{
    [repeatBtn setTitle:weekStr forState:UIControlStateNormal];
    if (repeatArray==nil) {
        repeatArray=[[NSMutableArray alloc]init];
    }
    [repeatArray removeAllObjects];
    [repeatArray addObjectsFromArray:array];
}

#pragma mark-UITextFieldDelegate
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [nameTextField resignFirstResponder];
    return YES;
}
@end
