//
//  CenterVC.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/16.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "CenterVC.h"
#import "Masonry.h"
#define WIDTH     [UIScreen mainScreen].bounds.size.width
#define HEIGHT    [UIScreen mainScreen].bounds.size.height

@interface CenterVC ()
{
    /** 放按钮的view*/
    UIView * _bgview;
    /** 存放前6个按钮和标签*/
    NSMutableArray * _frontBtnArray;
    /** 存放后6个按钮和标签*/
    NSMutableArray * _backBtnArray;
    /** X的图片*/
    UIImageView * _XImg;
}
@end

@implementation CenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
//    UIBlurEffect * effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView * visualView = [[UIVisualEffectView alloc]initWithEffect:effect];
//    visualView.frame = self.view.frame;
//    [self.view addSubview:visualView];
//    
    UIImageView * logoImg = [[UIImageView alloc]init];
    logoImg.image = [UIImage imageNamed:@"compose_slogan.png"];
//    logoImg.frame = self.view.bounds;
    [self.view addSubview:logoImg];

    [logoImg mas_makeConstraints:^(MASConstraintMaker *make)
    {
        float x = (self.view.frame.size.width-150)/2;
        float y = -(self.view.frame.size.width-150)/2;
        make.left.offset(x);
        make.right.offset(y);
        make.height.offset(55);
        make.top.offset(self.view.frame.size.width/5) ;
//        make.width.offset(150);
        
    }];
    
    //创建view放按钮
    _bgview = [[UIView alloc]init];
    _bgview.frame = CGRectMake(0, 0, WIDTH*2, HEIGHT);
    _bgview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bgview];
    
    //创建按钮
    [self creatButton];
    
    //放fanhui和cacel的按钮view
    UIView * BCView = [[UIView alloc]init];
    BCView.frame = CGRectMake(0, HEIGHT-40, WIDTH*2, 40);
    [_bgview addSubview:BCView];
    
    //创建第一页cancle按钮
    UIButton * cancle = [[UIButton alloc]init];
    cancle.center = CGPointMake(WIDTH/2, 20);
    cancle.bounds = CGRectMake(0, 0, WIDTH, 40);
    cancle.backgroundColor = [UIColor whiteColor];
    [cancle addTarget:self action:@selector(FrontCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [cancle setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add.png"] forState:UIControlStateNormal];
    [BCView addSubview:cancle];
    
    //X图片
    _XImg = [[UIImageView alloc]init];
    _XImg.image = [UIImage imageNamed:@"tabbar_compose_background_icon_add.png"];
    _XImg.center = CGPointMake(WIDTH/2, 20);
    _XImg.bounds = CGRectMake(0, 0, 30, 30);
    [BCView addSubview:_XImg];
    
    //创建第2页cancle按钮
    UIButton * fanhui = [[UIButton alloc]init];
    fanhui.center = CGPointMake(WIDTH+WIDTH/4, 20);
    fanhui.bounds = CGRectMake(0, 0, WIDTH/2-1, 40);
    fanhui.backgroundColor = [UIColor whiteColor];
    [fanhui addTarget:self action:@selector(BackFanHuiBtn) forControlEvents:UIControlEventTouchUpInside];
    [fanhui setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_return.png"] forState:UIControlStateNormal];
    [BCView addSubview:fanhui];
    
    UIButton * cancle2 = [[UIButton alloc]init];
    cancle2.center = CGPointMake(WIDTH+WIDTH/4*3, 20);
    cancle2.bounds = CGRectMake(0, 0, WIDTH/2, 40);
    cancle2.backgroundColor = [UIColor whiteColor];
    [cancle2 addTarget:self action:@selector(BackCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cancle2 setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close.png"] forState:UIControlStateNormal];
    [BCView addSubview:cancle2];
    
    //第一页cancle按钮X的动画
    [self performSelector:@selector(XAnimation ) withObject:nil afterDelay:0.01];

}

#pragma mark *************创建按钮
- (void)creatButton
{
    _frontBtnArray = [NSMutableArray array];
    _backBtnArray = [NSMutableArray array];
    
    NSArray * ImgArray = [NSArray arrayWithObjects:@"tabbar_compose_idea.png",
                                                    @"tabbar_compose_photo.png",
                                                    @"tabbar_compose_headlines.png",
                                                    @"tabbar_compose_lbs.png",
                                                    @"tabbar_compose_review.png",
                                                    @"tabbar_compose_more.png",
                                                    @"tabbar_compose_friend.png",
                                                    @"tabbar_compose_wbcamera.png",
                                                    @"tabbar_compose_music.png",
                                                    @"tabbar_compose_envelope.png",
                                                    @"tabbar_compose_productrelease.png",
                                                    @"tabbar_compose_shooting.png", nil];
    NSArray * TitleArray = [NSArray arrayWithObjects:@"文字",@"相机/相册",@"头条文章",@"签到",@"点评",@"更多",@"好友圈",@"微博相机",@"音乐",@"红包",@"商品",@"秒拍", nil];

    //前6个按钮
    for (int i = 0; i<6; i++)
    {
        UIButton * button = [[UIButton alloc]init];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",ImgArray[i]]] forState:UIControlStateNormal];
        button.tag = i+1;
        float w = (WIDTH - 180)/4;
        float h = HEIGHT/2;
        button.frame = CGRectMake(w+i%3*(60+w), h+i/3*(60+w)+h, 60, 60);
        [button addTarget: self action:@selector(frontbuttonClick: ) forControlEvents:UIControlEventTouchUpInside];
        [_bgview addSubview:button];
        [_frontBtnArray addObject:button];
        
        UILabel * lable = [[UILabel alloc]init];
        lable.frame = CGRectMake(w+i%3*(60+w), h+60+i/3*(60+w)+h, 60, 30);
        lable.text = [NSString stringWithFormat:@"%@",TitleArray[i]];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:13];
        lable.textColor = [UIColor grayColor];
        [_bgview addSubview:lable];
        [_frontBtnArray addObject:lable];
    }
    
    //后6个按钮
    for (int i = 0; i<6; i++)
    {
        UIButton * button = [[UIButton alloc]init];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",ImgArray[i+6]]] forState:UIControlStateNormal];
        button.tag = i+1;
        float w = (WIDTH - 180)/4;
        float h = HEIGHT/2;
        button.frame = CGRectMake(WIDTH+w+i%3*(60+w), h+i/3*(60+w), 60, 60);
        [button addTarget: self action:@selector(backbuttonClick: ) forControlEvents:UIControlEventTouchUpInside];

        [_bgview addSubview:button];
        [_backBtnArray addObject:button];
        
        UILabel * lable = [[UILabel alloc]init];
        lable.frame = CGRectMake(WIDTH+w+i%3*(60+w), h+60+i/3*(60+w), 60, 30);
        lable.text = [NSString stringWithFormat:@"%@",TitleArray[i+6]];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:13];
        lable.textColor = [UIColor grayColor];
        [_bgview addSubview:lable];
        [_backBtnArray addObject:lable];
    }
   
    //按钮动画
    [self performSelector:@selector(upAnimation) withObject:nil afterDelay:0.2];
}

#pragma mark *************动画
- (void)upAnimation
{
    [_frontBtnArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [UIView animateWithDuration:0.5 delay:0.02*idx usingSpringWithDamping:0.8 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            UIView * view = (UIView *)obj;
            view.center = CGPointMake(view.center.x, view.center.y-HEIGHT/2);
        } completion:^(BOOL finished) {
            
        }];
    }];
    
}

- (void)downAnimation
{
    for (int i = 0; i < _frontBtnArray.count; i++)
    {
        UIView * view = _frontBtnArray[_frontBtnArray.count-i-1];
        [UIView animateWithDuration:0.5 delay:0.02*i usingSpringWithDamping:0.8 initialSpringVelocity:15 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            view.center = CGPointMake(view.center.x, view.center.y+HEIGHT/2);
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
}

- (void)XAnimation
{
    [UIView animateWithDuration:0.2 animations:^{
        
        _XImg.transform = CGAffineTransformMakeRotation(M_PI/4);
    }];
}
#pragma mark *************按钮方法
//前页cancel按钮
- (void)FrontCancelBtn:(UIButton * )btn
{
    [UIView animateWithDuration:0.2 animations:^{
        
        _XImg.transform = CGAffineTransformMakeRotation(-M_PI/4);
    }];
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        btn.superview.center = CGPointMake(btn.superview.center.x, btn.superview.center.y+40);
//    }];
    
    [self downAnimation];
    [self performSelector:@selector(yanChiTiaoZhaun) withObject:nil afterDelay:0.35];
}

//前6个按钮
- (void)frontbuttonClick:(UIButton * )btn
{
    //点击按钮放大
    [UIView animateWithDuration:0.5 animations:^{
        
        btn.transform = CGAffineTransformMakeScale(3, 3);
        btn.transform = CGAffineTransformMakeScale(1, 1);

    }];
    
    
    if (btn.tag == 6)
    {
        [UIView animateWithDuration:0.3 animations:^{
            
            _bgview.frame = CGRectMake(-WIDTH, 0, WIDTH*2, HEIGHT);

        }];

    }
}

//后6个按钮
- (void)backbuttonClick:(UIButton * )btn
{
    //点击按钮放大
    [UIView animateWithDuration:0.3 animations:^{
        
        btn.transform = CGAffineTransformMakeScale(3, 3);
        btn.transform = CGAffineTransformMakeScale(1, 1);

        
    }];

}

//后页fanhui按钮
- (void)BackFanHuiBtn
{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _bgview.frame = CGRectMake(0, 0, WIDTH*2, HEIGHT);
        
    }];
}

//后页cancel按钮
- (void)BackCancelBtn:(UIButton * )btn
{
    [UIView animateWithDuration:0.2 animations:^{
        
        btn.superview.center = CGPointMake(btn.superview.center.x, btn.superview.center.y+40);
    }];
    
    for (int i = 0; i < _backBtnArray.count; i++)
    {
        UIView * view = _backBtnArray[_backBtnArray.count-i-1];
        [UIView animateWithDuration:0.5 delay:0.02*i usingSpringWithDamping:0.8 initialSpringVelocity:15 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y+HEIGHT/2, 60, 60);
        } completion:^(BOOL finished) {
            
        }];

    }
    
    [self performSelector:@selector(yanChiTiaoZhaun) withObject:nil afterDelay:0.4];

}

#pragma mark *************延迟跳转
- (void)yanChiTiaoZhaun
{
    [self dismissViewControllerAnimated:NO completion:nil];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
