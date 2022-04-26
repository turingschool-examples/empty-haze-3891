require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to(:team) }
  it { should have_many(:competition_teams).through(:team) }
  it { should have_many(:competitions).through(:competition_teams) }
end
