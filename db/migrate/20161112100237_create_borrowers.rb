class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name, limit: 255
      t.string :last_name, limit: 255
      t.string :mobile_number, limit: 10
      t.string :city, limit: 255
      t.string :state, limit: 255
      t.string :country, limit: 255
      t.timestamps null: false
    end
  end
end
