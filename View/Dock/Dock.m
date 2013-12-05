//
//  Dock.m
//  VerticalTabbarController
//
//  Created by 刘廷勇 on 13-11-28.
//  Copyright (c) 2013年 Netease Youdao. All rights reserved.
//

#import "Dock.h"
#import "MenuView.h"

@interface Dock()

@property (nonatomic, strong) MenuView *menuView;

@end

@implementation Dock

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

#pragma mark -
#pragma mark Setters and Getters

- (void)setDockItems:(NSArray *)dockItems
{
    if (_dockItems != dockItems) {
        _dockItems = dockItems;
        self.menuView.menuItems = _dockItems;
    }
}

- (MenuView *)menuView
{
    if (!_menuView) {
        //这里可以设置frame，让items下移，给dock顶端留出空间放置其他空间（比如：个人信息）
        CGRect frame = self.frame;
        _menuView = [[MenuView alloc] initWithFrame:frame];
        //itemHeight 不低于默认高度
        _menuView.itemHeight = MAX(self.itemHeight, kItemHeight);
        
        //设置点击item通知事件
        __weak Dock *weakDock = self;
        _menuView.menuItemClickedBlock = ^(NSInteger index) {
            if ([weakDock.delegate respondsToSelector:@selector(dock:didSelectItemAtIndex:)]) {
                [weakDock.delegate dock:weakDock didSelectItemAtIndex:index];
            }
        };
        [self addSubview:_menuView];
    }
    return _menuView;
}

- (void)setDockWidth:(CGFloat)dockWidth
{
    //dock 宽度不能小于默认宽度
    if (dockWidth < kDockWidth) {
        return;
    }
    
    if (_dockWidth != dockWidth) {
        _dockWidth = dockWidth;
        CGRect frame = self.frame;
        frame.size.width = _dockWidth;
        self.frame = frame;
        [self setNeedsLayout];
    }    
}

- (void)setItemHeight:(CGFloat)itemHeight
{
    //item 高度不能小于默认高度
    if (itemHeight < kItemHeight) {
        return;
    }
    if (_itemHeight != itemHeight) {
        _itemHeight = itemHeight;
        self.menuView.itemHeight = _itemHeight;
        [self setNeedsLayout];
    }
}

//刷新布局
- (void)layoutSubviews
{
    self.menuView.frame = self.frame;
    [self.menuView setNeedsLayout];
}

#pragma mark -
#pragma mark 后续旋转处理

- (void)rotateToOrientation:(UIInterfaceOrientation)orientation composeFrame:(CGRect)composeFrame
{
    
}

@end
