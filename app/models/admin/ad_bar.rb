class Admin::AdBar < ActiveRecord::Base
  belongs_to :admin_campaign, :class_name => Admin::Campaign.model_name, :foreign_key => :admin_campaign_id

  enum positiones: { top: 1, bottom: 2, left: 3, right: 4 }

end
