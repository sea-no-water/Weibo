//
//  SouYeData_User.h
//  sinaBlogMVC
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SouYeData_User : NSObject
- (id)initWithDictionary:(NSDictionary * )dic;

@property ( nonatomic,strong)NSString * name;//昵称
@property (nonatomic,strong)NSString * avatar_hd;//头像name
@end
