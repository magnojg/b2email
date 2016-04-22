class AddStyleFieldsToAdBar < ActiveRecord::Migration
  def change
    add_column :ad_bars, :bg_color, :string
    add_column :ad_bars, :height, :string
    add_column :ad_bars, :width, :string
  end
end
