//
//  customTabBarCT.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/16.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "customTabBarCT.h"
#import "CenterVC.h"
@interface customTabBarCT ()

@end

@implementation customTabBarCT

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * button = [[UIButton alloc]init];
//    button.frame = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height-50, 64, 49);
    button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height-25);
    button.bounds = CGRectMake(0, 0, 64, 49);
    button.titleLabel.font = [UIFont systemFontOfSize:40];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonclidk:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UILabel * lable = [[UILabel alloc]init];
    lable.frame = CGRectMake(1,0, 64, 45);
    lable.text = @"+";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:40];
    [button addSubview:lable];
}

- (void)buttonclidk:(UIButton * )button
{
    CenterVC * vc = [[CenterVC alloc]init];
    [self presentViewController:vc animated:NO completion:nil];
    
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
