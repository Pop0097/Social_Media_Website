class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  #validates Post parameters
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 5}
end
