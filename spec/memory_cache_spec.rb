require 'memory_cache'

describe MemoryCache do

  before do
    @cache = MemoryCache.new
  end

  describe '#set' do
    it 'adds a value to the cache' do
      response = @cache.set 'a', 100

      expect(response).to eq 100
    end
  end

  describe '#get' do
    context 'get request not in cache' do
      it 'returns nil' do
        response = @cache.get('b')

        expect(response.nil?).to eq true
      end
    end

    context 'get request in cache' do
      it 'returns the stored value' do
        @cache.set 'a', [100, 200]
        response = @cache.get('a')

        expect(response).to eq [100, 200]
      end
    end
  end

  describe '#key?' do
    context 'get key not in cache' do
      it 'returns false' do
        response = @cache.key?('b')

        expect(response).to eq false
      end
    end

    context 'get key in cache' do
      it 'returns true' do
        @cache.set 'b', 300
        response = @cache.key?('b')

        expect(response).to eq true
      end
    end
  end

  describe '#clear' do
    it 'clears the hash' do
      @cache.set 'b', [300, 400]
      response = @cache.key?('b')
      @cache.clear

      expect(@cache.key?('b')).to eq false
    end
  end
end
