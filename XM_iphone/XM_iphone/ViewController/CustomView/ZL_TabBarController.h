//
//  ZL_TabBarController.h
//  shopping
//
//  Created by 朱金龙 on 16/6/8.
//  Copyright © 2016年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZL_AnnouncementViewController.h"
#import "ZL_BossViewController.h"
#import "ZL_MyInfoViewController.h"
/**
 *  @brief 底部选择按键
 */
@interface ZL_TabBarController : UITabBarController<UITabBarControllerDelegate>
@property (nonatomic, retain, readonly)UITabBarController                *tabBarController;
@end
