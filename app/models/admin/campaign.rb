class Admin::Campaign < ActiveRecord::Base
  belongs_to :admin_company, :class_name => Admin::Company.model_name, :foreign_key => 'admin_company_id'
end
