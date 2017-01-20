# Tests for Computer class
# spec/computer_spec.rb
require 'player'
require 'computer'
include Connect_Four

describe Computer do

  describe 'computer generated coordinates' do
    it 'create random x coordinate' do
      expect(0..5).to cover(computer.create_coordinates[0])
    end

    it 'create random y coordinate' do
      expect(0..5).to cover(computer.create_coordinates[1])
    end
  end
end