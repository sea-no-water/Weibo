//
//  SouYeData.h
//  sinaBlogMVC
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SouYeData_statuses.h"
#import "SouYeData_pic_urls.h"
#import "SouYeData_User.h"
#import "SY_retweeted_status.h"
#import "SY_retweeted_status_pic_urls.h"
@interface SouYeData : NSObject

- (id)initWithDictionary:(NSDictionary *)dic;
@property (nonatomic,strong)NSMutableArray * statuse;
//@property (nonatomic,strong)SouYeData_statuses * Stu;
@end
