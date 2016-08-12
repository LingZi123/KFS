//
//  LoginMainViewController.h
//  KFS
//
//  Created by PC_201310113421 on 16/8/3.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonRootViewController.h"

@interface LoginViewController : CommonRootViewController<UITextFieldDelegate>{
    
    __weak IBOutlet UITextField *usenameTextField;
    __weak IBOutlet UITextField *pwdTextField;
}
- (IBAction)loginBtnClick:(id)sender;

@end
