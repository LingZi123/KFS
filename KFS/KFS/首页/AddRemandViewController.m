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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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

#pragma mark-GFDateViewDelegate
-(void)didDateSelectedFinished:(NSDate *)date dateStr:(NSString *)dateStr{
    [dateBtn setTitle:dateStr forState:UIControlStateNormal];
}
-(void)didTimeSelectedFinished:(NSDate *)date dateStr:(NSString *)dateStr{
    [timeBtn setTitle:dateStr forState:UIControlStateNormal];
    
}
#pragma mrak-GFWeekViewDelegate
-(void)didWeekSelectedFinished:(NSMutableArray *)array weekStr:(NSString *)weekStr{
    [repeatBtn setTitle:weekStr forState:UIControlStateNormal];
}
@end
