class CreateAdminCampaigns < ActiveRecord::Migration
  def change
    create_table :admin_campaigns do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.references :admin_company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
