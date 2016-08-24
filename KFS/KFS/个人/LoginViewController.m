//
//  LoginMainViewController.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/3.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "LableTextFieldView.h"
#import "RegistTableViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=DE_BgColorGray;
    
    CGFloat width=CGRectGetWidth(self.view.frame);
    
    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake( 0, -20, width, DE_LoginTopviewRatio*width)];
    topView.backgroundColor=DE_BgColorPink;
    [self.view addSubview:topView];
    
    headImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 165, 165)];
    headImageView.center=topView.center;
    [topView addSubview:headImageView];
    
    UIView  *contentview=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame)+20,width, 160)];
    contentview.backgroundColor=[UIColor clearColor];
    [self.view addSubview:contentview];
    
    
    accountView=[[LableTextFieldView alloc]initWithFrame:CGRectMake(width*DE_Ration20, 23, width-2*width*DE_Ration20, 32)
                         ];
    accountView.titleLabel.text=@"帐号";
    accountView.textField.delegate=self;
    accountView.textField.placeholder=@"请输入账号";
    [contentview addSubview:accountView];
    
    
    pwdView=[[LableTextFieldView alloc]initWithFrame:CGRectMake(width*DE_Ration20, CGRectGetMaxY(accountView.frame)+20, width-2*width*DE_Ration20, 32)
                 ];
    pwdView.titleLabel.text=@"密码";
    pwdView.textField.delegate=self;
    pwdView.textField.placeholder=@"请输入密码";
    [contentview addSubview:pwdView];
    
    UIButton *loginbtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
    loginbtn.center=CGPointMake(contentview.center.x-55, CGRectGetMaxY(pwdView.frame)+45);
    [loginbtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginbtn setTitle:@"登录" forState:UIControlStateNormal];
    loginbtn.titleLabel.font=DE_Font14;
    loginbtn.titleLabel.textColor=[UIColor whiteColor];
    [loginbtn setBackgroundImage:[UIImage imageNamed:@"弹出框按钮"] forState:UIControlStateNormal];
    [contentview addSubview:loginbtn];
    
    
    UIButton *registbtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
     registbtn.center=CGPointMake(contentview.center.x+55, CGRectGetMaxY(pwdView.frame)+45);
    [registbtn setBackgroundImage:[UIImage imageNamed:@"弹出框按钮空"] forState:UIControlStateNormal];
    [registbtn setTitle:@"注册" forState:UIControlStateNormal];
    registbtn.titleLabel.font=DE_Font14;
    [registbtn setTitleColor:DE_BgColorPink forState:UIControlStateNormal];
    [registbtn addTarget:self action:@selector(regitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [contentview addSubview:registbtn];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(width-60-20, CGRectGetHeight(self.view.frame)-46, 60, 30)];
    [btn addTarget:self action:@selector(forgetPwdBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"忘记密码" forState:UIControlStateNormal];
    btn.titleLabel.font=DE_Font14;
    [btn setTitleColor:DE_BgColorPink forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBarHidden=YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{


    self.navigationController.navigationBarHidden=NO;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [accountView.textField resignFirstResponder];
    [pwdView.textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self loginBtnClick:nil];
    return YES;
}
- (IBAction)loginBtnClick:(id)sender {
    [accountView.textField resignFirstResponder];
    [pwdView.textField resignFirstResponder];
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:DE_IsLogin];
    [defaults synchronize];
    
    [[self appdelegate]makeMianView];
}

-(void)regitBtnClick:(UIButton *)sender{
    
    RegistTableViewController *vc=[[self appdelegate].storyboard instantiateViewControllerWithIdentifier:@"RegistTableViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)forgetPwdBtnClick:(UIButton *)sender{
    
}
#pragma mark-appdelegate
-(AppDelegate *)appdelegate{
    return (AppDelegate *)[[UIApplication sharedApplication]delegate];
}

@end
