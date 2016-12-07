//
//  SY_retweeted_status_user.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/19.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "SY_retweeted_status_user.h"

@implementation SY_retweeted_status_user

- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.name = dic[@"name"];
        
        
        
    }
    return self;
}

@end
