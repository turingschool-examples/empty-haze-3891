class Player < ApplicationRecord
  belongs_to :team
  has_many :team_competitions, through: :team
  has_many :competitions, through: :team_competitions

  def self.average_player_age
    average(:age)
  end
end