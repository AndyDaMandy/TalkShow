# frozen_string_literal: true

# User Model using devise.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { minimum: 3, maximum: 35 }
  validates :first_name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :last_name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :age, numericality: { more_than_or_equal_to: 13, less_than_or_equal_to: 100, only_integer: true }
  validates :words_to_live_by, length: { maximum: 300 }
  validates :location, length: { maximum: 120 }

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  has_many :reviews, dependent: :destroy
  has_many :viewings, dependent: :destroy
  has_many :recommends, dependent: :destroy
  has_many :inverse_recommends, class_name: 'Recommend', foreign_key: 'friend_id'
  has_many :chats, dependent: :destroy

  has_one_attached :avatar

  enum role: %i[user moderator admin]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :user
  end

end
