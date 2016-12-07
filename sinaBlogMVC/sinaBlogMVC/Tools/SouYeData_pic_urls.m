//
//  SouYeData_pic_urls.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "SouYeData_pic_urls.h"

@implementation SouYeData_pic_urls
- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        self.thumbnail_pic = dic[@"thumbnail_pic"];//发送的图片
        
    }
    return self;
}

@end
