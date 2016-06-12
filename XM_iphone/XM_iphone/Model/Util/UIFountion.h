//
//  UIFountion.h
//  shopping
//  对UI控件的进行封装
//  Created by 朱金龙 on 16/5/17.
//  Copyright © 2016年 Long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIFountion : NSObject
//为导航添加背景图片
/**
 *  @brief 见下面自己理解
 */
+(void) createNavToTarget:(UIViewController *)target backgroundImageName:(NSString *)bgImageName leftbgImageName:(NSString *)leftbgImageName rightbgName:(NSString *)rightbgImageName;
/**
 *	@brief	导航栏返回按钮
 *
 *	@param 	title 返回按钮标题
 *
 *	@return	导航栏按钮
 */

+ (UIButton *)initNavgationBackButton:(NSString *)title;

/**
 *	@brief	设置导航栏标题
 *
 *	@param 	title 	标题内容
 *
 *	@return	导航栏标题View
 */
+(UILabel *)navgationLabel:(NSString *)title;

/**
 *	@brief	设置导航栏右侧
 *
 *	@param 	title 	按钮显示内容
 *
 *	@return	导航栏右侧按钮
 */

+(UIButton*)navgationRightButton:(NSString *)rightbgImageName NavToTarget:(UIViewController *)target;

/**
 *	@brief	用于tableHeader的Label
 *
 *	@param 	text 	显示内容
 *	@param 	frame 	位置以及大小
 *	@param  fontsize字体大小
 *	@param  color   字体颜色
 *
 *	@return tableHeader的Label
 */

@end
