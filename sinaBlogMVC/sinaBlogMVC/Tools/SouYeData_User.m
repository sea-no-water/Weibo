//
//  SouYeData_User.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "SouYeData_User.h"

@implementation SouYeData_User
- (id)initWithDictionary:(NSDictionary * )dic
{
    self = [super init];
    if (self)
    {
        self.name = dic[@"name"];
        self.avatar_hd = dic[@"avatar_hd"];
        
        
    }
    return self;
}
@end
