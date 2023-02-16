require 'spec_helper'

describe Label do
  let(:label) { Label.new('Gift', 'blue') }
  let(:item) { Item.new(2022) }

  describe '#initialize' do
    it 'creates a new Label object' do
      expect(label).to be_an_instance_of(Label)
    end

    it 'sets the title and color attributes' do
      expect(label).to have_attributes(title: 'Gift')
      expect(label).to have_attributes(color: 'blue')
    end
  end

  describe '#add_items' do
    it 'starts with no items' do
      expect(label.items).to be_empty
    end

    it 'add items' do
      label.add_items(item)
      expect(label.items).to include(item)
      #   expect(label.items).to eq(item)
    end
  end

  describe '#to_json' do
    it 'returns a hash representation of the Label object' do
      expect(label.to_json).to eq(
        { 'title' => 'Gift', 'color' => 'blue' }
      )
    end
  end
end
