class AddDomainToCompany < ActiveRecord::Migration
  def change
    add_column :admin_companies, :domain_url, :text
  end
end
