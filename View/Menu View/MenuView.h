//
//  MenuView.h
//  VerticalTabbarController
//
//  Created by 刘廷勇 on 13-11-28.
//  Copyright (c) 2013年 Netease Youdao. All rights reserved.
//

/**
 *  放置在Dock上的View，是可点击item的superView
 */

#import <UIKit/UIKit.h>

@class DockItem;

typedef void (^MenuItemClickedBlock)(NSInteger itemIndex);

@interface MenuView : UIView

/**
 *  设置 tabbar 上的 items，保存的是 dockItem
 */
@property (nonatomic, copy) NSArray *menuItems;//dockItem

/**
 *  设置 item 所占高度
 */
@property (nonatomic) CGFloat itemHeight;

/**
 *  item 点击的回调 Block
 */
@property (nonatomic, strong) MenuItemClickedBlock menuItemClickedBlock;

@end
