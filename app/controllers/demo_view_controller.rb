class DemoViewController < UIViewController

  def viewDidLoad
    self.title = "Demo"
    setupMenuBarButtonItems
  end

  def setupMenuBarButtonItems
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Menu", style:UIBarButtonItemStylePlain,
                                                                                 target: self,
                                                                                 action: 'rightSideMenuButtonPressed')
     

    self.navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Menu", style:UIBarButtonItemStylePlain,
                                                                                 target: self,
                                                                                 action: 'leftSideMenuButtonPressed')
  end

  def leftSideMenuButtonPressed
    self.menuContainerViewController.toggleLeftSideMenuCompletion:^{
      setupMenuBarButtonItems
    }
  end
  
  def righttSideMenuButtonPressed
    self.menuContainerViewController.toggleLeftSideMenuCompletion:^{
      setupMenuBarButtonItems
    }
  end
end
