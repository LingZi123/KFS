//
//  PersonCenterMainViewController.h
//  KFS
//
//  Created by PC_201310113421 on 16/8/3.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonRootViewController.h"

@interface PersonCenterMainViewController :CommonRootViewController<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    
    __weak IBOutlet UIButton *headImageBtn;
    __weak IBOutlet UITableView *mytableview;
}

- (IBAction)logoutBtnClick:(id)sender;
- (IBAction)changeImagBtnClick:(id)sender;

@end
