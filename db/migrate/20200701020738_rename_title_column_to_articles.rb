class RenameTitleColumnToArticles < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :title, :name
  end
end
