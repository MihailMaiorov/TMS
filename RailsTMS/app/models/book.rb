class Book < ApplicationRecord
  has_one_attached :image
  has_many_attached :pictures

  validates :image, blob: { content_type: %w[image/png image/jpg image/jpeg], size_range: 1..5.megabytes }
  validates :pictures, blob: { content_type: %w[image/png image/jpg image/jpeg], size_range: 1..5.megabytes }
end
