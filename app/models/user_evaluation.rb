class UserEvaluation < ApplicationRecord
  belongs_to :user
  belongs_to :character

  validates :comments, :userrating, presence: true
end
