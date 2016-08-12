class AdBar < ActiveRecord::Base
  belongs_to :campaign, :class_name => Campaign.model_name, :foreign_key => :campaign_id
  has_one :company, :through => :campaign

  enum positions: [ :left, :right ]

  has_many :ads, :dependent => :destroy
  accepts_nested_attributes_for :ads,
                                :allow_destroy => true,
                                reject_if: proc { |attributes| attributes['image'].blank? }

  def self.search(params)

    where_clause = []

    where_clause.push("ad_bars.position = '#{params[:position]}'") unless params[:position].blank?
    where_clause.push("ad_bars.campaign_id = #{params[:campaign_id]}") unless params[:campaign_id].blank?
    where_clause.push("ad_bars.id = #{params[:ad_bar_id]}") unless params[:ad_bar_id].blank?

    includes(:ads)
    .uniq
    .where(where_clause.join(' AND '))
    .order(:id => :desc).first
  end
end
