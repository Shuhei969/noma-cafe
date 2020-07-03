class AddAreaIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :area, null: false, foreign_key: true
  end
end
