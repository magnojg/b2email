class Campaign < ActiveRecord::Base
  belongs_to :company, :class_name => Company.model_name, :foreign_key => 'company_id'

  has_many :ad_bars, :dependent => :destroy

  has_many :login_bg_images, :dependent => :destroy
  accepts_nested_attributes_for :login_bg_images,
                                :allow_destroy => true,
                                reject_if: proc { |attributes| attributes['image'].blank? }

  validates :title, presence: true
end
