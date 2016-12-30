//
//  ZXStatusBarHud.h
//  ZXStatusBarHud
//
//  Created by 张雄 on 2016/12/30.
//  Copyright © 2016年 张雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXStatusBarHud : NSObject

/**
 *  自定义显示信息
 *  @param msg   文字
 *  @param image 图片
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 *  显示成功信息
 */
+(void)showSuccess:(NSString *)msg;
/**
 *  显示失败信息
 */
+(void)showError:(NSString *)msg;
/**
 *  显示正在加载信息
 */
+(void)showLoading:(NSString *)msg;
/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg;
/**
 *  隐藏指示器
 */
+(void)hide;
@end
