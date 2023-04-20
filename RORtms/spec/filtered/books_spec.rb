require 'rails_helper'

describe Filtered::Books do
  describe '.call' do
    subject(:filtered_books) { described_class.call(filtered_params) }

    let!(:author) { Author.create }
    let!(:supplier) { Supplier.create }
    let(:book1) { Book.create!(title: 'I sing good!!!', price: 101, views: 201_200, author_id: author.id, supplier_id: supplier.id) }
    let(:book2) { Book.create!(title: 'You sing good!!!', price: 99, views: 20_200, author_id: author.id, supplier_id: supplier.id) }
    let(:book3) { Book.create!(title: 'I am good!!!', price: 97, views: 401_200, author_id: author.id, supplier_id: supplier.id) }

    context 'when all filters is given' do
      let(:filtered_params) { { title: 'sing', price: '95', views: '40000' } }

      it 'returns one book' do
        expect(filtered_books).to eq([book1])
      end
    end

    context 'when two filters is given' do
      let(:filtered_params) { { title: 'sing', price: '95' } }

      it 'returns two book' do
        expect(filtered_books).to eq([book1, book2])
      end
    end

    context 'when one filters is given' do
      let(:filtered_params) { { title: 'am' } }

      it 'returns one book' do
        expect(filtered_books).to eq([book3])
      end
    end

    context 'no filters is given' do
      let(:filtered_params) { {} }

      it 'returns all book' do
        expect(filtered_books).to eq([book1, book2, book3])
      end
    end
  end
end
