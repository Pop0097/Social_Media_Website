class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments

  validates :name, presence: true
  validates :username, presence: true
  validates :phone_number, presence: true
  validates :birth_month, presence: true
  validates :birth_year, presence: true, numericality: {less_than_or_equal_to: 2020, greater_than: 1900}
  validates :sex, presence: true

  #no longer using birth_date or age

end
