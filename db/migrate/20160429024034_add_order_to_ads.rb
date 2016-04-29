class AddOrderToAds < ActiveRecord::Migration
  def change
    add_column :ads, :order, :integer
  end
end
