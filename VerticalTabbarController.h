//
//  VerticalTabbarController.h
//  VerticalTabbarController
//
//  Created by 刘廷勇 on 13-11-28.
//  Copyright (c) 2013年 Netease Youdao. All rights reserved.
//

/**
 *  使用方法一:
 *      1、继承此类
 *      2、设置 self.viewControllers
 *      3、设置 self.dock.dockItems (可设置属性包括:title, image, selectedImage, 
 *                                  backgroundColor, selectedBackgroundColor)
 *      4、设置 self.dock.itemHeight 和 self.dock.dockWidth 默认是 80*80
 *      5、设置此类为启动页
 *      例:
 *            UIViewController *vc1 = [[UIViewController alloc] init];
 *            UIViewController *vc2 = [[UIViewController alloc] init];
 *
 *            self.viewControllers = @[vc1, vc2];
 *
 *            self.dock.dockItems = @[[DockItem itemWithImage:image
 *                                              selectedImage:selectedImage
 *                                                      title:title],……];
 *  使用方法二:
 *      在AppDelegate中设置
 *
 *            VerticalTabbarController *vc = [[VerticalTabbarController alloc] init];
 *            
 *            UIViewController *vc1 = [[UIViewController alloc] init];
 *            UIViewController *vc2 = [[UIViewController alloc] init];
 *
 *            vc.viewControllers = @[vc1, vc2];
 *
 *            vc.dock.dockItems = @[[DockItem itemWithImage:image
 *                                              selectedImage:selectedImage
 *                                                      title:title], ...];
 *            self.window.rootViewController = vc;
 *            [self.window addSubview:vc.view];
 */

#import <UIKit/UIKit.h>
#import "Dock.h"

@class VerticalTabbarController;

@protocol VerticalTabbarControllerDelegate <NSObject>

@optional
/**
 *  controller点击事件delegate
 *  
 *  @param tabbarController   保存controller的container
 *  @param selectedController 被选中的controller
 */
- (void)tabbarController:(VerticalTabbarController *)tabbarController 
     didSelectController:(UIViewController *)selectedController;

@end

@interface VerticalTabbarController : UIViewController

/**
 *  child view controllers:设置此属性，将controller按顺序加入container中
 */
@property (nonatomic, copy) NSArray *viewControllers;

/**
 *  dock:相当于tabbar,用来加载dockItem
 */
@property (nonatomic, strong) Dock *dock;

/**
 *  controller点击事件delegate
 */
@property (nonatomic, weak) id<VerticalTabbarControllerDelegate> delegate;

@end
