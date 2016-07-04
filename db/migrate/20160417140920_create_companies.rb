class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :trading_name
      t.string :registration_number
      t.text :address
      t.text :domain_url

      t.timestamps null: false
    end
  end
end
