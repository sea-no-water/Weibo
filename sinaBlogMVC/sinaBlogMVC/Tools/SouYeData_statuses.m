//
//  SouYeData_statuses.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "SouYeData_statuses.h"
#import "SouYeData_User.h"
#import "SouYeData_pic_urls.h"
#import "SY_retweeted_status.h"
@implementation SouYeData_statuses

- (id)initWithDictionary:(NSDictionary *)dic
{
    
    self = [super init];
    if (self)
    {
        self.pic_urls = [NSMutableArray array];
        //user
        NSDictionary * dic1 = dic[@"user"];
        self.user = [[SouYeData_User alloc]initWithDictionary:dic1];
        //pic
        NSArray * array = dic[@"pic_urls"];
        for (NSDictionary * dic2 in array)
        {
            self.PicUrls = [[SouYeData_pic_urls alloc]initWithDictionary:dic2];
            [self.pic_urls addObject:self.PicUrls];

        }
        
        //text
        self.text = dic[@"text"];
        //source
        self.source = dic[@"source"];
        //时间
        self.created_at = dic[@"created_at"];
        //ID
        self.ID = [dic[@"id"] longValue];
        NSDictionary * dic3 = dic[@"retweeted_status"];
        self.retweeted_status = [[SY_retweeted_status alloc]initWithDictionary:dic3];

    }
    return self;
    
    
}
@end
