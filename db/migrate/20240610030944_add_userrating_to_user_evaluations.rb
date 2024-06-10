class AddUserratingToUserEvaluations < ActiveRecord::Migration[7.1]
  def change
    add_column :user_evaluations, :userrating, :integer
  end
end
