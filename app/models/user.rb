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

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  has_many :reviews
  has_many :viewings

end
