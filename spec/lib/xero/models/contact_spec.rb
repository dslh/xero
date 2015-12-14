require 'spec_helper'

describe Xero::Models::Contact, type: :model do

  it { is_expected.to validate_presence_of(:name) }
end
