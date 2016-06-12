//
//  Definition.h
//  shopping
//
//  Created by 朱金龙 on 16/5/14.
//  Copyright © 2016年 Long. All rights reserved.
//

#ifndef Definition_h
#define Definition_h

#define kTableViewNumberOfRowsKey       @"numberOfRows"
#define kTableViewCellListKey           @"cellList"
#define kTableViewCellHeightKey         @"cellHeight"
#define kTableViewCellTypeKey           @"cellType"
#define kTableViewCellDataKey           @"cellData"
#define kTableViewSectionHeaderHeightKey      @"sectionHeaderHeight"
#define kTableViewSectionHeaderTypeKey        @"sectionHeaderType"
#define kTableViewSectionFooterHeightKey      @"sectionFooterHeight"
#define kTableViewSectionFooterTypeKey        @"sectionFooterType"
/**
 ****************判断手机版本
 */
#define IOS8_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS7_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS6_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS5_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS4_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
#define IOS3_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )
/**
 ****************登陆状态宏
 */
#define  FIRSTINSTALL  @"firstInstall"


/**
 *****************Frame宏
 */
#define ZERO_SCREEN      0
#define BOUNDS_SCREEN   [UIScreen mainScreen].bounds
#define WIDTH_SCREEN    [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN   [UIScreen mainScreen].bounds.size.height

#define kUINavigationBarFrameHeight         44.0f
#define kUITabBarFrameHeight                49.0f
#define kIphone5Fix                         88

#define isIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#define kStatusBarHeight                    20
/**
 *****************COLOR宏
 */
//app主色调
#define COLOR_3B4F61 [UIColor colorWithRed:(59 /255.0f) green:(79/255.0f) blue:(97/255.0f) alpha:1.0f]


// Nav的主背景色定义
#define NAV_BG_COLOUR [UIColor colorWithRed:53/255.0 green:169/255.0 blue:237/255.0 alpha:1]



#define BACKGROUNDCOLOR(r, g, b) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1.0f]
#define CLEARCOLOR      [UIColor clearColor]
#endif /* Definition_h */

/**
 *  **************国际化
 */
#undef L
#define L(key) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]
//国家化宏