class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text     :name
      t.string   :isbn13, limit: 17
      t.string   :isbn10, limit: 13
      t.string   :cover_type, limit: 255
      t.string   :language, limit: 255
      t.string   :publisher, limit: 255
      t.datetime :published_year
      t.string   :genre, limit: 255
      t.string   :category, limit: 255
      t.timestamps null: false
    end
  end
end
