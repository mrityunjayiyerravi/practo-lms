class CreateRowracks < ActiveRecord::Migration
  def change
    create_table :rowracks do |t|
      t.integer  :library_id
      t.string   :category, limit: 255
      t.string   :genre, limit: 255
      t.timestamps null: false
    end
  end
end
