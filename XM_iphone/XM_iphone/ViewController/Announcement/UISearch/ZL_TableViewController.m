//
//  ZL_TableViewController.m
//  XM_iphone
//
//  Created by 朱金龙 on 16/6/8.
//  Copyright © 2016年 XiuMei. All rights reserved.
//

#import "ZL_TableViewController.h"
#import "Definition.h"
#import "UIFountion.h"
#define ROWHEIGHT     30         //行高
#define SECTIONFOOTERHEIGHT    0
#define SECTIONHEADERHEIGHT    0

#define SEARCH_RECORDS @"searchRecords"

@implementation ZL_TableViewController
@synthesize searchRecords=_searchRecords;
@synthesize searchResults=_searchResults;
@synthesize deleteSearchRecordsButton=_deleteSearchRecordsButton;
-(void) viewDidLoad
{
    [super viewDidLoad];
    UILabel *navTitle=[UIFountion navgationLabel:@"搜索"];
    self.navigationItem.titleView=navTitle;
    
    
    _searchController=[[ZL_SearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater=self;
    _searchController.searchBar.delegate=self;
    _searchController.dimsBackgroundDuringPresentation=NO;
    _searchController.hidesNavigationBarDuringPresentation=NO;
    _searchController.searchBar.placeholder=@"请输入股票名称/代码/首字母/全拼";
    
    self.tableView.rowHeight=ROWHEIGHT;
    self.tableView.sectionFooterHeight=SECTIONFOOTERHEIGHT;
    self.tableView.sectionHeaderHeight=SECTIONHEADERHEIGHT;
    self.tableView.tableHeaderView=self.searchController.searchBar;
    [self loadSearchRecords];
}
-(void) loadSearchRecords
{
    if (self.searchRecords.count) {
        [self.searchResults removeAllObjects];
    }
    NSMutableArray *arry=[[NSUserDefaults standardUserDefaults] objectForKey:SEARCH_RECORDS];
    [self.searchRecords addObjectsFromArray:arry];
}
#pragma mark - UITableViewDelegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (_searchController.active && self.searchRecords.count && _searchController.searchBar.text.length == 0) {
        return @"搜索历史";
    } else if (_searchController.active && _searchController.searchBar.text.length) {
        return nil;
    }
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    if (_searchController.active && self.searchController.searchBar.text.length == 0) {
        if (self.searchRecords.count == 0) {
            return cell;
        }
        cell.textLabel.text = self.searchRecords[indexPath.row];
        return cell;
    }
    if (_searchController.active && self.searchController.searchBar.text.length) {
        cell.textLabel.text = self.searchResults[indexPath.row];
        return cell;
    }
    
    //    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;

}
//过滤方式算法*********************
#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    //定义过滤条件
    //beginWith endWith like constains
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains %@", searchController.searchBar.text];
    if (self.searchResults) {
        
    }
    //开始过滤
    NSMutableArray *searchResults = [NSMutableArray arrayWithArray:[_searchRecords filteredArrayUsingPredicate:predicate]];
    //    NSMutableArray *searchResults = [_dataArray filteredArrayUsingPredicate:predicate];
    
    if (self.searchResults) {
        [self.searchResults removeAllObjects];
    }
    //将过滤的内容显示
    self.searchResults = searchResults;
    [self.tableView reloadData];
}

#pragma mark-UISearchBarDelegate
//判断搜索内容是否存在在搜索历史中
-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    // 在这里拿到搜索框的关键字
    NSString *searchBarText = searchBar.text;
    // 把关键字存储到偏好设置中
    // 判断关键字是否已经存在
    for (NSString *searchRecord in self.searchRecords) {
        if ([searchBarText isEqualToString:searchRecord]) {
            return;
        }
    }
    // 不存在则存储到偏好设置
    [self.searchRecords addObject:searchBarText];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.searchRecords forKey:SEARCH_RECORDS];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    // 点击取消的时候，重写设置tableFooterView
    self.tableView.tableFooterView = [UIView new];
    NSLog(@"点击了取消按钮");
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"开始编辑了");
        if (self.searchRecords.count && self.searchController.searchBar.text.length == 0) {
        self.tableView.tableFooterView = self.deleteSearchRecordsButton;
        self.deleteSearchRecordsButton.hidden = NO;     } else if (self.searchRecords.count && self.searchController.searchBar.text.length) {
        self.deleteSearchRecordsButton.hidden = YES; // 有这么一种情况：如果我在搜索框中输入了一个关键字然后点击了“search”，那么此时搜索框失去焦点，再次点击搜索框使其聚焦，又会调用这个方法。也就是说，此时虽然这个文本框中有内容，当再次使其聚焦时，依然回调这个方法，所以我们需要判断搜索框中的内容的长度，如果长度为0，需要显示“清除搜索历史按钮”，如果长度不为0，则隐藏“清除搜索历史按钮”。
    } else { // 没有历史纪录
        self.tableView.tableFooterView = [UIView new]; // 没有历史纪录不显示“清除搜索历史”按钮；点击“取消”，tableView仍然会有那个“清除搜索历史”按钮，所以需要在取消的回调方法中，做同样设置
        [self.tableView reloadData];
    }
    
    searchBar.showsCancelButton = YES;
    for (id subView in [searchBar.subviews[0] subviews]) {
        if ([subView isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            UIButton *cancelButton = (UIButton *)subView;
            [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
            [cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            NSLog(@"...");
        }
    }
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText   // called when text changes (including clear)
{
    //    NSString *title = [self tableView:self.tableView titleForHeaderInSection:1];
    // 搜索框正在输入并且搜索框内有内容的时候隐藏“清除搜索历史”按钮；否则显示“清除搜索历史”按钮
    if (searchBar.text.length) {
        self.deleteSearchRecordsButton.hidden = YES;
    } else {
        self.deleteSearchRecordsButton.hidden = NO;
    }
}

#pragma mark-懒加载
-(NSMutableArray *)searchRecords
{
    if (!_searchRecords) {
        _searchRecords=[NSMutableArray array];
    }
    return _searchRecords;
}
- (NSMutableArray *)searchResults
{
    if (!_searchResults) {
        _searchResults = [NSMutableArray arrayWithObjects:@"belive",
                      @"1live",
                      @"love2",
                      @"i love you",
                      @"li22ke",
                      @"ju123st",
                      nil
                      ];
    }
    
    return _searchResults;
}
-(UIButton *)deleteSearchRecordsButton
{
    if (!_deleteSearchRecordsButton) {
        _deleteSearchRecordsButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 40)];
        [_deleteSearchRecordsButton setTitle:@"清除搜索历史" forState:UIControlStateNormal];
        [_deleteSearchRecordsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_deleteSearchRecordsButton setBackgroundColor:[UIColor clearColor]];
        //        [_deleteSearchRecordsButton setTintColor:[UIColor blackColor]]; // 不能设置button 的 title颜色
        [_deleteSearchRecordsButton addTarget:self action:@selector(didClickDeleteSearchRecordsButton:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _deleteSearchRecordsButton;
}
- (void)didClickDeleteSearchRecordsButton:(UIButton *)button
{
    NSLog(@"点击了清除搜索历史按钮");
    // 清除缓存的搜索记录
    [self.searchRecords removeAllObjects];
    // 更新偏好设置的搜索记录
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_searchRecords forKey:SEARCH_RECORDS];
    
    // 隐藏“清除搜索记录”按钮 和 “搜索历史”标题
    self.deleteSearchRecordsButton.hidden = YES;
    
    // 刷新表格
    [self.tableView reloadData];
    
}

@end
