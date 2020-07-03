class AddAutherCommnetToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :auther_comment, :string
    remove_reference :articles, :city, index: true
  end
end
