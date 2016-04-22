class AdBar < ActiveRecord::Base
  belongs_to :campaign, :class_name => Campaign.model_name, :foreign_key => :campaign_id

  enum positions: { top: 1, bottom: 2, left: 3, right: 4 }

  has_many :ads
  accepts_nested_attributes_for :ads, :allow_destroy => true
end
