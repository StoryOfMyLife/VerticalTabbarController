//
//  DockItem.h
//  VerticalTabbarController
//
//  Created by 刘廷勇 on 13-11-28.
//  Copyright (c) 2013年 Netease Youdao. All rights reserved.
//

/**
 *  Model类，用来初始化item的各种属性
 */

#import <Foundation/Foundation.h>

@interface DockItem : NSObject

/**
 *  item标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  item图标
 */
@property (nonatomic, strong) UIImage *image;

/**
 *  item图标选中态
 */
@property (nonatomic, strong) UIImage *selectedImage;

/**
 *  item背景颜色
 */
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 *  item背景选中后颜色
 */
@property (nonatomic, strong) UIColor *selectedBackgroundColor;

/**
 *  item对应的controller是否以模态窗口的形式展示
 */
@property (nonatomic) BOOL modal;


/**
 *  带标题图标的初始化方法
 *  
 *  @param image     item图标
 *  @param title     item标题
 *  
 *  @return item
 */
+ (id)itemWithImage:(UIImage *)image 
      selectedImage:(UIImage *)selectedImage
              title:(NSString *)title;

/**
 *  带标题图标的初始化方法
 *  
 *  @param image     item图标
 *  @param title     item标题
 *  @param modal     controller是否以模态形式展示
 *  
 *  @return item
 */
+ (id)itemWithImage:(UIImage *)image 
      selectedImage:(UIImage *)selectedImage
              title:(NSString *)title
              modal:(BOOL)modal;


@end
