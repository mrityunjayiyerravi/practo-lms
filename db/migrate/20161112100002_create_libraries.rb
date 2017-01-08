class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.text     :name
      t.text     :address
      t.string   :city, limit: 255
      t.string   :state, limit: 255
      t.string   :country, limit: 255
      t.integer  :total_capacity, default: 0
      t.timestamps null: false
    end
  end
end
