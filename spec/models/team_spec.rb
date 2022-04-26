require 'rails_helper'

RSpec.describe Team, type: :model do
  context 'associations' do
    describe "relationships" do
      it { should have_many :players }
      it { should have_many :team_comps}
      it { should have_many(:competitions).through(:team_comps)}
    end

    describe 'validations' do
      it {should validate_presence_of :hometown}
      it {should validate_presence_of :nickname}
    end
  end
end
