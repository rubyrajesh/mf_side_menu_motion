class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @navigationController = UINavigationController.alloc.initWithRootViewController(DemoViewController.alloc.init)
    tabBarController = UITabBarController.alloc.init
    tabBarController.viewControllers = [@navigationController, @navigationController]

    leftSideMenuController = SideMenuViewController.alloc.init
    rightSideMenuController = SideMenuViewController.alloc.init
    container = MFSideMenuContainerViewController.containerWithCenterViewController(tabBarController,
                                                                                    leftMenuViewController: leftSideMenuController,
                                                                                    rightMenuViewController: rightSideMenuController)
    @window.rootViewController = container
    @window.makeKeyAndVisible

  end
end
