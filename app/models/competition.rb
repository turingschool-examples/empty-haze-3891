class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams
  has_many :players, through: :teams

  validates_presence_of :name, :location, :sport

  def avg_age
    self.join('players.*')
        .select(avg(:age))
  end
end
