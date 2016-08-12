//
//  AddRemandViewController.h
//  KFS
//
//  Created by PC_201310113421 on 16/8/11.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRemandViewController : UITableViewController
{
    
    __weak IBOutlet UIButton *dateBtn;
    __weak IBOutlet UIButton *timeBtn;
    __weak IBOutlet UIButton *repeatBtn;
}
- (IBAction)dateBtnClick:(id)sender;

- (IBAction)timeBtnClick:(id)sender;
- (IBAction)repeatBtnClick:(id)sender;
- (IBAction)changeBtnClick:(id)sender;
@end
