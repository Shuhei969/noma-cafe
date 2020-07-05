class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.integer :gender
      t.text :introduction
      t.references :user, null: false
      t.timestamps
    end
  end
end
