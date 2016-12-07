//
//  SY_retweeted_status.h
//  sinaBlogMVC
//
//  Created by mac on 16/8/18.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SY_retweeted_status_user.h"
@interface SY_retweeted_status : NSObject
- (id)initWithDictionary:(NSDictionary * )dic;
@property (nonatomic,copy)NSString * text;
@property (nonatomic,strong)NSMutableArray * pic_urls;

@property (nonatomic,strong)SY_retweeted_status_user * user;
@end
