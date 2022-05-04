class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name, null: false
      t.string :address
      t.text :url
      t.integer :category_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
