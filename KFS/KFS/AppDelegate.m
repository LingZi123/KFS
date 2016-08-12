//
//  AppDelegate.m
//  KFS
//
//  Created by PC_201310113421 on 16/8/3.
//  Copyright © 2016年 PC_201310113421. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstPageMainViewController.h"
#import "ContactMainViewController.h"
#import "LearnMainViewController.h"
#include "PersonCenterMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    //给姐妹赋值
    _storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path=NSHomeDirectory();
    NSLog(documentsDirectory);
    //获取是否已经登录
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    BOOL isLogin=[[defaults objectForKey:DE_IsLogin]boolValue];
    
    //如果登录进入主界面,否则进入登录界面
    if (isLogin) {
        [self makeMianView];
    }
    else{
        [self makeLoginView];
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.gf.KFS" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"KFS" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"KFS.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark-根试图
-(void)makeMianView{
    if (_mainTabbarv==nil||_mainTabbarv==(id)[NSNull null]) {
//        _mainTabbarv=[_storyboard instantiateViewControllerWithIdentifier:@"MainTabBarV"];
        _mainTabbarv=[[UITabBarController alloc]init];
        
        FirstPageMainViewController *vc1=[_storyboard instantiateViewControllerWithIdentifier:@"FirstPageMainViewController"];
        
        ContactMainViewController *vc2=[_storyboard instantiateViewControllerWithIdentifier:@"ContactMainViewController"];
        
        LearnMainViewController *vc3=[_storyboard instantiateViewControllerWithIdentifier:@"LearnMainViewController"];
        
        PersonCenterMainViewController *vc4=[_storyboard instantiateViewControllerWithIdentifier:@"PersonCenterMainViewController"];
        
        UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:vc1];
        nav1.title=@"动态";
        nav1.tabBarItem.title=@"首页";
        [nav1.tabBarItem setSelectedImage:[UIImage imageNamed:@"亮动态"]];
        [nav1.tabBarItem setImage:[UIImage imageNamed:@"灰动态"]];
        [nav1.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:DE_BgColorPink,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        
        
        UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:vc2];
        nav2.title=@"联系人";
        [nav2.tabBarItem setSelectedImage:[UIImage imageNamed:@"亮联系人"]];
        [nav2.tabBarItem setImage:[UIImage imageNamed:@"灰联系人"]];
        [nav2.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:DE_BgColorPink,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        
        UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:vc3];
        nav3.title=@"学习";
        [nav3.tabBarItem setSelectedImage:[UIImage imageNamed:@"亮学习"]];
        [nav3.tabBarItem setImage:[UIImage imageNamed:@"灰学习"]];
        [nav3.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:DE_BgColorPink,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        
        UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:vc4];
        nav4.title=@"我的";
        [nav4.tabBarItem setSelectedImage:[UIImage imageNamed:@"亮我的"]];
        [nav4.tabBarItem setImage:[UIImage imageNamed:@"灰我的"]];
        [nav4.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:DE_BgColorPink,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        
        NSArray *titleArray=@[nav1,nav2,nav3,nav4];
        _mainTabbarv.viewControllers=titleArray;
        _mainTabbarv.tabBar.tintColor=DE_BgColorPink;
    }
    
    _mainTabbarv.selectedIndex=0;
    self.window.rootViewController=_mainTabbarv;
    
}
-(void)makeLoginView{
    if (_loginNav==nil||_loginNav==(id)[NSNull null]) {
        _loginNav=[_storyboard instantiateViewControllerWithIdentifier:@"LoginNav"];
    }
    self.window.rootViewController=_loginNav;
}
@end
