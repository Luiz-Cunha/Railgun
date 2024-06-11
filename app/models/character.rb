class Character < ApplicationRecord
  has_many :user_evaluations

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  def calculate_rating
    return self.rating if self.user_evaluations.empty?
    total_rating = self.user_evaluations.sum { |evaluation| evaluation.userrating }
    self.rating = total_rating / self.user_evaluations.length
  end
end
