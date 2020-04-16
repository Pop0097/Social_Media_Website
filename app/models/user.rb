class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  #for profile picture
  mount_uploader :avatar, AvatarUploader

  #validates User parameters
  validates :name, presence: true
  validates :username, presence: true, length: {maximum: 8}
  validates :birth_month, presence: true
  validates :birth_year, presence: true, numericality: {less_than_or_equal_to: 2006, greater_than: 1900}
  validates :sex, presence: true

  #sets login so no getter or setter methods are required
  attr_accessor :login

  #Sets the value for :login
  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first #allows user to input username or email to log in
  end

  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_follows, source: :followed

  has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower

  #method allows current user to follow "other"
  def follow(other)
    active_follows.create(followed_id: other.id)
  end

  #method allows current user to unfollow "other"
  def unfollow(other)
    active_follows.find_by(followed_id: other.id).destroy
  end

  #returns true if the current user is following "other"
  def following?(other)
    following.include?(other)
  end
end
