//
//  ViewController.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/16.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"
#import "SouYeVC.h"
#import "XiaoXiVC.h"
#import "CenterVC.h"
#import "FindVC.h"
#import "PublishVC.h"
#import "customTabBarCT.h"
@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //判断token是否过期
    [self panduanToken];
    
    //请求授权
    [self qingqiuCode];





}

#pragma mark *************获取token
- (void)qingqiuCode
{
    
    NSURL * url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=879006152&redirect_uri=http://www.baidu.com"];
    UIWebView * web  = [[UIWebView alloc]init];
    web.backgroundColor = [UIColor orangeColor];
    web.frame = [UIScreen mainScreen].bounds;
    web.delegate = self;
    
    [self.view addSubview:web];
    [web loadRequest:[NSURLRequest requestWithURL:url]];
    
    
}

//协议方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSString * urlstring = request.URL.absoluteString;
    NSLog(@"-----%@",urlstring);
    
    //判断字符串中是否包含code
    if ([urlstring containsString:@"code"])
    {
        NSArray * array = [urlstring componentsSeparatedByString:@"="];
        NSString * code = array.lastObject;
        
        //请求token
        urlstring = @"https://api.weibo.com/oauth2/access_token";
        NSMutableDictionary * mdic = [NSMutableDictionary dictionary];
        mdic[@"client_id"] = @"879006152";
        mdic[@"client_secret"] = @"edb0a24eb4e5a98f958fef9a0ef585a2";
        mdic[@"grant_type"] = @"authorization_code";
        mdic[@"code"] = code;
        mdic[@"redirect_uri"] = @"http://www.baidu.com";
        
        AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        [manager POST:urlstring parameters:mdic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            NSLog(@"++++++++%@",responseObject);

            NSString * token = responseObject[@"access_token"];
            NSString * uid = responseObject[@"uid"];
            //写入单例类
            NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
            [ud setObject:token forKey:@"token"];
            [ud setObject:uid forKey:@"uid"];
            
            //同步
            [ud synchronize];
            [self creatTabBarController];

            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"--------%@",error);
        }];
        //如果获取到code则不再执行
        return NO;
    }
    return YES;
}

#pragma mark *************判断token是否过期
- (void)panduanToken
{
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    NSString * token = [ud stringForKey:@"token"];
    if (token != nil)
    {
        NSMutableDictionary * mdic = [NSMutableDictionary dictionary];
        mdic[@"access_token"] = token;
        NSString * str = @"https://api.weibo.com/oauth2/get_token_info";
        AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        [manager POST:str parameters:mdic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
            float time = [responseObject[@"expire_in"] floatValue];
            if (time>0)
            {
                //token没有过期
//                NSLog(@"+++++++%f",time);
                [self creatTabBarController];
                
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"-------%@",error);

        }];
    }
    
    
    
}

#pragma mark *************创建tabBarController
- (void)creatTabBarController
{
    
    SouYeVC * n1 = [[SouYeVC alloc]init];
    UINavigationController * nav1 = [[UINavigationController alloc]init];
    
    nav1.tabBarItem.title = @"首页";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tabbar_home.png"];
    [nav1 pushViewController:n1 animated:YES];
    
    
    XiaoXiVC * n2 = [[XiaoXiVC alloc]init];
    UINavigationController * nav2 = [[UINavigationController alloc]init];
    nav2.tabBarItem.title = @"消息";
    nav2.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center.png"];
    [nav2 pushViewController:n2 animated:YES];
    
    CenterVC * n3 = [[CenterVC alloc]init];
    
    FindVC * n4 = [[FindVC alloc]init];
    UINavigationController * nav4 = [[UINavigationController alloc]init];
    nav4.tabBarItem.title = @"发现";
    nav4.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover.png"];
    [nav4 pushViewController:n4 animated:YES];
    
    PublishVC * n5 = [[PublishVC alloc]init];
    UINavigationController * nav5 = [[UINavigationController alloc]init];
    nav5.tabBarItem.title = @"我";
    nav5.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile.png"];
    
    [nav5 pushViewController:n5 animated:YES];

    customTabBarCT * tab = [[customTabBarCT alloc]init];
    
    tab.viewControllers = @[nav1,nav2,n3,nav4,nav5];
    tab.selectedIndex = 0;
    tab.tabBar.hidden = NO;
    tab.tabBar.tintColor = [UIColor orangeColor];
    
    UIWindow * window = [[UIApplication sharedApplication].delegate window];
    window.rootViewController = tab;
    
    
    
    
    
    
}

@end
