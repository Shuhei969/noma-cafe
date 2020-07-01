class RenameNameColumnToArticles < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :name, :shop_name
  end
end
