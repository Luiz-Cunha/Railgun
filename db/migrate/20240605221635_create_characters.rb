class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :image_url
      t.text :details
      t.integer :rating

      t.timestamps
    end
  end
end
