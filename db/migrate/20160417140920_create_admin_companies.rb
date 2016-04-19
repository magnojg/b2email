class CreateAdminCompanies < ActiveRecord::Migration
  def change
    create_table :admin_companies do |t|
      t.string :name
      t.string :trading_name
      t.string :registration_number
      t.text :address

      t.timestamps null: false
    end
  end
end
