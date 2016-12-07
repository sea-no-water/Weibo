//
//  SY_retweeted_status.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/18.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "SY_retweeted_status.h"
#import "SY_retweeted_status_pic_urls.h"
@implementation SY_retweeted_status

- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        self.pic_urls = [NSMutableArray array];
        self.text = dic[@"text"];
        
        NSArray * array = dic[@"pic_urls"];
        for (NSDictionary * dic1 in array)
        {
            SY_retweeted_status_pic_urls * pic = [[SY_retweeted_status_pic_urls alloc]initWithDictionary:dic1];
            [self.pic_urls addObject:pic];
        }
        
        NSDictionary * dic2 = dic[@"user"];
        self.user = [[SY_retweeted_status_user alloc]initWithDictionary:dic2];
    
    }
    return self;
}
@end
