//
//  SY_retweeted_status_pic_urls.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/18.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "SY_retweeted_status_pic_urls.h"

@implementation SY_retweeted_status_pic_urls

- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if ( self)
    {
        
        self.thumbnail_pic = dic[@"thumbnail_pic"];
        
        
    }
    return self;
    
}

@end
