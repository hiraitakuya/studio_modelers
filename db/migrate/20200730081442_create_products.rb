class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.references :user, optional: true
      t.timestamps
    end
    add_foreign_key :products, :users
  end
end
