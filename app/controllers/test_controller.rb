class TestController < ApplicationController

  add_breadcrumb "Test Page", :test_index_path

  def index
    @companies = Company.all.order(:name).pluck(:name, :id)

    @campaigns = []
    # Campaign.includes(:company)
    #                      .order("companies.name, campaigns.title")
    #                      .map { |campaign| ["#{campaign.company.try(:name)}: #{campaign.title}", campaign.id] }

    @ad_bars = []
  end
end
