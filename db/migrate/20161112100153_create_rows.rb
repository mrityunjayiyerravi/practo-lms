class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.integer  :rowrack_id
      t.integer  :library_id
      t.string   :row_number, limit: 255
      t.timestamps null: false
    end
  end
end
