class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  Associated with many games. If this user is deleted, the games associated with them will also be deleted
  has_many :games, dependent: :destroy
  has_many :libraries
  has_many :library_additions, through: :libraries, source: :game
end
