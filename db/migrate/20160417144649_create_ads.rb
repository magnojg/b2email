class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.attachment :image
      t.text :title
      t.text :subtitle
      t.text :url
      t.references :ad_bar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
