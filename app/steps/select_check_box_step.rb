class SelectCheckBoxStep < Step
  data_attribute :name
  
  include Formotion::Formable
  
  form_property :name, :string
  
  def self.summary
    I18n.t("steps.select_check_box.summary")
  end
  
  def detail
    I18n.t("steps.select_check_box.detail", :name => self.name)
  end
end
