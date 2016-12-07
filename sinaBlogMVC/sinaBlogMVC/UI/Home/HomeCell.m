//
//  HomeCell.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/18.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "HomeCell.h"
#define WIDTH     [UIScreen mainScreen].bounds.size.width
#define HEIGHT     [UIScreen mainScreen].bounds.size.height
@implementation HomeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _downView = [[UIView alloc]init];
        _downView.frame = CGRectMake(0, self.frame.size.height-40, WIDTH, 40);
        [self addSubview:_downView];
        
        UILabel * downLine = [[UILabel alloc]init];
        downLine.frame = CGRectMake(0, 30, WIDTH, 10);
        downLine.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        [_downView addSubview:downLine];
        
        UILabel * line = [[UILabel alloc]init];
        line.frame = CGRectMake(0, 0, WIDTH, 1);
        line.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        [_downView addSubview:line];
        
        NSArray * array = [NSArray arrayWithObjects:@"statusdetail_icon_retweet.png",@"statusdetail_icon_comment.png",@"statusdetail_icon_like.png", nil];
        NSArray * array2 = [NSArray arrayWithObjects:@"转发",@"评论",@"赞", nil];
        for (int i = 0; i<3; i++)
        {
            UIButton * button = [[UIButton alloc ]init];
            float x = WIDTH/3;
            button.frame = CGRectMake(i*x, 1, x, 29);
            button.tag = i;
            [_downView addSubview:button];
            
            UIImageView * img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",array[i]]]];
            img.frame = CGRectMake((x-66)/2, 6, 17, 17);
            [button addSubview:img];
            
            UILabel * lab = [[UILabel alloc]init];
            lab.frame = CGRectMake((x-15)/2, 4, 40, 20);
            lab.text = array2[i];
            lab.textAlignment = NSTextAlignmentLeft;
            lab.font = [UIFont systemFontOfSize:11];
            lab.textColor = [UIColor grayColor];
            [button addSubview:lab];
            
            if (button.tag!=2)
            {
                UILabel * line = [[UILabel alloc]init];
                line.frame = CGRectMake(x-1, 10, 1, 9);
                line.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
                [button addSubview:line];

            }
        }
        
    }
    return self;
    
}

#pragma mark *************懒加载
- (UIImageView * )touXiang
{
    if (!_touXiang)
    {
        _touXiang = [[UIImageView alloc]init];
        _touXiang.frame = CGRectMake(5, 5, 40, 40);
        _touXiang.backgroundColor = [UIColor redColor];
        _touXiang.layer.cornerRadius = 20;
        _touXiang.layer.masksToBounds = YES;
        
        [self addSubview:_touXiang];
    }
    return _touXiang;
}

- (UILabel * )name
{
    if (!_name)
    {
        _name = [[UILabel alloc]init];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.font = [UIFont systemFontOfSize:15];
//        _name.backgroundColor = [UIColor redColor];
        
        [self addSubview:_name];
    }
    return _name;
}

- (UILabel * )time
{
    if (!_time)
    {
        _time = [[UILabel alloc]init];
        _time.textAlignment = NSTextAlignmentLeft;
        _time.textColor = [UIColor orangeColor];
        _time.font = [UIFont systemFontOfSize:11];
        
        
        [self addSubview:_time];
    }
    return _time;
}

- (UILabel * )souce
{
    if (!_souce)
    {
        _souce = [[UILabel alloc]init];
        _souce.textAlignment = NSTextAlignmentLeft;
        _souce.textColor = [UIColor lightGrayColor];
        _souce.font = [UIFont systemFontOfSize:11];
        
        [self addSubview: _souce];
    }
    return  _souce;
}

- (UILabel * )myText
{
    if (!_myText)
    {
        _myText = [[UILabel alloc]init];
        _myText.textAlignment = NSTextAlignmentLeft;
//        _myText.frame = CGRectMake(5, 55, WIDTH-10, 30);
        _myText.numberOfLines = 0;
        _myText.font = [UIFont systemFontOfSize:15];
        [self addSubview:_myText];
    }
    return _myText;
}

- (UIView * )myImageView
{
    if (!_myImageView)
    {
        _myImageView = [[UIView alloc]init];
        [self addSubview:_myImageView];
        
    }
    return _myImageView;
}

#pragma mark *************转发微博
- (UIView * )ZFView
{
    if (!_ZFView)
    {
        _ZFView = [[UIView alloc]init];
        _ZFView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        [self addSubview:_ZFView];
        
    }
    return _ZFView;
}

- (UILabel *)ZFText
{
    if (!_ZFText)
    {
        _ZFText = [[UILabel alloc]init];
        _ZFText.textAlignment = NSTextAlignmentLeft;
        _ZFText.font = [UIFont systemFontOfSize:14];
        _ZFText.textColor = [UIColor colorWithWhite:0.4 alpha:1];
        _ZFText.numberOfLines = 0;
        [_ZFView addSubview:_ZFText];
    }
    return _ZFText;
}

- (UIView * )ZFImageView
{
    if (!_ZFImageView)
    {
        _ZFImageView = [[UIView alloc]init];
        _ZFImageView.backgroundColor = [UIColor clearColor];
        [_ZFView addSubview:_ZFImageView];
        
    }
    return _ZFImageView;
}


@end
