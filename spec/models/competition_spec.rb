require 'rails_helper'

RSpec.describe Competition, type: :model do
  context 'associations' do
    describe 'relationships' do
      it { should have_many(:team_comps)}
      it { should have_many(:teams).through(:team_comps)}
    end

    describe 'validations' do
      it {should validate_presence_of :name}
      it {should validate_presence_of :location}
      it {should validate_presence_of :sport}
    end
  end
end
