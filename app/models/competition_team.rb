class CompetitionTeam < ApplicationRecord
  belongs_to :team
  belongs_to :competition
  has_many :players, through: :team

end
