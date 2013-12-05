
//  VerticalTabbarController.m
//  VerticalTabbarController
//
//  Created by 刘廷勇 on 13-11-28.
//  Copyright (c) 2013年 Netease Youdao. All rights reserved.
//

#import "VerticalTabbarController.h"

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

// 获得颜色
#define kGetColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define kGlobalBg kGetColor(46, 46, 46)

@interface VerticalTabbarController () <DockDelegate>
/**
 *  child controller view 内容显示
 */
@property (nonatomic, strong) UIView *contentView;

/**
 *  contentView.superView = transitionView; 
 *  transitionView.superView = self.view;
 *  用来调整frame，适配ios7
 */
@property (nonatomic, strong) UIView *transitionView;

/**
 *  当前显示的child controller
 */
@property (nonatomic, strong) UIViewController *currentChildController;

@end

@implementation VerticalTabbarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = kGlobalBg;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//for ios7
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - 
#pragma mark Getters and Setters

- (UIView *)transitionView
{
    if (!_transitionView) {
        //创建 transitionView
        _transitionView = [[UIView alloc] initWithFrame:self.view.bounds];
        _transitionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        /**
         *  iOS7 适配
         */
        if (IOS_VERSION >= 7.0) {
            CGRect frame = _transitionView.frame;
            frame.origin.y += 20;
            frame.size.height -= 20;
            _transitionView.frame = frame;
            
            //statusBar用黑色背景
            UIView *statusBarBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 20)];
            statusBarBackground.backgroundColor = [UIColor blackColor];
            statusBarBackground.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            [self.view addSubview:statusBarBackground];
            
            [self setNeedsStatusBarAppearanceUpdate];
        }
        
        [self.view addSubview:_transitionView];
    }
    return _transitionView;
}

- (Dock *)dock
{
    if (!_dock) {
        //创建 dock
        CGSize transitionSize = self.transitionView.bounds.size;
        CGRect dockFrame = CGRectMake(0, 0, kDockWidth, transitionSize.height);
        _dock = [[Dock alloc] initWithFrame:dockFrame];
        _dock.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleRightMargin;
        _dock.delegate = self;
        [self.transitionView addSubview:_dock];
    }
    return _dock;
}

- (UIView *)contentView
{
    if (!_contentView) {
        CGSize transitionSize = self.transitionView.bounds.size;
        CGFloat dockWidth = self.dock.frame.size.width;
        CGRect contentViewFrame = CGRectMake(dockWidth, 0, transitionSize.width - dockWidth, transitionSize.height);
        _contentView = [[UIView alloc] initWithFrame:contentViewFrame];
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.transitionView addSubview:_contentView];
    }
    return _contentView;
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    if (_viewControllers != viewControllers) {
        _viewControllers = viewControllers;
        //初始选中第一个item
        [self dock:self.dock didSelectItemAtIndex:0];
    }
}

#pragma mark -
#pragma mark Dock Delegate

- (void)dock:(Dock *)dock didSelectItemAtIndex:(NSInteger)index
{    
    UIViewController *selectedViewController = self.viewControllers[index];
    if (!selectedViewController) {
        return;
    }
    
    //暂时不处理点击当前item
    if (self.currentChildController == selectedViewController) {
        return;
    }
    
    //TODO:处理 modal controller，设置modalStyle
    DockItem *selectedItem = dock.dockItems[index];
    if (selectedItem.modal) {
        selectedViewController.modalPresentationStyle = UIModalPresentationFormSheet;
        [self presentViewController:selectedViewController animated:YES completion:nil];
        return;
    }
    
    //TODO:可以在这里添加 transition animation
//    [UIView transitionFromView:self.currentChildController.view
//                        toView:selectedViewController.view
//                      duration:0.3
//                       options:UIViewAnimationOptionTransitionCrossDissolve 
//                    completion:nil];
    
    [self.currentChildController.view removeFromSuperview];
    [self.currentChildController removeFromParentViewController];
    
    [self addChildViewController:selectedViewController];
    
    selectedViewController.view.frame = self.contentView.bounds;
    selectedViewController.view.autoresizingMask = self.contentView.autoresizingMask;
    [self.contentView addSubview:selectedViewController.view];
    
    self.currentChildController = selectedViewController;
    
    //通知delegate
    if ([self.delegate respondsToSelector:@selector(tabbarController:didSelectController:)]) {
        [self.delegate tabbarController:self didSelectController:selectedViewController];
    }
}

@end