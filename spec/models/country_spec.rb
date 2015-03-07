require 'rails_helper'

RSpec.describe Country, type: :model do
  it { should belong_to :currency }
  it { should have_and_belong_to_many :trips }
end
