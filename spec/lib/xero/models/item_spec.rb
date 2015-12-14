require 'spec_helper'

describe Xero::Models::Item, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:code) }
  end

  describe 'to_xero_xml' do
    let(:item) do
      Xero::Models::Item.new(
        purchase_details: purchase_detail_attributes,
        sales_details: sales_detail_attributes,
        id: '34b3fc86-483e-4112-8106-9b23d36f925c',
        code: 'Monster',
        description: 'Test description'
      )
    end

    let(:purchase_detail_attributes) do
      { unit_price: 100, account_code: '620', tax_type: 'NONE' }
    end

    let(:sales_detail_attributes) do
      { unit_price: 550, account_code: '200', tax_type: 'NONE' }
    end

    subject { item.to_xero_xml }

    it 'should include the purchase detail' do
      expect(subject).to match(/PurchaseDetails/)
    end

    it 'should include the sales detail' do
      expect(subject).to match(/SalesDetails/)
    end

    it 'should include the code' do
      expect(subject).to match(/Code/)
    end

    it 'should include the code value' do
      expect(subject).to match(/Monster/)
    end

    it 'should include the unit price' do
      expect(subject).to match(/UnitPrice/)
    end

    it 'should include the description' do
      expect(subject).to match(/Description/)
    end

    it 'should include the description value' do
      expect(subject).to match(/Test description/)
    end
  end

  describe '#purchase_details=' do

    let(:item) { Xero::Models::Item.new }

    before do
      item.purchase_details = {
        unit_price: 100, account_code: '620', tax_type: 'NONE'
      }
    end

    it 'should add a new item detail to the item' do
      expect(item.purchase_details).to be_a(Xero::Models::ItemDetail)
    end

    it 'should set the unit price' do
      expect(item.purchase_details.unit_price).to eql(100.0)
    end

    it 'should set the account code' do
      expect(item.purchase_details.account_code).to eql('620')
    end

    it 'should set the tax type' do
      expect(item.purchase_details.tax_type).to eql('NONE')
    end
  end

  describe '#sales_details=' do
    let(:item) { Xero::Models::Item.new }

    before do
      item.sales_details = {
        unit_price: 550, account_code: '200', tax_type: 'NONE'
      }
    end

    it 'should add a new item detail to the item' do
      expect(item.sales_details).to be_a(Xero::Models::ItemDetail)
    end

    it 'should set the unit price' do
      expect(item.sales_details.unit_price).to eql(550.0)
    end

    it 'should set the account code' do
      expect(item.sales_details.account_code).to eql('200')
    end

    it 'should set the tax type' do
      expect(item.sales_details.tax_type).to eql('NONE')
    end
  end
end
