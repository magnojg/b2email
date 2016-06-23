class CreateLoginBgImages < ActiveRecord::Migration
  def change
    create_table :login_bg_images do |t|

      t.timestamps null: false
    end
  end
end
