//
//  ViewController.m
//  XHWLCoreSDKDemo
//
//  Created by gongairong on 2017/12/19.
//  Copyright © 2017年 xinghaiwulian. All rights reserved.
//

#import "ViewController.h"

#import <XHWLCoreSDK/XHTalkBackManager.h>

@interface ViewController ()<WDGVideoCallDelegate>
@property (nonatomic, strong) UIAlertController *foregroundAlert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 150, 200)];
    [btn setTitle:@"远程开门" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
}

- (void) btnAction {
    [[XHTalkBackManager sharedManager] remoteOpenDoorWithSuperVC:self withtelephone:@"18320480001" withProjectCode:@"123" withUserName:@"测试1"];
}
#pragma mark - XHDelegate
- (void)wilddogVideoCall:(WDGVideoCall *)videoCall didReceiveCallWithConversation:(WDGConversation *)conversation data:(NSString *)data {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"%@ 邀请你进行视频通话\n%@", conversation.remoteUid, data] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *rejectAction = [UIAlertAction actionWithTitle:@"拒绝" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [conversation reject];
    }];
    
    __weak __typeof__(self) weakSelf = self;
    UIAlertAction *acceptAction = [UIAlertAction actionWithTitle:@"接受" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        __strong __typeof__(self) strongSelf = weakSelf;
        [[XHTalkBackManager sharedManager] XHOpenTalkBackWithSuperVC:strongSelf withConversation:(XHConversation *)conversation];
        //        [XHTalkBackManager sharedManager].videoConversation = conversation;
        //        [[XHTalkBackManager sharedManager].videoConversation acceptWithLocalStream:strongSelf.localStream];
        
    }];
    
    [alertController addAction:rejectAction];
    [alertController addAction:acceptAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    self.foregroundAlert = alertController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
