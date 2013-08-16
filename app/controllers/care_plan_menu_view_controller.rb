class CarePlanMenuViewController < UITableViewController
  #stylesheet :care_plan_menu_sheet

  ITEMS = [{
    title: 'Patient Name', #TODO: make this dynamic
    rows: [{
      title: 'CareTeam',
      key: :care_team
    },{
      title: 'Facilities',
      key: :facilities
    },{
      title: 'MedicalConditions',
      key: :medical_conditions
    },{
      title: 'Medications',
      key: :medications
    }]
  }]

  def init
    super
    #layout tableView, :table
    self
  end

  def leftSideMenuButtonPressed
    self.menuContainerViewController.toggleLeftSideMenuCompletion:^{
      setupMenuBarButtonItems
    }
  end

  def setupMenuBarButtonItems
    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed)
      #self.navigationItem.leftBarButtonItem = 
    end
  end

  def numberOfSectionsInTableView(tableView)
    ITEMS.size
  end

  def tableView(tableView, numberOfRowsInSection:section)
    ITEMS[section][:rows].size
  end

  def tableView(tableView, titleHeaderForSection:section)
    ITEMS[section][:title]
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)
    cell.textLabel.text = "Kaboom"
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton

    cell
    #fresh_cell.tap do |cell|
    #  text = ITEMS[indexPath.section][:rows][indexPath.row][:title]
    #  text = text.call if text.respond_to?(:call)
    #  cell.textLabel.text = text
    #end
  end

  def tableView(tableView, heightForHeaderInSection:section)
    section == 0 ? 0 : 30
  end

  def tableView(tableView, viewForHeaderInSection:section)
    view = UIView.alloc.initWithFrame([[0, 0], [320, 30]])
    layout(view, :header) do
      subview(UIView, :bottom_line)
      label = subview(UILabel, :header_label)
      label.text = tableView(tableView, titleForHeaderInSection:section)
    end 
    view
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    selected = ITEMS[indexPath.section][:rows][indexPath.row][:key]

    viewController = case selected
    when :care_team
      TeamMembersViewController.alloc.init
    when :facilities
      CareTeamViewController.alloc.init
    when :medical_conditions
      CareTeamViewController.alloc.init
    when :medications
      CareTeamViewController.alloc.init
    end

    #self.viewDeckController.centerController = LoggedInTasksNavigationController.alloc.initWithRootViewController(viewController)
    
    #tableView.deselectRowAtIndexPath(indexPath, animated:true)
    #self.viewDeckController.toggleLeftView
  end

private
  #def fresh_cell
  #  tableView.dequeueReusableCellWithIdentifier('Cell') ||
  #    UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:'Cell').tap do |cell|
  #      layout cell, :cell do
  #        subview(UIView, :top_line)
  #        subview(UIView, :bottom_line)
  #      end
  #
  #      cell.setSelectedBackgroundView(layout(UIView.alloc.init, :selected))
  #  end
  #end

end
