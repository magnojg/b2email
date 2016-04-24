class CreateAdBars < ActiveRecord::Migration
  def change
    create_table :ad_bars do |t|
      t.string :position
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
