//
//  SouYeData.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "SouYeData.h"

@implementation SouYeData

- (id)initWithDictionary:(NSDictionary *)dic
{
    
    self = [super init];
    if (self)
    {
        self.statuse = [NSMutableArray array];
        NSArray * array = dic[@"statuses"];
        for (NSDictionary * dic1 in array)
        {
            SouYeData_statuses * Stu = [[SouYeData_statuses alloc]initWithDictionary:dic1];
            [self.statuse addObject:Stu];
        }
        
    }
    return self;
}
@end
