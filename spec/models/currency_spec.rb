require 'rails_helper'

RSpec.describe Currency, :type => :model do
  it { should have_many :countries }
end
