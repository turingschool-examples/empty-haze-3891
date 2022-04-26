class Player < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true

  belongs_to :team
  has_many :competitions, through: :team
end
