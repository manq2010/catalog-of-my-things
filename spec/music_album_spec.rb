require 'spec_helper'

describe MusicAlbum do
  let(:music_album) { MusicAlbum.new('Nasheed', 2023) }

  describe '#initialize' do
    it 'should initialize a MusicAlbum obsject' do
      expect(music_album).to be_an_instance_of(MusicAlbum)
    end

    it 'sets the on_spotify attributes' do
      expect(music_album).to have_attributes(on_spotify: 'Nasheed')
      expect(music_album).to have_attributes(published_date: 2023)
    end
  end

  describe '#to_json' do
    it 'returns a hash representation of the MiscAlbum object' do
      expect(music_album.to_json).to eq(
        { 'on_spotify' => 'Nasheed',
          'published_date' => 2023 }
      )
    end
  end

  # describe '#can_be_archived?' do
  #   context 'when on_spotify is not false' do
  #     let(:music_album) { MusicAlbum.new('Nasheed', 2002) }

  #     it 'returns true' do
  #       allow(music_album).to receive(:on_spotify).and_return('true')
  #       expect(music_album.send(:can_be_archived?)).to be_truthy
  #     end
  #   end
  # end

  describe '#can_be_archived?' do
    context 'when on_spotify is not false' do
      let(:music_album) { MusicAlbum.new(true, 2002) }

      it 'returns true' do
        expect(music_album.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when on_spotify is false' do
      let(:music_album) { MusicAlbum.new(false, 2002) }

      it 'returns false' do
        expect(music_album.send(:can_be_archived?)).to be_falsey
      end
    end

    context 'when on_spotify is nil' do
      let(:music_album) { MusicAlbum.new(nil, 2002) }

      it 'returns false' do
        expect(music_album.send(:can_be_archived?)).to be_falsey
      end
    end
  end
end
