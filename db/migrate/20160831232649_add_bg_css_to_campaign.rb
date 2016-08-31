class AddBgCssToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :css_bgcolor_login_box, :string
  end
end
