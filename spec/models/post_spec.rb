# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }
    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post.title = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        post.title = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '20文字以下であること: 21文字は×' do
        post.title = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context 'captionカラム' do
      it '空欄でないこと' do
        post.caption = ''
        is_expected.to eq false
      end
      it '500文字以下であること: 501文字は×' do
        post.caption = Faker::Lorem.characters(number: 501)
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        post.caption = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
    end

    context 'rateカラム' do
      it '空欄でないこと' do
        post.rate = ''
        is_expected.to eq false
      end
    end

    context 'jewelカラム' do
      it '空欄でないこと' do
        post.jewel = ''
        is_expected.to eq false
      end
    end

  end
end