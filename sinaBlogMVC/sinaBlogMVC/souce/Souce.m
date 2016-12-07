//
//  Souce.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "Souce.h"
#import "AFNetworking.h"

#define USER     [NSUserDefaults standardUserDefaults]

@implementation Souce


- (void)getSouYeData:(int)Since_id
{

    __block NSDictionary * dic = [NSDictionary dictionary];
   
    NSString * token  = [USER stringForKey:@"token"];
    
    NSString * urlString = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/friends_timeline.json?access_token=%@&count=20&since_id=%d",token,Since_id];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSData * data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",str);
        self.dicBlock(dic);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"souceError=====%@",error);
        
    }];
    
}


@end
