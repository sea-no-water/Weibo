//
//  Souce.h
//  sinaBlogMVC
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Souce : NSObject
/**
 *  获取首页的微博数据
 */
- (void)getSouYeData:(int)Since_id;

@property (nonatomic,copy)void (^dicBlock)(NSDictionary * );
@end
