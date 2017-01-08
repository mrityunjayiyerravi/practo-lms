class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string   :first_name, limit: 255
      t.string   :last_name, limit: 255
      t.string   :country_of_origin, limit: 255
      t.text     :mini_bio
      t.string   :wiki_link
      t.timestamps null: false
    end
  end
end
