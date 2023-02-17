require 'spec_helper'

describe Genre do
  let(:genre) { Genre.new('Ibnballo') }
  let(:item) { Item.new(2023) }

  describe '#initialize' do
    it 'creates a new Genre object' do
      expect(genre).to be_an_instance_of(Genre)
    end

    it 'sets the name attributes' do
      expect(genre).to have_attributes(name: 'Ibnballo')
    end
  end

  describe '#add_items' do
    it 'starts with no items' do
      expect(genre.items).to be_empty
    end

    it 'add items' do
      genre.add_items(item)
      expect(genre.items).to include(item)
    end
  end

  describe '#to_json' do
    it 'returns a hash representation of the Genre object' do
      expect(genre.to_json).to eq(
        { 'name' => 'Ibnballo' }
      )
    end
  end
end
