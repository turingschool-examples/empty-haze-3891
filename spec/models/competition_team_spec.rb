require 'rails_helper'

RSpec.describe CompetitionTeam, type: :model do
  describe "associations" do
    it { should belong_to :competition }
    it { should belong_to :team }
  end

end
