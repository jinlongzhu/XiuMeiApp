//
//  UIFountion.m
//  shopping
//
//  Created by 朱金龙 on 16/5/17.
//  Copyright © 2016年 Long. All rights reserved.
//

#import "UIFountion.h"
#import "Definition.h"
#define NAV_TITLE_FONT    18
#define NAV_TITLE_HEIGHT    44
@implementation UIFountion

+(void) createNavToTarget:(UIViewController *)target backgroundImageName:(NSString *)bgImageName leftbgImageName:(NSString *)leftbgImageName rightbgName:(NSString *)rightbgImageName
{
    if (bgImageName!=nil)
    {
        if ([target.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
        {
                    [target.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:bgImageName] forBarMetrics:UIBarMetricsDefault];
        }
        target.navigationController.navigationBar.tintColor=NAV_BG_COLOUR;

    }
    if (rightbgImageName!=nil)
    {
        UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [rightBtn setImage:[UIImage imageNamed:rightbgImageName] forState:UIControlStateNormal];
        
        [rightBtn setImage:[UIImage imageNamed:rightbgImageName] forState:UIControlStateHighlighted];
        [rightBtn setFrame:CGRectMake(0, 0, 50, 40)];
        target.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:rightBtn];
        
    }
    if (leftbgImageName!=nil)
    {
        UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtn setImage:[UIImage imageNamed:leftbgImageName] forState:UIControlStateNormal];
        
        [leftBtn setImage:[UIImage imageNamed:leftbgImageName] forState:UIControlStateHighlighted];
        [leftBtn setFrame:CGRectMake(0, 0, 50, 40)];
        target.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        
    }
    

}
+ (UIButton *)initNavgationBackButton:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(-2, 5, 65, 40)];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:@"tou_bu_tu_biao_fan_hui"] forState:UIControlStateNormal];
//
//    //设置UIButton上图片的位置,图片向左移动8个像素
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -18, 0, 0)];/// 这行如果注释了导航栏左按钮会向右偏移
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [btn setTitleColor:COLOR_3B4F61 forState:UIControlStateNormal];
    
    return btn;
}
+(UILabel *)navgationLabel:(NSString *)title
{
    UILabel *lable=[[UILabel alloc] init];
    lable.text=title;
    lable.textColor=COLOR_3B4F61;
    
    lable.frame=CGRectMake(0, 0, 0, NAV_TITLE_HEIGHT);
    lable.font=[UIFont boldSystemFontOfSize:NAV_TITLE_FONT];
    lable.backgroundColor=CLEARCOLOR;
    [lable setTextAlignment:NSTextAlignmentCenter];
    return lable;
    
}
+(UIButton*)navgationRightButton:(NSString *)rightbgImageName NavToTarget:(UIViewController *)target
{
    UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:rightbgImageName] forState:UIControlStateNormal];
    
    [leftBtn setImage:[UIImage imageNamed:rightbgImageName] forState:UIControlStateHighlighted];
    [leftBtn setFrame:CGRectMake(0, 0, 50, 40)];
    target.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    return leftBtn;
}
@end
