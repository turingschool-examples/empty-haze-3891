class Competition < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :sport, presence: true

  has_many :competition_teams
  has_many :teams, through: :competition_teams
  has_many :players, through: :teams

  def avg_player_age
    player.average(:age)
  end
end
