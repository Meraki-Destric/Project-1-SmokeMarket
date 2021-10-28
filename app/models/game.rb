class Game < ApplicationRecord
  has_one_attached :thumbnail
  belongs_to :user
  has_many :libraries
  # Checks how many games are within the library based on the user
  has_many :added_games, through: :libraries, source: :user
end
