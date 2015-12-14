require 'spec_helper'

describe Xero::Models::BaseModel, type: :model do

  describe '#initialize' do
    let(:model) { Xero::Models::BaseModel.new }

    it 'should set new_record to true' do
      expect(model.new_record).to be_truthy
    end
  end

  describe '#save' do
    context 'when client is blank' do
      let(:model) { Xero::Models::BaseModel.new }

      it 'should raise an error' do
        expect { model.save }.to raise_error(StandardError)
      end
    end
  end

  describe '#xero_attributes' do
    let(:model) do
      Xero::Models::BaseModel.new id: 'asdf'
    end


    it 'should not include the id' do
      expect(model.xero_attributes['BaseModelId']).to be_blank
    end

    it 'should camelize the attributes' do
      expect(model.xero_attributes(x_attr: 'something')['XAttr']).to eql('something')
    end
  end
end
