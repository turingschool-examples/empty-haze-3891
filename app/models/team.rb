class Team < ApplicationRecord
  validates :nickname, presence: true
  validates :hometown,  presence: true

  has_many :players
  has_many :team_competitions
  has_many :competitions, through: :team_competitions

  def avg_player_age
    players.sum(&:age) / players.count
  end
end