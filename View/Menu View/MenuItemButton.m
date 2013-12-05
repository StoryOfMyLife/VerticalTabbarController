//
//  MenuItemButtom.m
//  VerticalTabbarController
//
//  Created by 刘廷勇 on 13-11-28.
//  Copyright (c) 2013年 Netease Youdao. All rights reserved.
//

#import "MenuItemButton.h"
#import "DockItem.h"

@implementation MenuItemButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        self.adjustsImageWhenHighlighted = NO;

//        UIImage *image = [UIImage imageNamed:@"tabbar_separate_selected_bg.png"];
//        CGFloat widthCap = image.size.width * 0.5;
//        CGFloat heightCap = image.size.height * 0.5;
//        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(heightCap, widthCap, heightCap, widthCap)];
//        [self setBackgroundImage:image forState:UIControlStateSelected];
    }
    return self;
}

- (void)setDockItem:(DockItem *)dockItem
{
    if (_dockItem != dockItem) {
        _dockItem = dockItem;
        
        // 1.设置图片
        [self setImage:dockItem.image
              forState:UIControlStateNormal];
        [self setImage:dockItem.selectedImage
              forState:UIControlStateSelected];
        // 2.设置文字
        [self setTitle:dockItem.title
              forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.backgroundColor = dockItem.backgroundColor;
        
        /**
         *  调整button内容布局
         */
        CGFloat gap = 6;//图片与文字之间的距离
        
        CGSize imageSize = self.imageView.frame.size;
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0,
                                                - imageSize.width,
                                                - imageSize.height - gap,
                                                0.0);
        
        CGSize labelSize = self.titleLabel.frame.size;
        self.imageEdgeInsets = UIEdgeInsetsMake(- labelSize.height - gap,
                                                0.0,
                                                0.0,
                                                - labelSize.width);                      
    }
}

- (void)setSelected:(BOOL)selected
{
    //若是modal模式，则不改变item状态
    if (self.dockItem.modal) {
        selected = NO;
    }
    [super setSelected:selected];
    if (selected) {
        self.backgroundColor = self.dockItem.selectedBackgroundColor;
    } else {
        self.backgroundColor = self.dockItem.backgroundColor;
    }
}

//覆盖默认方法，取消highlighted状态
- (void)setHighlighted:(BOOL)highlighted
{
}

@end
