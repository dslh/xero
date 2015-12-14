require 'spec_helper'

describe Xero::Models::ItemDetail, type: :model do

  it { is_expected.to validate_presence_of(:unit_price) }

  it { is_expected.to validate_presence_of(:account_code) }

  it { is_expected.to validate_presence_of(:tax_type) }
end
