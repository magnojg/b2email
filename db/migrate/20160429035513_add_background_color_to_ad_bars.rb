class AddBackgroundColorToAdBars < ActiveRecord::Migration
  def change
    add_column :ad_bars, :background_color, :string
  end
end
