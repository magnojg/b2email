class AdBar < ActiveRecord::Base
  belongs_to :campaign, :class_name => Campaign.model_name, :foreign_key => :campaign_id

  enum positiones: { top: 1, bottom: 2, left: 3, right: 4 }

end
