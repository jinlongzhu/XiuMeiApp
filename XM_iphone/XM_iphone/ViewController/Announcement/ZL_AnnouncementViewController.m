//
//  ZL_AnnouncementViewController.m
//  XM_iphone
//
//  Created by 朱金龙 on 16/6/8.
//  Copyright © 2016年 XiuMei. All rights reserved.
//

#import "ZL_AnnouncementViewController.h"
#import "UIFountion.h"
#import "ZL_TableViewController.h"
#import "Definition.h"
#import "BaseTableViewController.h"

#define  CELL_DEFINTION        @"ambocelldefin"
@implementation ZL_AnnouncementViewController
-(void) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton *rightButton=[UIFountion navgationRightButton:@"icon_search244_default" NavToTarget:self];
    [rightButton addTarget:self action:@selector(navRightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self creadTableView];
}
-(void) navRightButtonClick
{
    ZL_TableViewController *searchController=[[ZL_TableViewController alloc] init];
    [self.navigationController pushViewController:searchController animated:YES];
}
-(void) creadTableView
{
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN-kStatusBarHeight-kUITabBarFrameHeight) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[UIColor grayColor];
    _tableView.separatorColor=[UIColor redColor];
    _tableView.rowHeight=40;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
}
#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CELL_DEFINTION];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CELL_DEFINTION ];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        cell.textLabel.text=@"620022";
        cell.detailTextLabel.text=@"武钢股份";
        UIView *line = [[UIView alloc] init];
        line.frame = CGRectMake(10, 39,WIDTH_SCREEN-20,0.5);
        line.backgroundColor=[UIColor orangeColor];
        [cell.contentView addSubview:line];
    }
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewController *product=[[BaseTableViewController alloc] init];
    [self.navigationController pushViewController:product animated:YES];

}
@end