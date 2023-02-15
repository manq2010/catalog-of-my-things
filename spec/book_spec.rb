require 'spec_helper'

describe Book do
  let(:book) { Book.new('Mancoba Sihlongonyane', 'new', 2018) }

  describe '#initialize' do
    it 'should initialize a Book obsject' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'sets the publisher and cover_state attributes' do
      expect(book).to have_attributes(publisher: 'Mancoba Sihlongonyane')
      expect(book).to have_attributes(cover_state: 'new')
      expect(book).to have_attributes(published_date: 2018)
    end
  end

  describe '#to_json' do
    it 'returns a hash representation of the Book object' do
      expect(book.to_json).to eq(
        { 'publisher' => 'Mancoba Sihlongonyane',
          'cover_state' => 'new',
          'published_date' => 2018 }
      )
    end
  end

  describe '#can_be_archived?' do
    context 'when cover state is not bad' do
      let(:book) { Book.new('Mancoba Sihlongonyane', 'new', 2015) }

      it 'returns false' do
        allow(book).to receive(:cover_state).and_return('new')
        expect(book.send(:can_be_archived?)).to be_falsey
      end
    end

    context 'when cover state is bad' do
      let(:book) { Book.new('Mancoba Sihlongonyane', 'bad', 2005) }

      it 'returns false' do
        allow(book).to receive(:published_more_than_10_years_ago?).and_return(true)
        allow(book).to receive(:cover_state).and_return('bad')
        expect(book.send(:can_be_archived?)).to be_falsey
      end
    end

    context 'when published more than 10 years ago and cover state is not bad' do
      let(:book) { Book.new('Mancoba Sihlongonyane', 'new', 2005) }

      it 'returns true' do
        allow(book).to receive(:published_more_than_10_years_ago?).and_return(true)
        allow(book).to receive(:cover_state).and_return('new')
        expect(book.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when published less than 10 years ago and cover state is not bad' do
      let(:book) { Book.new('Mancoba Sihlongonyane', 'new', 2019) }

      it 'returns false' do
        allow(book).to receive(:published_more_than_10_years_ago?).and_return(false)
        allow(book).to receive(:cover_state).and_return('new')
        expect(book.send(:can_be_archived?)).to be_falsey
      end
    end
  end
end
