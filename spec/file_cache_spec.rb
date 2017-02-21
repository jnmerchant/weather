require 'file_cache'

describe FileCache do

  before do
    File.delete 'cache.txt' if File.exists? 'cache.txt'
    @cache = FileCache.new
  end

  describe '#set' do
    context 'when one set is called' do
      it 'adds a value to the cache' do
        @cache.set 'a', 100

        contents = File.read 'cache.txt'

        expect(contents).to eq '{"a":100}'
      end
    end

    context 'when multiple' do
      it 'sets all values' do
        @cache.set 'a', 1
        @cache.set 'b', 2
        @cache.set 'c', 3

        contents = File.read 'cache.txt'

        expect(contents).to eq '{"a":1,"b":2,"c":3}'
      end
    end

    context 'when setting same key twice' do
      it 'updates value' do
        @cache.set 'pets', 'Horace'
        @cache.set 'pets', 'Jim'

        contents = File.read 'cache.txt'

        expect(contents).to eq '{"pets":"Jim"}'
      end
    end
  end

  describe '#get' do
    context 'get request not in cache' do
      it 'returns nil' do
        response = @cache.get('pets')

        expect(response.nil?).to eq true
      end
    end

    context 'get request in cache' do
      it 'returns the stored value' do
        cache = File.new('cache.txt', 'w')
        cache.write '{"pets":"Jim"}'
        cache.flush

        response = @cache.get('pets')

        expect(response).to eq 'Jim'
      end
    end
  # end

  # describe '#key?' do
  #   context 'get key not in cache' do
  #     it 'returns false' do
  #       response = @cache.key?('pets')
  #
  #       expect(response).to eq false
  #     end
  #   end
  #
  #   context 'get key in cache' do
  #     it 'returns true' do
  #       @cache.set 'pets', ['Tom', 'Jerry']
  #       response = @cache.key?('pets')
  #
  #       expect(response).to eq true
  #     end
  #   end
  # end
  #
  # describe '#clear' do
  #   it 'clears the hash' do
  #     @cache.set 'pets', ['Tom', 'Jerry']
  #     response = @cache.key?('pets')
  #     @cache.clear
  #
  #     expect(@cache.key?('pets')).to eq false
  #   end
  end
end
