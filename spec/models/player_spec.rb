require "rails_helper"

RSpec.describe Player, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_numericality_of(:age) }
  end

  describe "relationships" do
    it { should belong_to :team }
    it { should have_many(:competitions).through(:team) }
  end
end
