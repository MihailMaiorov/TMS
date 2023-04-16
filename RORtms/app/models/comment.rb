class Comment < ApplicationRecord
  validates :message, presence: true, length: { maximum: 255 }
  validates :customer_id, uniqueness: { scope: :book_id, message: 'Comment already exists for this book.' }
end
