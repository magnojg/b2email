class AddCssFields < ActiveRecord::Migration
  def change
    add_column :ad_bars, :css_width, :integer, default: 0
    add_column :ad_bars, :css_height, :integer, default: 0
    add_column :ad_bars, :images_limit, :integer, default: 0
    add_column :ad_bars, :space_between_images, :integer, default: 0
    remove_column :ad_bars, :css_style
    rename_column :ad_bars, :background_color, :css_background_color
  end
end
