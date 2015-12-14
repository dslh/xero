require 'spec_helper'

describe Xero::Models::Address, type: :model do

  describe 'validations' do

    it { is_expected.to validate_presence_of(:address_type) }

    it { is_expected.to validate_presence_of(:attention_to) }

    it { is_expected.to validate_presence_of(:address_line1) }

    it { is_expected.to validate_presence_of(:city) }

    it { is_expected.to validate_presence_of(:region) }

    it { is_expected.to validate_presence_of(:postal_code) }

    it { is_expected.to validate_presence_of(:country) }
  end
end
