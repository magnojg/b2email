class CreateAdBars < ActiveRecord::Migration
  def change
    create_table :ad_bars do |t|
      t.string :position
      t.integer :css_width, default: 0
      t.integer :css_height, default: 0
      t.integer :images_limit, default: 0
      t.string :css_background_color, default: nil
      t.integer :space_between_images, default: 0

      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
