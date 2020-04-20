class Comment < ApplicationRecord
  belongs_to :post

  #validates Comment parameters
  validates :commenter, presence: true
  validates :body, presence: true, length: {maximum: 150}
end
