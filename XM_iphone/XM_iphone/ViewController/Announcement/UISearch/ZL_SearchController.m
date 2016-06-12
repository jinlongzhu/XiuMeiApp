//
//  ZL_SearchController.m
//  XM_iphone
//
//  Created by 朱金龙 on 16/6/8.
//  Copyright © 2016年 XiuMei. All rights reserved.
//

#import "ZL_SearchController.h"

@implementation ZL_SearchController
- (instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController
{
    if (self = [super initWithSearchResultsController:searchResultsController]) {
        
        UITextField *textfield = [self.searchBar valueForKey:@"_searchField"];
        [textfield setValue:[UIFont systemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        
    }
    return self;
}

@end
