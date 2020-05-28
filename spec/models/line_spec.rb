require 'rails_helper'

RSpec.describe Line, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:place) }
  end
end
