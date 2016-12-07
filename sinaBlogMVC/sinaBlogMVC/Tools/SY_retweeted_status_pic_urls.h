//
//  SY_retweeted_status_pic_urls.h
//  sinaBlogMVC
//
//  Created by mac on 16/8/18.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SY_retweeted_status_pic_urls : NSObject
- (id)initWithDictionary:(NSDictionary *)dic;
@property (nonatomic,copy)NSString * thumbnail_pic;
@end
