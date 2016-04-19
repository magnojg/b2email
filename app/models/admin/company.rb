class Admin::Company < ActiveRecord::Base
  has_many :admin_campaigns
end
