//
//  ZL_TabBarController.m
//  shopping
//
//  Created by 朱金龙 on 16/6/8.
//  Copyright © 2016年 Long. All rights reserved.
//

#import "ZL_TabBarController.h"
#import "Definition.h"
#import "UIFountion.h"

@implementation ZL_TabBarController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=CLEARCOLOR;
    [self initTabBar];
    
}
-(void) initTabBar
{
    
    
    //公告
    ZL_AnnouncementViewController *atViewController=[[ZL_AnnouncementViewController alloc] init];
    UINavigationController *navAtViewController=[[UINavigationController alloc] initWithRootViewController:atViewController];
    UILabel *navTitle=[UIFountion navgationLabel:@"公告"];
    atViewController.navigationItem.titleView=navTitle;
   //老板
    ZL_BossViewController *bossViewController=[[ZL_BossViewController alloc] init];
    UINavigationController *navBossViewController=[[UINavigationController alloc] initWithRootViewController:bossViewController];
    UILabel *navTitle_boss=[UIFountion navgationLabel:@"Boss"];
    bossViewController.navigationItem.titleView=navTitle_boss;

        //我的
    ZL_MyInfoViewController *myInfoViewController=[[ZL_MyInfoViewController alloc] init];
    UINavigationController *navMyInfoViewController=[[UINavigationController alloc] initWithRootViewController:myInfoViewController];
    UILabel *navTitle_my=[UIFountion navgationLabel:@"我的"];
    myInfoViewController.navigationItem.titleView=navTitle_my;


    
    self.tabBarController.delegate=self;
        NSArray *navAry=[[NSArray alloc] initWithObjects:navAtViewController,navBossViewController,navMyInfoViewController ,nil];
    
    self.tabBarController.viewControllers=navAry;
    self.tabBarController.selectedIndex = 0;
    for (UINavigationController *controller in navAry) {
        controller.navigationBar.translucent=NO;
    }
//    self.tabBarController.selectedIndex = 1;
//    self.tabBarController.selectedIndex = 0;
    [self setStyle];
}
-(void) setStyle
{
    //创建系统提供的Item,定制
    //1.准备两个数组，一个数组存未点击的按钮的图片另外一个存选中的按钮图片
    //未选中按钮牛的图片
    NSArray *unSelectImage=@[@"tab_buddy_nor@2x",@"tab_recent_nor@2x",@"tab_me_nor@2x",@"tab_qworld_nor@2x"];
    //以选中按钮牛的图片
    NSArray *selectedImage=@[@"tab_buddy_press@2x",@"tab_recent_press@2x",@"tab_me_press@2x",@"tab_qworld_press@2x"];
    //存放标题
    NSArray *aryTitle=@[@"公告",@"BOSS",@"我的"];
    
    //提供循环生成Item
    //在UITabBarController中有多少的视图，就要穿件多少个Item;
    for (int i=0; i<self.tabBarController.tabBar.items.count; i++)
    {
        //创建分栏控制器上得按钮
        //从分栏控制器取到按钮
        //系统按钮在指定试图使就已经创建好了，没有任何样式。
        UITabBarItem *tempItem=self.tabBarController.tabBar.items[i];
        //设置样式
        //常见错误：在使用图片时，经常把字符串当图片使用。
        //必须对按钮上得图片进行阴影处理，否则显示的时图片的阴影
        //需要对文字进行处理，否则显示不出来
        
        UIImage *unImage=[UIImage imageNamed:unSelectImage[i]];
        unImage=[unImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //处理阴影；
        
        
        UIImage *image=[UIImage imageNamed:selectedImage[i]];
        image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        NSString *strTitle=aryTitle[i];
        
        [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
        
        [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateSelected];
        //总结：原生  iOS系统提供的   深度定制
        //分栏控制器   定制了分栏控制条
        //定制了按钮
        //对获取的按钮进行设置
        tempItem =[tempItem initWithTitle:strTitle image:unImage selectedImage:image];
        
        
    }
    
    
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(UITabBarController *)tabBarController
{
    return self;
}

@end
