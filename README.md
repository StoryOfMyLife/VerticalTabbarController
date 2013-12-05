VerticalTabbarController
========================

A vertical tabbar controller for iPad.

	
    使用方法一:
        1、继承此类
        2、设置 self.viewControllers
        3、设置 self.dock.dockItems (可设置属性包括:title, image, selectedImage, 
                                    backgroundColor, selectedBackgroundColor)
        4、设置 self.dock.itemHeight 和 self.dock.dockWidth 默认是 80*80
        5、设置此类为启动页
        例:
              UIViewController *vc1 = [[UIViewController alloc] init];
              UIViewController *vc2 = [[UIViewController alloc] init];
  
              self.viewControllers = @[vc1, vc2];
  
              self.dock.dockItems = @[[DockItem itemWithImage:image
                                                selectedImage:selectedImage
                                                        title:title],……];
    使用方法二:
        在AppDelegate中设置
  
              VerticalTabbarController *vc = [[VerticalTabbarController alloc] init];
              
              UIViewController *vc1 = [[UIViewController alloc] init];
              UIViewController *vc2 = [[UIViewController alloc] init];
  
              vc.viewControllers = @[vc1, vc2];
  
              vc.dock.dockItems = @[[DockItem itemWithImage:image
                                              selectedImage:selectedImage
                                                      title:title], ...];
              self.window.rootViewController = vc;
              [self.window addSubview:vc.view];
 