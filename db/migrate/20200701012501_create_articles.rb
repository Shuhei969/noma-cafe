class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.references :prefecture
      t.references :city
      t.integer :wifi
      t.integer :outlet
      t.text :content
      t.text :shop_url
      t.timestamps
    end
  end
end
