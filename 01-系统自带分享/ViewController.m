//
//  ViewController.m
//  01-系统自带分享
//
//  Created by xiaomage on 15/8/13.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.判断平台是否可用
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        NSLog(@"平台不可用,或者没有配置相关的帐号");
        return;
    }
    
    // 2.创建分享的控制器
    SLComposeViewController *composeVc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
    
    // 2.1.添加分享的文字
    [composeVc setInitialText:@"小码哥IT教育是中国IT教育的摇篮"];
    
    // 2.2.添加一个图片
    [composeVc addImage:[UIImage imageNamed:@"xingxing"]];
    
    // 2.3.添加一个分享的链接
    [composeVc addURL:[NSURL URLWithString:@"www.520it.com"]];
    
    // 3.弹出分享控制器
    [self presentViewController:composeVc animated:YES completion:nil];
    
    // 4.监听用户点击了取消还是发送
    composeVc.completionHandler = ^(SLComposeViewControllerResult result) {
        if (result == SLComposeViewControllerResultCancelled) {
            NSLog(@"点击了取消");
        } else {
            NSLog(@"点击了发送");
        }
    };
}

@end
