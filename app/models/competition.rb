class Competition < ApplicationRecord
  validates :name, presence: true
  validates :location,  presence: true
  validates :sport,  presence: true

  has_many :team_competitions
  has_many :teams, through: :team_competitions
  has_many :players, through: :teams


  def avg_player_age
    Player.average(:age).to_i
  end
end
