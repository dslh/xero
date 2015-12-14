require 'spec_helper'

describe Xero::Models::Invoice, type: :model do
  before { configure }

  it { is_expected.to validate_presence_of(:type) }

  it { is_expected.to validate_presence_of(:contact) }

  it 'should validates presence of line items' do
    subject.line_items = nil
    subject.valid?

    expect(subject.errors).to include(:line_items)
  end

  describe 'defaults' do
    let(:invoice) { Xero::Models::Invoice.new }

    it 'should default due date to 30 days from now' do
      expect(invoice.due_date.to_s).to eql(Date.parse(30.days.from_now.to_s).to_s)
    end
  end
end
