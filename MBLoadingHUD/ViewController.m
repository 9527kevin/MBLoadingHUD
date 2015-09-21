//
//  ViewController.m
//  MBLoadingHUD
//
//  Created by develop on 15/9/21.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "ViewController.h"
#import "HUD.h"

@interface ViewController ()

- (IBAction)showLoading:(id)sender;
- (IBAction)showLoadingWithText:(id)sender;
- (IBAction)showLoadingWithTextInView:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"MBLoadingHUD";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"隐藏HUD" style:UIBarButtonItemStylePlain target:self action:@selector(barAction)];
}

- (void)barAction {
    NSLog(@"导航栏按钮可以点击的！");
    [HUD hideHUD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showLoading:(id)sender {
    
    NSLog(@"show loading...");
    [HUD showLoadingHUD];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUD hideHUD];
    });
}

- (IBAction)showLoadingWithText:(id)sender {
    
    [HUD showLoadingHUDWithText:@"加载中..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUD hideHUD];
    });
}

- (IBAction)showLoadingWithTextInView:(id)sender {
    
    [HUD showLoadingHUDWithText:@"加载中..." inView:self.view];
}
@end
