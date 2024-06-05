class CreateUserEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :user_evaluations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.text :comments

      t.timestamps
    end
  end
end
