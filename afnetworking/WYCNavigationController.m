//
//  WYCNavigationController.m
//  afnetworking
//
//  Created by 王玉翠 on 16/8/8.
//  Copyright © 2016年 王玉翠. All rights reserved.
//

#import "WYCNavigationController.h"

@interface WYCNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation WYCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    __weak WYCNavigationController *weakSelf = self;
//    
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
//    {
//        self.interactivePopGestureRecognizer.delegate = weakSelf;
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
