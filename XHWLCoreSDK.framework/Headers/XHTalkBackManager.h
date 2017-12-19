//
//  XHTalkBackManager.h
//  XHWLCoreSDK
//
//  Created by 王赛华 on 2017/12/15.
//  Copyright © 2017年 王赛华. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <WilddogVideoCall/WilddogVideoCall.h>
#import "XHVideoCall.h"
#import "XHConversation.h"
@interface XHTalkBackManager : NSObject
@property (nonatomic, strong, readonly) XHVideoCall *xhwlVideo;
@property (nonatomic, strong) XHConversation *videoConversation;
+ (instancetype)sharedManager;
/**
 *  对讲连接
 */
- (void)connectWithUserID:(NSString *)userId
                  success:(void (^)(NSString *idtoken))successBlock;
- (void) XHOpenTalkBackWithSuperVC:(UIViewController *)superVC withConversation:(XHConversation *)conversation;
/**
 * 退出登录
 */
- (void) goOffLine;
/**
 * 远程开门
 */
- (void) remoteOpenDoorWithSuperVC:(UIViewController *)superVC withtelephone:(NSString *)phone withProjectCode:(NSString *)code withUserName:(NSString *)username;

@end
