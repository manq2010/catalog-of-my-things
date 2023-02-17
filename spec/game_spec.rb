require 'rspec'
require 'date'
require_relative 'spec_helper'

RSpec.describe Game do
  let(:name) { 'Super Mario Bros.' }
  let(:published_date) { Date.parse('1985-09-13') }
  let(:last_played_at) { Date.parse('2021-02-01') }
  let(:multiplayer) { true }
  let(:game) { Game.new(name, published_date, last_played_at, multiplayer) }

  describe '#initialize' do
    it 'sets the name attribute' do
      expect(game.name).to eq(name)
    end

    it 'sets the published_date attribute' do
      expect(game.published_date).to eq(published_date)
    end

    it 'sets the last_played_at attribute' do
      expect(game.last_played_at).to eq(last_played_at)
    end

    it 'sets the multiplayer attribute' do
      expect(game.instance_variable_get(:@multiplayer)).to eq(multiplayer)
    end
  end

  describe '#to_json' do
    it 'returns a hash with game data' do
      json = game.to_json
      expect(json['name']).to eq(name)
      expect(json['published_date']).to eq(published_date)
      expect(json['last_played_at']).to eq(last_played_at)
      expect(json['multiplayer']).to eq(multiplayer)
    end
  end

  describe '#can_be_archived?' do
    context 'when last played more than 2 years ago' do
      let(:last_played_at) { Date.parse('2019-01-01') }

      it 'returns true' do
        expect(game.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when last played less than 2 years ago' do
      let(:last_played_at) { Date.today }

      it 'returns false' do
        expect(game.send(:can_be_archived?)).to eq(false)
      end
    end
  end
end
