class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :image_url, null: false
      t.references :product, null: false
      t.timestamps
    end
    add_foreign_key :photos, :products
  end
end
