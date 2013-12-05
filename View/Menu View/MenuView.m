//
//  MenuView.m
//  VerticalTabbarController
//
//  Created by 刘廷勇 on 13-11-28.
//  Copyright (c) 2013年 Netease Youdao. All rights reserved.
//

#import "MenuView.h"
#import "MenuItemButton.h"
#import "DockItem.h"

@interface MenuView()

/**
 *  当前选中的 item
 */
@property (nonatomic, strong) MenuItemButton *currentSelectedItem;

@end

@implementation MenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark -
#pragma mark Setters

- (void)setMenuItems:(NSArray *)menuItems
{
    if (_menuItems != menuItems) {
        _menuItems = menuItems;
        
        //得到items后即进行设置
        [self updateMenuItemButtons];
    }
}

#pragma mark -
#pragma mark 添加 item 按钮

- (void)updateMenuItemButtons
{
    //移除旧buttons
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    int count = self.menuItems.count;
    for (int i = 0; i<count; i++) {
        //TODO:以后可换成其他自定义button类
        //item按钮设置
        MenuItemButton *itemButton = [[MenuItemButton alloc] init];
        itemButton.frame = CGRectMake(0, i * self.itemHeight, self.frame.size.width, self.itemHeight);
        itemButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        itemButton.dockItem = self.menuItems[i];
        [itemButton addTarget:self action:@selector(clickMenuItem:) forControlEvents:UIControlEventTouchDown];
        
        if (i == 0) {
            [self clickMenuItem:itemButton];
        }
        
        [self addSubview:itemButton];
    }
}

- (void)layoutSubviews
{
    [self updateMenuItemButtons];
}

#pragma mark -
#pragma mark item 点击处理

- (void)clickMenuItem:(MenuItemButton *)itemButton
{
    //点击当前item暂时不进行响应
    if (self.currentSelectedItem == itemButton) {
        return;
    }
    
    itemButton.selected = YES;
    self.currentSelectedItem.selected = !itemButton.selected;
    self.currentSelectedItem = itemButton;
    
    //触发item点击响应事件
    NSInteger index = itemButton.frame.origin.y / self.itemHeight;
    if (self.menuItemClickedBlock) {
        self.menuItemClickedBlock(index);
    }
}

#pragma mark -
#pragma mark 旋转处理

- (void)rotateToOrientation:(UIInterfaceOrientation)orientation composeFrame:(CGRect)composeFrame
{
}

@end
