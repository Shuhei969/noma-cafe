class ChangeArticleColumnToNotNull < ActiveRecord::Migration[6.0]
  def change
    remove_reference :articles, :prefecture, index: true
    remove_reference :articles, :area, index: true
  end
end
