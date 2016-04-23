class AddCssStyleToAdBars < ActiveRecord::Migration
  def change
    add_column :ad_bars, :css_style, :string
  end
end
