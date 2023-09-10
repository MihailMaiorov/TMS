require 'rails_helper'

describe Concatinationable::Words do
  describe '.call' do
    subject(:concatenate_string) { described_class.call(arg1, arg2) }

    context 'when two args is strings' do
      let(:arg1) { 'first' }
      let(:arg2) { 'second' }
      let(:result) { 'First second' }

      it 'returns concatenate string' do
        expect(concatenate_string).to eq(result)
      end
    end

    context 'when first arg is nil' do
      let(:arg1) { nil }
      let(:arg2) { 'second' }
      let(:result) { 'second' }

      it 'returns second arg as string' do
        expect(concatenate_string).to eq(result)
      end
    end

    context 'when second arg is nil' do
      let(:arg1) { 'first' }
      let(:arg2) { nil }
      let(:result) { 'First' }

      it 'returns first arg as string' do
        expect(concatenate_string).to eq(result)
      end
    end
  end
end

# Which option is better?

describe Concatinationable::Words do
  describe '.call' do
    context 'when two args is strings' do
      it 'returns concatenate string' do
        expect(described_class.call('first', 'second')).to eq('First second')
      end
    end

    context 'when first arg is nil' do
      it 'returns second arg as string' do
        expect(described_class.call(nil, 'second')).to eq('second')
      end
    end

    context 'when second arg is nil' do
      it 'returns first arg as string' do
        expect(described_class.call('first', nil)).to eq('First')
      end
    end
  end
end
