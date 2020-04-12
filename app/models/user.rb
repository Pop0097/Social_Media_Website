class User < ApplicationRecord

  #sets login so no getter or setter methods are required
  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  #validates User parameters
  validates :name, presence: true
  validates :username, presence: true, length: {maximum: 8}
  validates :birth_month, presence: true
  validates :birth_year, presence: true, numericality: {less_than_or_equal_to: 2006, greater_than: 1900}
  validates :sex, presence: true


  #Sets the value for :login
  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first #allows user to input username or email to log in
  end

end
