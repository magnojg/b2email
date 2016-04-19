class CreateAdminAdBars < ActiveRecord::Migration
  def change
    create_table :admin_ad_bars do |t|
      t.integer :position
      t.references :admin_campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
