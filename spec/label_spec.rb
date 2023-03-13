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

    it 'sets the label of the item to be the current label' do
      label.add_item(item)
      expect(item.label).to eq(label)
    end

    it 'does not add the same item multiple times' do
      label.add_item(item)
      expect(label.items.size).to eq(1)
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
