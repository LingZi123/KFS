//
//  PersonCenterMainViewController.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/3.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "PersonCenterMainViewController.h"
#import "AppDelegate.h"
#import "InviteFriendsViewController.h"
#import "AboutViewController.h"

@interface PersonCenterMainViewController ()

@end

@implementation PersonCenterMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    mytableview.rowHeight=40;
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSData *imagedata=[defaults objectForKey:DE_PhotoImage];
    UIImage *image=[UIImage imageWithData:imagedata];
    [headImageBtn setBackgroundImage:image forState:UIControlStateNormal];
    mytableview.tableFooterView=[[UIView alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

#pragma mark-UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}


#pragma mark-UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *dif=@"personcell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:dif];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:dif];
    }
    if (indexPath.row==0){
        cell.imageView.image=nil;
        cell.textLabel.text=@"邀请好友";
    }
    else if (indexPath.row==1){
        cell.textLabel.text=@"使用反馈";
    }
    else{
        cell.textLabel.text=@"关于软件";
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc=nil;
    if (indexPath.row==0) {
        vc=[[self appdelegate].storyboard instantiateViewControllerWithIdentifier:@"InviteFriendsViewController"];
    }
    else if (indexPath.row==1){
        
    }
    else{
        vc=[[self appdelegate].storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
    }
    
    vc.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark-动作
- (IBAction)logoutBtnClick:(id)sender {
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:DE_IsLogin];
    [defaults synchronize];
    [[self appdelegate] makeLoginView];
}

- (IBAction)changeImagBtnClick:(id)sender {
    //访问弹出框
    UIAlertController *cameravc=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *openCamera=[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypeCamera;
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.delegate=self;
        picker.allowsEditing=NO;
        picker.sourceType=sourceType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }];
    UIAlertAction *fromPhotos=[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.delegate=self;
        picker.allowsEditing=NO;
        picker.sourceType=sourceType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];

    }];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [cameravc addAction:openCamera];
    [cameravc addAction:fromPhotos];
    [cameravc addAction:cancel];
    
    [self presentViewController:cameravc animated:YES completion:^{
        
    }];
    
}

#pragma mark-appdelegate
-(AppDelegate *)appdelegate{
    return (AppDelegate *)[[UIApplication sharedApplication]delegate];
}
#pragma mark-UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
    headImageBtn.imageView.image=image;
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    __block UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    if (image) {
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//            dispatch_async(kGlobalThread, ^{
//
//            DDLogVerbose(@"image size : %@", NSStringFromCGSize(image.size));
            
//            dispatch_async(kMainThread, ^{
//                self.completion(image);
//            });  
//        });
        dispatch_async(dispatch_get_main_queue(), ^{
              [headImageBtn setBackgroundImage:image forState:UIControlStateNormal];
//            image= [image imageResizedToSize:CGSizeMake(100.0,100.0)];
            
            NSData *imageData=UIImagePNGRepresentation(image);
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
//            NSData *imagedata=NSData data
            [defaults setObject:imageData forKey:DE_PhotoImage];
            [defaults synchronize];
        });
       
//
    }
    return;
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        //取消选择
    }];
}
@end
