require 'spec_helper'

describe Xero::Models::LineItem, type: :model do

  it { is_expected.to validate_presence_of(:description) }

  it { is_expected.to validate_presence_of(:quantity) }

  it { is_expected.to validate_presence_of(:unit_amount) }

  it { is_expected.to validate_presence_of(:account_code) }

  context 'when item is set' do
    let(:line_item) do
      Xero::Models::LineItem.new(item: Xero::Models::Item.new)
    end

    it 'should not require description' do
      expect(line_item).not_to validate_presence_of(:description)
    end

    it 'should not require unit amount' do
      expect(line_item).not_to validate_presence_of(:unit_amount)
    end

    it 'should not require account code' do
      expect(line_item).not_to validate_presence_of(:account_code)
    end
  end
end
