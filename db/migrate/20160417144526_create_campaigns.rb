class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
