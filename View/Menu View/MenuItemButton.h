//
//  MenuItemButtom.h
//  VerticalTabbarController
//
//  Created by 刘廷勇 on 13-11-28.
//  Copyright (c) 2013年 Netease Youdao. All rights reserved.
//

/**
 *  item button:负责点击事件的tabbar item
 */

#import <UIKit/UIKit.h>

@class DockItem;

@interface MenuItemButton : UIButton
/**
 *  用来保存button需要的属性
 */
@property (nonatomic, strong) DockItem *dockItem;//model

@end
