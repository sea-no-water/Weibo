//
//  SouYeData_statuses.h
//  sinaBlogMVC
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SouYeData_pic_urls;
@class SouYeData_User;
@class SY_retweeted_status;
@interface SouYeData_statuses : NSObject
- (id)initWithDictionary:(NSDictionary * )dic;

@property (nonatomic,strong)SY_retweeted_status * retweeted_status;//转发
@property (nonatomic,strong)SouYeData_pic_urls * PicUrls;//发送的图片
@property (nonatomic,strong)SouYeData_User * user;//user字典
@property (nonatomic,strong)NSString * created_at;//时间
@property (nonatomic,strong)NSString * source;//来自
@property (nonatomic,strong)NSString * text;//发送的消息
@property (nonatomic,assign)long ID;//微博ID
@property (nonatomic,strong)NSMutableArray * pic_urls;//发送的图片
@end
