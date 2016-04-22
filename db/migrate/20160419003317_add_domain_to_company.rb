class AddDomainToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :domain_url, :text
  end
end
