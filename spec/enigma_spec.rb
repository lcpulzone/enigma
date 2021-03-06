require 'rspec'
require 'date'
require './lib/key'
require './lib/enigma'

RSpec.describe Enigma do
  context 'initialization' do
    it 'exists' do
      enigma = Enigma.new

      expect(enigma).to be_an_instance_of(Enigma)
    end
  end

  context 'encrypt' do
    it 'can encrypt a message' do
      enigma = Enigma.new

      actual = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

      expect(enigma.encrypt('hello world', '02715', '040895')).to eq(actual)
    end

    it 'can encrypt a name' do
      enigma = Enigma.new

      actual = {
        encryption: "zaqlp `lgvw",
        key: "51387",
        date: "042421"
      }

      expect(enigma.encrypt('amber leigh', '51387', '042421')).to eq(actual)
    end
  end

  context 'decrypt' do
    it 'can decrypt a message' do
      enigma = Enigma.new

      actual = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }

      expect(enigma.decrypt('keder ohulw', '02715', '040895'))
    end

    it 'can decrypt a name' do
      enigma = Enigma.new

      actual = {
        decryption: "amber leigh",
        key: "51387",
        date: "042421"
      }

      expect(enigma.decrypt('zaqlp algvw', '51387', '042421'))
    end
  end
end
