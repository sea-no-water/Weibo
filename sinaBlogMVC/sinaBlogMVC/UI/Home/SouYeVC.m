//
//  SouYeVC.m
//  sinaBlogMVC
//
//  Created by mac on 16/8/16.
//  Copyright © 2016年 刘文海. All rights reserved.
//

#import "SouYeVC.h"
#import "Souce.h"
#import "SouYeData.h"
#import "HomeCell.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"

#define WIDTH     [UIScreen mainScreen].bounds.size.width
#define HEIGHT     [UIScreen mainScreen].bounds.size.height
@interface SouYeVC ()<UITableViewDelegate,UITableViewDataSource>
{
    /** 请求的模型数据*/
    SouYeData * _allSouce;
}
/** tableview*/
@property (nonatomic,strong)UITableView * tableview;

@end

//对字符串进行扩展
@interface NSString (text)

- (NSString * )getSouceWithString;

@end

@implementation NSString (text)

/** 切割字符串*/
- (NSString * )getSouceWithString
{
    NSRange range = [self rangeOfString:@">"];
    
    NSRange newRange = NSMakeRange(NSMaxRange(range), self.length-NSMaxRange(range)-4);
    
    NSString *text = [self substringWithRange:newRange];
    
    return text;
}

@end

@implementation SouYeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    //请求数据
    Souce * souce = [[Souce alloc]init];
    [souce getSouYeData:0];
    
    //block回调
    souce.dicBlock = ^(NSDictionary * dic)
    {
        [self aaa:dic];
        
        UISearchBar * seach = [[UISearchBar alloc]init];
        seach.searchBarStyle = UISearchBarStyleMinimal;
        seach.frame = CGRectMake(5, 5, WIDTH-10, 20);
        
        UIView * view = [[UIView alloc]init];
        view.frame = CGRectMake(0, 0, WIDTH, 30);
        view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        [view addSubview:seach];
        
        self.tableview.tableHeaderView = view;
        
        //刷新
        MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [header setTitle:@"即将刷新" forState:MJRefreshStateIdle];
            [header setTitle:@"放开刷新" forState:MJRefreshStatePulling];
            [header setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
            header.lastUpdatedTimeKey = [NSString stringWithFormat:@"%@",[NSDate date]];
            
            
            
            
            
            
            
            
            [_tableview.mj_header endRefreshing];

        }];
       
        
      
        
        
        _tableview.mj_header = header;
        
    };
    
}

#pragma mark *************数据处理
//数据导出
- (void)aaa:(NSDictionary *)dic
{
    //    NSLog(@"%@",dic);
    _allSouce = [[SouYeData alloc]initWithDictionary:dic];
    
}

//刷新的数据
- (void)upData
{
    //请求数据
    Souce * souce = [[Souce alloc]init];
    [souce getSouYeData:0];
    
    
    
    
}

#pragma mark *************懒加载
- (UITableView * )tableview
{
    if (!_tableview)
    {
        _tableview = [[UITableView alloc]init];
        _tableview.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-108);
        _tableview.dataSource = self;
        _tableview.delegate = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableview];
        [_tableview registerClass:[HomeCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableview;
}

#pragma mark *************tableview代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _allSouce.statuse.count;
    
}

- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    HomeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //在重用池中找到即将出现的cell（解决系统cell重用问题）
    HomeCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    //如果没有创建
    if (!cell)
    {
        cell = [[HomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    SouYeData_statuses * stu = _allSouce.statuse[indexPath.row];
    //头像
    {
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:stu.user.avatar_hd]];
        UIImage * image = [UIImage imageWithData:data];
        cell.touXiang.image = image;
    }
    
    //name
    {
        CGSize nameSize = [self getSizeWithString:stu.user.name andFont:15];
        cell.name.text = stu.user.name;
        cell.name.frame= CGRectMake(55, 10, nameSize.width, nameSize.height);
    }
    
    //time &souce
    {
        NSString * timeStr = stu.created_at;
        NSString * time = [self getTimeWithString:timeStr];
        //    NSLog(@"5555555555-----%@",time);
        CGSize timeSize = [self getSizeWithString:time andFont:11];
        cell.time.text = time;
        cell.time.frame = CGRectMake(55, 30, timeSize.width, timeSize.height);
        
        //souce
        NSString * souce = stu.source;
        souce = [souce getSouceWithString];
        CGSize souceSize = [self getSizeWithString:[NSString stringWithFormat:@"来自 %@",souce] andFont:11];
        cell.souce.text = [NSString stringWithFormat:@"来自 %@",souce];
        cell.souce.frame = CGRectMake(60+timeSize.width, 30, souceSize.width+15, souceSize.height);
    }
    
    //myText &ZFView &downView
    {
        CGSize myTextSize = [self getSizeWithString:stu.text andFont:15];
        //正则
        cell.myText.attributedText = [self getEmotionWithString:stu.text setMutableAttributedString:[self setRegularFromString:stu.text]];
        cell.myText.frame = CGRectMake(10, 55, myTextSize.width, myTextSize.height);
        
        //myImageView
        float myImageViewHeight = 0;
        if (stu.pic_urls.count != 0)
        {
            NSMutableDictionary * mdic = [self setImageViewWithArray:stu.pic_urls];
           
            NSMutableArray * imgeviewArr = mdic[@"ImageView"];
            float height = [mdic[@"height"] floatValue];
            
            for (UIImageView * imgView in imgeviewArr)
            {
                [cell.myImageView addSubview:imgView];

            }
            
            cell.myImageView.frame = CGRectMake(10, myTextSize.height+10+55,WIDTH-20, height);
            myImageViewHeight = height+10;
            
            
        }
        
        
        
        //ZFView
        float ZFviewHeight = 0;
        if (stu.retweeted_status.text != nil )
        {
            NSString * ZFTextString = [NSString stringWithFormat:@"@%@ :%@",stu.retweeted_status.user.name,stu.retweeted_status.text];
            CGSize ZFTextSize = [self getSizeWithString:ZFTextString andFont:14];
            
            cell.ZFView.frame = CGRectMake(0, myTextSize.height + 65, WIDTH, ZFTextSize.height+20);
            
            //正则
            cell.ZFText.attributedText = [self getEmotionWithString:ZFTextString setMutableAttributedString:[self setRegularFromString:ZFTextString]] ;
            cell.ZFText.frame = CGRectMake(10, 10, ZFTextSize.width, ZFTextSize.height);
            ZFviewHeight = cell.ZFView.bounds.size.height;
            
        }
        
        //ZFImageView
        if (stu.retweeted_status.pic_urls.count != 0)
        {
            NSMutableDictionary * mdic = [self setImageViewWithArray:stu.retweeted_status.pic_urls];
            
            NSMutableArray * imgeviewArr = mdic[@"ImageView"];
            float height = [mdic[@"height"] floatValue];
            
            for (UIImageView * imgView in imgeviewArr)
            {
                [cell.ZFImageView addSubview:imgView];
                
            }
            
            cell.ZFImageView.frame = CGRectMake(10, ZFviewHeight,WIDTH-20, height);
            ZFviewHeight += height+10;
            cell.ZFView.frame = CGRectMake(0, myTextSize.height + 65, WIDTH, ZFviewHeight);
            
        }

        //downView
        cell.downView.frame = CGRectMake(0,  myTextSize.height + 65 + ZFviewHeight + myImageViewHeight  , WIDTH,40);
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
    SouYeData_statuses * stu = _allSouce.statuse[indexPath.row];
    CGSize myTextSize = [self getSizeWithString:stu.text andFont:15];
    float height = myTextSize.height + 105;
    
    //
    float height2 = 0;
    if (stu.retweeted_status.text != nil)
    {
        NSString * ZFTextString = [NSString stringWithFormat:@"@%@ :%@",stu.retweeted_status.user.name,stu.retweeted_status.text];
        
        CGSize ZFTextSize = [self getSizeWithString:ZFTextString andFont:14];
        height2 = ZFTextSize.height + 20;
    }
    
    //
    float height3 = 0;
    if (stu.pic_urls.count != 0)
    {
        NSMutableDictionary * mdic = [self setImageViewWithArray:stu.pic_urls];
        height3 = [mdic[@"height"] floatValue]+10;
    }
    
    //
    float height4 = 0;
    if (stu.retweeted_status.pic_urls.count != 0)
    {
        NSMutableDictionary * mdic = [self setImageViewWithArray:stu.retweeted_status.pic_urls];
        height4 = [mdic[@"height"] floatValue]+10;
    }

    return height + height2 + height3 + height4;
    
}

#pragma mark *************自适应高度
- (CGSize)getSizeWithString:(NSString *)string andFont:(CGFloat)font
{
    //
    CGSize size = CGSizeMake(WIDTH-20, 0);
    UIFont * Font = [UIFont systemFontOfSize:font];
    CGRect rect = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:Font} context:nil];
    CGSize size2 = CGSizeMake(rect.size.width, rect.size.height);
    
    return size2;
    
}

#pragma mark *************时间
- (NSString * )getTimeWithString:(NSString * )timeStr
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    
    //时区与标准时间查
    NSTimeZone * timeZone = [NSTimeZone localTimeZone];
    NSInteger cha = [timeZone secondsFromGMT];
    
    [formatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    NSDate * newdate = [formatter dateFromString:timeStr];
    //发微博的时间（当前时区）
    newdate = [NSDate dateWithTimeInterval:cha  sinceDate:newdate];
    
    //现在的时间（当前时区）
    NSDate * date = [NSDate dateWithTimeIntervalSinceNow:cha];
    
    //时间差(s)
    float cha2 = [date timeIntervalSinceDate:newdate]/60;
    //    NSLog(@"%f",cha2);
    
    NSString * time = nil;
    if (cha2<2)
    {
        time = @"刚刚";
        
    }
    else if(cha2<60)
    {
        time = [NSString stringWithFormat:@"%d分钟前",(int)cha2];
        
    }
    else if (cha2<60*24)
    {
        time = [NSString stringWithFormat:@"%d小时前",(int)cha2/60];
        
    }
    else
    {
        [formatter setDateFormat:@"MM月DD日"];
        NSDate * date = [formatter dateFromString:timeStr];
        //        NSLog(@"22222222222222---%@",date);
        time = [NSString stringWithFormat:@"%@",date];
    }
    
    return time;
}

#pragma mark *************正则
- (NSMutableAttributedString * )setRegularFromString:(NSString * )string
{
    NSString * parttern = @"(@\\w+)|(#\\w+#)|(http(s)?://([A-Za-z0-9._-]+(/)?)*)";
    NSRegularExpression * regular = [NSRegularExpression regularExpressionWithPattern:parttern options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray<NSTextCheckingResult *> * array = [regular matchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length)];
    
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc]initWithString:string];
    
    [array enumerateObjectsUsingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSRange range = obj.range;
        
        //根据每个指定字符的range给可变字符串添加属性
        [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:28/255.0 green:105/255.0 blue:216/255.0 alpha:1] range:range];
    }];
    
    return attributeString;
    
}

- (NSMutableAttributedString * )getEmotionWithString:(NSString * )string setMutableAttributedString:(NSMutableAttributedString * )attribute
{
    NSString * pattern = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+]";
    NSRegularExpression * regular = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray<NSTextCheckingResult *> * array = [regular matchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length)];
    
    
    
    __block NSInteger offset = 0;
    [array enumerateObjectsUsingBlock:^(NSTextCheckingResult * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //计算新的range
        NSRange newrange = NSMakeRange(obj.range.location-offset, obj.range.length);
        
        NSString * faceName = [string substringWithRange:obj.range];
        UIImage * image = [[UIImage alloc]initWithContentsOfFile:[self getFacePathWithFaceName:faceName]];
        NSTextAttachment * attachment = [[NSTextAttachment alloc]init];
        //设置表情大小
        UIFont * font = [UIFont systemFontOfSize:13];
        attachment.bounds = CGRectMake(0, -2, font.lineHeight, font.lineHeight);
        
        attachment.image = image;
        NSAttributedString * attrStr = [NSAttributedString attributedStringWithAttachment:attachment];
        //替换范围内的字符
        [attribute replaceCharactersInRange:newrange withAttributedString:attrStr];
        
        offset += obj.range.length-1;
        
    }];
    
    return attribute;
    
}

- (NSString * )getFacePathWithFaceName:(NSString * )faceName
{
    NSString * bundlePath = [[NSBundle mainBundle]pathForResource:@"Emoticons" ofType:@"bundle"];
    //默认表情
    NSString * path = [bundlePath stringByAppendingPathComponent:@"com.sina.default/info.plist"];
    NSDictionary * dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    NSArray * faceArray = dic[@"emoticons"];
    
    //浪小花
    NSString * path1 = [bundlePath stringByAppendingPathComponent:@"com.sina.lxh/info.plist"];
    NSDictionary * dic1 = [[NSDictionary alloc]initWithContentsOfFile:path1];
    NSArray * faceArray1 = dic1[@"emoticons"];
    
    
    for (NSDictionary * itemDic in faceArray)
    {
        if ([itemDic[@"chs"] isEqualToString:faceName])
        {
            NSString * facePath = [bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"com.sina.default/%@",itemDic[@"png"]]];
            return facePath;
            
        }
        else
        {
            for (NSDictionary * itemDic in faceArray1)
            {
                
                if ([itemDic[@"chs"] isEqualToString:faceName])
                {
                    
                    NSString * facePath = [bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"com.sina.lxh/%@",itemDic[@"png"]]];
                    return facePath;
                    
                }
                
            }
        }
    }
    
    return faceName;
}

#pragma mark *************图片
- (NSMutableDictionary * )setImageViewWithArray:(NSArray * )array
{
    NSMutableDictionary * mdic = [NSMutableDictionary dictionary];
    NSMutableArray * mArray = [NSMutableArray array];

    if (array.count == 1 )
    {
        UIImageView * imageView = [[UIImageView alloc]init];

        SouYeData_pic_urls * picModel = array.firstObject;
        NSURL * url = [NSURL URLWithString:picModel.thumbnail_pic];
        [imageView sd_setImageWithURL:url];
        float h = imageView.image.size.height;
        float w = imageView.image.size.width;
        
        imageView.frame = CGRectMake(0, 0, w, h);
        
        [mArray addObject:imageView];
        
        mdic[@"ImageView"] = mArray;
        mdic[@"height"] = @(h);
        
        return mdic;
    }
    else if (array.count == 4)
    {
        float x = (WIDTH-30)/3;
        for (int i = 0; i<array.count; i++)
        {
            UIImageView * imageView = [[UIImageView alloc]init];

            SouYeData_pic_urls * picModel = array[i];
            NSURL * url = [NSURL URLWithString:picModel.thumbnail_pic];
            [imageView sd_setImageWithURL:url];
            
            imageView.frame = CGRectMake(i%2*(x+5), i/2*(x+5), x, x);
            //设置图片填充样式
            [imageView setContentMode:UIViewContentModeScaleAspectFill];
            imageView.clipsToBounds = YES;
            
            [mArray addObject:imageView];
           
        }
        mdic[@"ImageView"] = mArray;
        mdic[@"height"] = @(2*x+5);
        
        return mdic;
    }
    else
    {
        float x = (WIDTH-30)/3;
        for (int i = 0; i<array.count; i++)
        {
            UIImageView * imageView = [[UIImageView alloc]init];

            SouYeData_pic_urls * picModel = array[i];
            NSURL * url = [NSURL URLWithString:picModel.thumbnail_pic];
            [imageView sd_setImageWithURL:url];
            
            imageView.frame = CGRectMake(i%3*(x+5), i/3*(x+5), x, x);
            
            //设置图片填充样式
            [imageView setContentMode:UIViewContentModeScaleAspectFill];
            imageView.clipsToBounds = YES;

            [mArray addObject:imageView];
            
        }
        mdic[@"ImageView"] = mArray;
        if (array.count<=3)
        {
            mdic[@"height"] = @(x);
        }
        else if (array.count<=6)
        {
            mdic[@"height"] = @(2*x+5);
        }
        else
        {
            mdic[@"height"] = @(3*x+10);
        }
        
        return mdic;

        
    }
    return nil;
    
    
    
}












@end
