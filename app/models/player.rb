class Player < ApplicationRecord
  belongs_to :team
  has_many :competition_teams, through: :team
  has_many :competitions, through: :competition_teams

end
