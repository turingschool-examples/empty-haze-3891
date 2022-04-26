require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:competition_teams) }
    it { should have_many(:teams).through(:competition_teams) }
    it { should have_many(:players).through(:teams) }
  end
end
