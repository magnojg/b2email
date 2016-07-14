class CreateLoginBgImages < ActiveRecord::Migration
  def change
    create_table :login_bg_images do |t|

      t.attachment :image
      t.string :dimensions
      t.integer :sort_order, default: nil

      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
