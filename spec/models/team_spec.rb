require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should have_many :players }
    it { should have_many :competitions }
  end
end
