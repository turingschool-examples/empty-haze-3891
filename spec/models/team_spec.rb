require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "associations" do
    it { should have_many :players }
    it { should have_many(:competitions).through(:competition_teams) }
    it { should have_many(:competition_teams) }
  end

  describe "validations" do
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:hometown) }
  end
end
