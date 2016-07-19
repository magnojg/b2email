class ChangeStringToText < ActiveRecord::Migration
  def change
    change_column :ads, :title, :text
    change_column :ads, :subtitle, :text
  end
end
