//
//  BaseTableViewController.m
//  XM_iphone
//
//  Created by 朱金龙 on 16/6/9.
//  Copyright © 2016年 XiuMei. All rights reserved.
//

#import "BaseTableViewController.h"
#import "SCNavTabBarController.h"
#import "UIFountion.h"

#import "ProductsViewController.h"
#import "FinancialStatementViewController.h"
#import "StockScaleViewController.h"
#import "PoliticsViewController.h"




@implementation BaseTableViewController
-(void) viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *navTitle=[UIFountion navgationLabel:@"武钢股份-620022"];
    self.navigationItem.titleView=navTitle;
    
    UIButton *rightButton=[UIFountion navgationRightButton:@"productDetail_wifi_share_clicked.png" NavToTarget:self];
    [rightButton addTarget:self action:@selector(Share) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self CreatScrollView];
}
-(void) CreatScrollView
{
    ProductsViewController *oneViewController = [[ProductsViewController alloc] init];
    oneViewController.title = @"产业分布";
    oneViewController.view.backgroundColor = [UIColor brownColor];
    
    StockScaleViewController *twoViewController = [[StockScaleViewController alloc] init];
    twoViewController.title = @"股东占比";
    twoViewController.view.backgroundColor = [UIColor purpleColor];
    
    FinancialStatementViewController *threeViewController = [[FinancialStatementViewController alloc] init];
    threeViewController.title = @"财务状况";
    threeViewController.view.backgroundColor = [UIColor orangeColor];
    
    PoliticsViewController *fourViewController = [[PoliticsViewController alloc] init];
    fourViewController.title = @"大事件";
    fourViewController.view.backgroundColor = [UIColor magentaColor];
    
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[oneViewController, twoViewController, threeViewController, fourViewController];
    navTabBarController.showArrowButton = YES;
    [navTabBarController addParentController:self];
     [UMSocialData openLog:YES];

}
-(void) Share
{
    
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
                                     shareImage:[UIImage imageNamed:@"dicon_01"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                       delegate:self];
}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}
@end
