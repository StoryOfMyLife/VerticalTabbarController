//
//  Dock.h
//  VerticalTabbarController
//
//  Created by 刘廷勇 on 13-11-28.
//  Copyright (c) 2013年 Netease Youdao. All rights reserved.
//

/**
 *  Dock : 相当于侧边的tabbar
 */

#import <UIKit/UIKit.h>
#import "DockItem.h"

static const CGFloat kDockWidth = 80; //dock默认宽度 宽度不能低于此值
static const CGFloat kItemHeight = 80; //item默认高度 宽度不能低于此值

@class Dock;

@protocol DockDelegate <NSObject>

@required

/**
 *  点击dockItem时触发
 *  
 *  @param dock         Dock
 *  @param selectedItem 选中的Item
 */
- (void)dock:(Dock *)dock didSelectItemAtIndex:(NSInteger)index;

@end

@interface Dock : UIView

/**
 *  dock 标签
 */
@property (nonatomic, copy) NSArray *dockItems;

/**
 *  设置 dock 宽度
 */
@property (nonatomic) CGFloat dockWidth;

/**
 *  设置 dockItem 高度
 */
@property (nonatomic) CGFloat itemHeight;

@property (nonatomic, weak) id<DockDelegate> delegate;

@end
