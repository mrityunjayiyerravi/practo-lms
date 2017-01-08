class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :book_id
      t.integer :total_copies, default: 0
      t.integer :lost_copies, default: 0
      t.integer :checked_out, default: 0
      t.integer :library_id
      t.integer :rowrack_id
      t.integer :row_id
      t.timestamps null: false
    end
  end
end
