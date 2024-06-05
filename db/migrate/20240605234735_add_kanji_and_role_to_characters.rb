class AddKanjiAndRoleToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :kanji, :string
    add_column :characters, :role, :string
  end
end
