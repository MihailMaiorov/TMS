class Joke < ApplicationRecord
  belongs_to :category

  validates_uniqueness_of :body
end
