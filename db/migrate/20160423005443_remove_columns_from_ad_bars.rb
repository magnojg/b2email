class RemoveColumnsFromAdBars < ActiveRecord::Migration
  def change
    remove_column :ad_bars, :bg_color, :string
    remove_column :ad_bars, :height, :string
    remove_column :ad_bars, :width, :string
  end
end
