class CreateAuthorBooks < ActiveRecord::Migration
  def change
    create_table :author_books do |t|
      t.integer    :author_id, index: true
      t.integer    :book_id, index: true
      t.timestamps null: false
    end
  end
end
