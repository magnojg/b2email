class Campaign < ActiveRecord::Base
  belongs_to :company, :class_name => Company.model_name, :foreign_key => 'company_id'
end
