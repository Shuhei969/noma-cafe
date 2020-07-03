class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.references :prefecture, null: false
      t.string :name
      t.timestamps
    end
  end
end
