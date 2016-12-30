//
//  ZXStatusBarHud.m
//  ZXStatusBarHud
//
//  Created by 张雄 on 2016/12/30.
//  Copyright © 2016年 张雄. All rights reserved.
//

#import "ZXStatusBarHud.h"

#define  ZXMessageFont  [UIFont systemFontOfSize:12]
//消息的停留时间
static CGFloat const ZXMesssgeDuration = 2.0;

//动画的展示／隐藏时间
static CGFloat const ZXAnimationDuration = 0.25;
@implementation ZXStatusBarHud

/*全局窗口 ,不会创建两个窗口*/
static UIWindow *window_;

/*定时器*/
static NSTimer *timer_;
/**
 *  显示窗口
 */
+(void)showWindow{
    //frame数据
    CGFloat windowH = 20;
    CGRect frame =CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, 20);
    
    //显示窗口
    window_.hidden = YES;//先让之前的窗口隐藏，防止残留
    window_ = [[UIWindow alloc]init];
    window_.backgroundColor = [UIColor blackColor];
    //调整window的现实级别为最高级别
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame =frame;
    window_.hidden = NO;
    
    //动画数据
    frame.origin.y = 0;
    [UIView animateWithDuration:ZXAnimationDuration animations:^{
        window_.frame =frame;
    }];
}

/**
 *  自定义显示信息
 *  @param msg   文字
 *  @param image 图片
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image{
    //停止之前的定时器
    [timer_ invalidate];
    
    //显示窗口
    [self showWindow];
    //添加按钮
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {//如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font =ZXMessageFont;
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    //定时器
    timer_  =[NSTimer scheduledTimerWithTimeInterval:ZXMesssgeDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}


/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg{
    [self showMessage:msg image:nil];
    
}

/**
 *  显示成功信息
 */
+(void)showSuccess:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"ZXStatusBarHud.bundle/success"]];
    
}
/**
 *  显示失败信息
 */
+(void)showError:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"ZXStatusBarHud.bundle/error"]];
}
/**
 *  显示正在加载信息
 */
+(void)showLoading:(NSString *)msg{
    //停掉定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    UILabel *label = [[UILabel alloc]init];
    label.font = ZXMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    //添加指示器
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    //计算文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName:ZXMessageFont}].width;
    CGFloat centerX =(window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}


/**
 *  隐藏指示器
 */
+(void)hide{
    [UIView animateWithDuration:ZXAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ =nil;
        timer_ = nil;
    }];
}

@end
