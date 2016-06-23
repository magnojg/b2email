class Company < ActiveRecord::Base
  has_many :campaigns, :dependent => :destroy
end
