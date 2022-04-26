require "rails_helper"

RSpec.describe Team, type: :model do
  describe "validations" do
    it { should validate_presence_of(:hometown) }
    it { should validate_presence_of(:nickname) }
  end

  describe "relationships" do
    it { should have_many :players }
    it { should have_many(:competition_teams) }
    it { should have_many(:competitions).through(:competition_teams) }
  end
end
