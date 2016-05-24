class AddDimesionToAds < ActiveRecord::Migration
  def change
    add_column :ads, :dimensions, :string
  end
end
