require 'rails_helper'

RSpec.describe TeamComp, type: :model do
  context 'associations' do
    describe 'relationships' do
      it {should belong_to :team}
      it {should belong_to :competition}
    end
  end
end
