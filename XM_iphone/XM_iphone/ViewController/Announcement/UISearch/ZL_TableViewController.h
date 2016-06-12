//
//  ZL_TableViewController.h
//  XM_iphone
//
//  Created by 朱金龙 on 16/6/8.
//  Copyright © 2016年 XiuMei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZL_SearchController.h"

@interface ZL_TableViewController : UITableViewController<UISearchBarDelegate,UISearchControllerDelegate,UISearchResultsUpdating>
/**
 *  @brief 所有数据
 */
@property (nonatomic,strong) NSMutableArray *allDataAry;
/**
 *  @brief 所有搜索数据集
 */
@property (nonatomic,strong) NSMutableArray *searchResults;
/**
 *  @brief 搜索记录
 */
@property (nonatomic,strong) NSMutableArray *searchRecords;
/**
 *  @brief 搜索控制器
 */
@property (nonatomic,strong) ZL_SearchController *searchController;
/**
 *  @brief 清除历史记录按钮
 */
@property (nonatomic,strong) UIButton *deleteSearchRecordsButton;

@end
