class AdBar < ActiveRecord::Base
  belongs_to :campaign, :class_name => Campaign.model_name, :foreign_key => :campaign_id
  has_one :company, :through => :campaign

  enum positions: [ :top, :bottom, :left, :right ]

  has_many :ads
  accepts_nested_attributes_for :ads,
                                :allow_destroy => true,
                                reject_if: proc { |attributes| attributes['title'].blank? || attributes['image'].blank? }
end
