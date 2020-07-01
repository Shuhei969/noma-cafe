class AddAdressToArticleAddressString < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :address, :string
  end
end
