//
//  ViewController.m
//  ZXStatusBarHud
//
//  Created by 张雄 on 2016/12/30.
//  Copyright © 2016年 张雄. All rights reserved.
//   1.0.0   大版本号.功能更新版本号.bug修复版本号

#import "ViewController.h"
#import "ZXStatusBarHud.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)success {
    [ZXStatusBarHud showSuccess:@"加载成功"];
}
- (IBAction)error {
    [ZXStatusBarHud showError:@"加载失败"];
}
- (IBAction)loading:(id)sender {
    [ZXStatusBarHud showLoading:@"加载中..."];
    //[ZXStatusBarHud showMessage:@"11111" image:[UIImage imageNamed:@"ZXStatusBarHud.bundle/custom"]];
}
- (IBAction)hide:(id)sender {
    [ZXStatusBarHud hide];
}

@end
