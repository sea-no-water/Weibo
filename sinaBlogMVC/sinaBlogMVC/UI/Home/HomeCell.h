//
//  HomeCell.h
//  sinaBlogMVC
//
//  Created by mac on 16/8/18.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell

@property (nonatomic,strong)UILabel * downLine;
@property (nonatomic,strong)UIView * downView;
@property (nonatomic,strong)UIImageView * touXiang;
@property (nonatomic,strong)UILabel * name;
@property (nonatomic,strong)UILabel * time;
@property (nonatomic,strong)UILabel * souce;

@property (nonatomic,strong)UILabel * myText;
@property (nonatomic,strong)UIView * myImageView;

//转发
@property (nonatomic,strong)UIView * ZFView;
@property (nonatomic,strong)UILabel * ZFText;
@property (nonatomic,strong)UIView * ZFImageView;

@end
