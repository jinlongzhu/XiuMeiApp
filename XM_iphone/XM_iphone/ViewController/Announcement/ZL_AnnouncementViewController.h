//
//  ZL_AnnouncementViewController.h
//  XM_iphone
//
//  Created by 朱金龙 on 16/6/8.
//  Copyright © 2016年 XiuMei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZL_AnnouncementViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView  *tableView;
@property (nonatomic,strong) NSMutableArray  *AmboAry;
@end
