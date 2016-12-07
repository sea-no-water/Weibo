//
//  SY_retweeted_status_user.h
//  sinaBlogMVC
//
//  Created by mac on 16/8/19.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SY_retweeted_status_user : NSObject
- (id)initWithDictionary:(NSDictionary *)dic;
@property (nonatomic,strong)NSString * name;
@end
