class CheckRunLogEntryViewController < HtmlViewController
  attr_accessor :check_run
  attr_accessor :current_index
  
  def initWithCheckRun(check_run, index:index)
    self.check_run = check_run
    self.current_index = index
    initWithHTML(check_run.log[index].last, title:"Log entry")
  end
  
  def viewDidLoad
    super
    
    @up_down = UISegmentedControl.alloc.initWithItems(["▲", "▼"])
    @up_down.segmentedControlStyle = UISegmentedControlStyleBar
    @up_down.momentary = true
    @up_down.addTarget(self, action:"up_down:", forControlEvents:UIControlEventValueChanged)
 
    up_down_button_item = UIBarButtonItem.alloc.initWithCustomView(@up_down)
    
    self.navigationItem.rightBarButtonItem = up_down_button_item
  end

  def up_down(sender)
    if sender.selectedSegmentIndex == 0
      self.current_index -= 1
      self.current_index = 0 if self.current_index < 0
    else
      self.current_index += 1
      self.current_index = check_run.log.size - 1 if self.current_index >= check_run.log.size
    end
    
    self.html = check_run.log[self.current_index].last
    reload_content
  end
end