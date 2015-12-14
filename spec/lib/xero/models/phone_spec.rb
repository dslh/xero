require 'spec_helper'

describe Xero::Models::Phone, type: :model do

  describe 'validations' do

    it { is_expected.to validate_presence_of(:phone_type) }

    it { is_expected.to validate_presence_of(:number) }

    it { is_expected.to validate_presence_of(:area_code) }

    it { is_expected.to validate_presence_of(:country_code) }
  end
end
