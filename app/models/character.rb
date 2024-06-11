class Character < ApplicationRecord
  has_many :user_evaluations

  def calculate_rating
    return self.rating if self.user_evaluations.empty?
    total_rating = self.user_evaluations.sum { |evaluation| evaluation.userrating }
    self.rating = total_rating / self.user_evaluations.length
  end
end
