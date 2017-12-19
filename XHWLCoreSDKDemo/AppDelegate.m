//
//  AppDelegate.m
//  XHWLCoreSDKDemo
//
//  Created by gongairong on 2017/12/19.
//  Copyright © 2017年 xinghaiwulian. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <XHWLCoreSDK/XHTalkBackManager.h>

@interface AppDelegate ()<WDGVideoCallDelegate>
@property (nonatomic, strong) UIAlertController *foregroundAlert;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0];
    self.window.frame = [UIScreen mainScreen].bounds;
    [[XHTalkBackManager sharedManager] connectWithUserID:@"18307478839" success:^(NSString *idtoken) {
        if (idtoken != nil) {
            [XHVideoCall sharedInstance].delegate = self;
        }
    }];
    
    // 2.设置根控制器
    ViewController *vc = [[ViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.navigationBar.translucent = YES;
    
    UITabBarController * tabBar = [[UITabBarController alloc]init];
    
    
    // 设置tabBar的子视图控制器
    tabBar.viewControllers = @[nav];
    
    //    NSDictionary * fileDict = [[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"YR_UrlPlist" ofType:@"plist"]] objectForKey:@"loginUrl"];
    //
    
    self.window.rootViewController = tabBar;
    // 3.显示窗口
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}
#pragma mark - XHDelegate
- (void)wilddogVideoCall:(WDGVideoCall *)videoCall didReceiveCallWithConversation:(WDGConversation *)conversation data:(NSString *)data {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"%@ 邀请你进行视频通话\n%@", conversation.remoteUid, data] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *rejectAction = [UIAlertAction actionWithTitle:@"拒绝" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [conversation reject];
    }];
    
    UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:@"接受" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [[XHTalkBackManager sharedManager] XHOpenTalkBackWithSuperVC:[UIApplication sharedApplication].keyWindow.rootViewController withConversation:(XHConversation *)conversation];
        
    }];
    
    [alertController addAction:rejectAction];
    [alertController addAction:acceptAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    
    self.foregroundAlert = alertController;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
