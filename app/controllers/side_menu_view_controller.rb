class SideMenuViewController < UITableViewController
  def tableView(tableView, titleForHeaderInSection: section)
    "Section"
  end

  def numberOfSectionsInTableView(tableView)
    2
  end

  def numberOfRowsInSection(tableView)
    10
  end

  CellID = 'CellIdentifier'
  def cellForRowAtIndexPath(indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)
    cell.textLabel.text = "Item"
    cell

  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    demoController = DemoViewController.alloc.init
    demoController.title = "Demo"
    tabBarController = self.menuContainerViewController.centerViewController
    navigationController = tabBarController.selectedViewController
    navigationController.viewControllers = [demoController]
    self.menuContainerViewController.setMenuState(MFSideMenuStateClosed)
  end
end
