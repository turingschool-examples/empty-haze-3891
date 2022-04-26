class Team < ApplicationRecord
  validates :hometown, presence: true
  validates :nickname, presence: true

  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams
end
