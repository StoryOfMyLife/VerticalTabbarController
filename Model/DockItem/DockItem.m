//
//  DockItem.m
//  VerticalTabbarController
//
//  Created by 刘廷勇 on 13-11-28.
//  Copyright (c) 2013年 Netease Youdao. All rights reserved.
//

#import "DockItem.h"

@implementation DockItem

+ (id)itemWithImage:(UIImage *)image 
      selectedImage:(UIImage *)selectedImage
              title:(NSString *)title
              modal:(BOOL)modal
{
    DockItem *item = [[DockItem alloc] init];
    item.image = image;
    item.selectedImage = selectedImage;
    item.title = title;
    item.modal = modal;
    
    item.selectedBackgroundColor = [UIColor blackColor];
    return item;
}

+ (id)itemWithImage:(UIImage *)image
      selectedImage:(UIImage *)selectedImage
              title:(NSString *)title
{
    return [self itemWithImage:image 
                 selectedImage:selectedImage
                        title:title
                        modal:NO];
}

@end
